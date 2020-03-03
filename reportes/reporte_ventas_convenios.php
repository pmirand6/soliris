<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");


require_once '../config/config.php';

include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _SG;
include $_SERVER['DOCUMENT_ROOT'] . _FN;


if (isset($_POST['sel_year'])&&(isset($_POST['sel_mes']))) {

    $anio = $_POST['sel_year'];
    $mes = $_POST['sel_mes'];
    
} else { 

    $query = "SELECT 
    YEAR(MAX(RM.fecha_venta)) as anio, MONTH(MAX(RM.fecha_venta)) as mes
    FROM soliris_maestro as RM LEFT JOIN institucion as I ON (RM.institucion = I.nombre)
    WHERE I.tipo = 'convenio'";

    $result = mysqli_query($db, $query);
	
    while ($row = mysqli_fetch_assoc($result)) {

        $anio = $row["anio"];
        $mes = $row["mes"];
    }

}

function nombremes($mes){
 setlocale(LC_TIME, 'es_ES.UTF-8');  
 $nombre=strftime("%B",mktime(0, 0, 0, $mes, 1, 2000)); 
 return $nombre;
}

$mes_sel = nombremes($mes);


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Reporte de Ventas x Convenio</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/reporte_ventas_convenios.css";

    </style>
    
</head>
<body>

    <section>
        <div class="container"> 
            <h1 class="display-1 text-center" id="titulo-venta">Ventas por convenio</h1>
            <hr>
                <h3 class="text-center">Reporte <?php echo ucwords($mes_sel) . " del " . $anio;?></h3>
            <br>
        </div>
    </section>


    <?php

    $year = "SELECT DISTINCT
    YEAR(RM.fecha_venta) AS 'Year'
    FROM
    soliris_maestro AS RM
    WHERE
    RM.fecha_venta != 0
    ORDER BY RM.fecha_venta DESC;";


    echo "<section class=\"pick-dates\">
    <form id=\"frm-dates\" class=\"frm-dates\"  method=\"POST\"> 
        <div class=\"row\">
    <div class=\"col-group\" style=\"margin-left: 28%;\">
                <div class=\"col-md-4\">
                    <label class=\"control-label\" for=\"sel_year\">Año</label>                         
                    <select id=\"sel_year\" class=\"form-control\" name=\"sel_year\">
    <option disabled value=\"\">Seleccione</option>";
                        if ($result = mysqli_query($db, $year)) { 
                         while ($row = mysqli_fetch_assoc($result)) {
                            echo '<option>'.$row['Year'].'</option>';
                        }
						
                    }
                    echo "</select>
                </div>
                <div class=\"col-md-4\">
                    <label class=\"control-label\" for=\"sel_mes\">Mes</label>                         
                    <select id=\"sel_mes\" class=\"form-control\" name=\"sel_mes\">
                        <option value=\"1\">Enero</option>
                        <option value=\"2\">Febrero</option>
                        <option value=\"3\">Marzo</option>
                        <option value=\"4\">Abril</option>
                        <option value=\"5\">Mayo</option>
                        <option value=\"6\">Junio</option>
                        <option value=\"7\">Julio</option>
                        <option value=\"8\">Agosto</option>
                        <option value=\"9\">Septiembre</option>
                        <option value=\"10\">Octubre</option>
                        <option value=\"11\">Noviembre</option>
                        <option value=\"12\">Diciembre</option>
                    </select>
                </div>
                <div class=\"col-md-4\">
                    <button type=\"submit\" class=\"btn btn-success\" style=\"
                    margin-top: 25px;\">Ejecutar</button>
                </div>    
            </div>
        </div>
    </form>
</section>
<br>
<br>
";

/* free result set */
mysqli_free_result($result);


?>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/HighCharts_Drilldown.php";
?>

<!-- Custom JS -->
<script type="text/javascript">
    $(document).ready(function() {
            // Create the chart - http://jsfiddle.net/6LXVQ/97/
            $('#container').highcharts({
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Ventas por Convenio'                    
                },
                xAxis: {
                    type: 'category'
                },
                plotOptions: {
                    series: {
                        borderWidth: 1,

                        dataLabels: {
                            enabled: true,
			                format: '<b>{point.name}</b>: {point.percentage:.1f}%',	
                            formatter: function() {
                                return Math.round(this.percentage*100)/100 + ' %';
                            },
                        }
                    }
                },
                series: [{
                    id: 'toplevel',
                    name: 'Convenios',
                    data: [
<?php
$SQL = "
SELECT RM.institucion as Nombre, COUNT(*) as Cantidad
FROM soliris_maestro as RM LEFT JOIN institucion as I ON (RM.institucion = I.nombre)
WHERE YEAR(RM.fecha_venta) = $anio AND MONTH(RM.fecha_venta) = $mes AND I.tipo = 'convenio'
GROUP BY RM.institucion

union
SELECT  'Privados', count(*) as Cantidad
FROM soliris_maestro as RM LEFT JOIN institucion as I on (RM.institucion = I.nombre)
WHERE YEAR(RM.fecha_venta) =$anio AND MONTH(RM.fecha_venta) = $mes AND (I.tipo='' or I.tipo is null);


;
";
$arr_data_str = "";
$arr_convenios = array();
                    if($result = mysqli_query($db, $SQL)){
                      
while ($row = mysqli_fetch_assoc($result)) {
                        $arr_data_str .= "{name: '" . $row["Nombre"] . "', y: " . $row["Cantidad"] . ", drilldown: 'Patologías " . $row["Nombre"] . "'},";
 array_push($arr_convenios, $row["Nombre"]);
}
$arr_data_str = trim($arr_data_str, ",");
echo $arr_data_str;
                    } else {
                      echo $arr_data_str;  
                    }
                    
?>
                 ],
}],
drilldown: {
    series: [
    <?php
    $arr_data_pat_str = "";
    foreach($arr_convenios as $convenio){
        $SQLdrillLvl1= "
        SELECT RM.patologia as Nombre, COUNT(*) as Cantidad
        FROM soliris_maestro as RM LEFT JOIN institucion as I ON (RM.institucion = I.nombre) LEFT JOIN auxiliar as AUX ON (RM.patologia = AUX.valor)
        WHERE  YEAR(RM.fecha_venta) = $anio AND MONTH(RM.fecha_venta) AND I.nombre = '$convenio'
        GROUP BY RM.patologia;
        ";
        $resultdrillLvl1 = mysqli_query($db, $SQLdrillLvl1);
        $arr_data_pat_str .= " {
            id:'Patologias " . $convenio . "',
            name: 'Patologias " . $convenio . "',
            data: [
            ";
            $arr_patologias = array();
            while ($rowdLvl1 = mysqli_fetch_assoc($resultdrillLvl1)) {
             $arr_data_pat_str .= "{name: '" . $rowdLvl1["Nombre"] . "', y: " . $rowdLvl1["Cantidad"] . ", drilldown: 'Dosis " . $convenio . ' ' . $rowdLvl1["Nombre"] . "'},";
             array_push($arr_patologias, $rowdLvl1["Nombre"]);
         }
         $arr_data_pat_str = trim($arr_data_pat_str, ",");
         $arr_data_pat_str .= "]},";
     }
//                    $arr_data_pat_str = trim($arr_data_pat_str, ",");
     echo $arr_data_pat_str;

     $arr_data_doc_str = "";
     foreach($arr_convenios as $convenio){

        foreach($arr_patologias as $patologia){
            $SQLdrillLvl2= "
            SELECT RM.dosis as Nombre, COUNT(*) as Cantidad
            FROM soliris_maestro as RM LEFT JOIN institucion as I ON (RM.institucion = I.nombre) LEFT JOIN auxiliar as AUX ON (RM.patologia = AUX.valor)
            WHERE  YEAR(RM.fecha_venta) = $anio AND MONTH(RM.fecha_venta) AND I.nombre = '$convenio' AND RM.patologia = '$patologia'
            GROUP BY RM.dosis;
            ";
            $resultdrillLvl2 = mysqli_query($db, $SQLdrillLvl2);
            $arr_data_doc_str .= " {
                id:'Dosis " . $convenio . ' ' . $patologia . "',
                name: 'Dosis " . $convenio . ' ' . $patologia . "',
                data: [
                ";
                while ($rowdLvl2 = mysqli_fetch_assoc($resultdrillLvl2)) {
                 $arr_data_doc_str .= "{name: '" . $rowdLvl2["Nombre"] . "', y: " . $rowdLvl2["Cantidad"] . "},";
             }
             $arr_data_doc_str = trim($arr_data_doc_str, ",");
             $arr_data_doc_str .= "]},";
         }

     }
     $arr_data_doc_str = trim($arr_data_doc_str, ",");
     echo $arr_data_doc_str;

     ?>
     ]
 }
})
});
</script>

<script type="text/javascript">
    var anio = "<?php echo $anio;?>";
    var mes = "<?php echo $mes;?>";
	if (mes){
		var mes_sel = $("#sel_mes option[value= "+ mes +" ]").attr("selected","selected");
		$('select[name="sel_year"]').val(anio);
		$("#sel_mes option[value= "+ mes +" ]").attr("selected","selected");    

		$("p span").last().after(mes_sel);
	}
</script>



</body>
</html>


