<?php 
    
require_once('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
	if(isset($_GET["fecha"]) AND !empty($_GET["fecha"])){
        $fecha = $_GET["fecha"];
	}
	else
	{
		$fecha= date('Y-m');
	}
		
	
    $anio = substr($fecha, 0, 4);

    $totYears = "";
    $SQL = "
            SELECT DISTINCT(YEAR(fecha_venta)) as anios
            FROM soliris_maestro
            WHERE estado IN ('NP','Historico');";

    $result = mysqli_query($db, $SQL);
    while ($row = mysqli_fetch_assoc($result)) {
        $totYears .= $row["anios"] . ",";
    }
    $totYears = trim($totYears,",");

    $firstAnio = substr($totYears, 0, 4);

    if (empty($firstAnio)) {
        $firstAnio = 'normal';
    }

    $RI = "";
    $SQLRI = "SELECT COUNT(*) as CANT, YEAR(RM.fecha_venta) FROM soliris_maestro as RM WHERE RM.tipo = 'RI' GROUP BY YEAR(RM.fecha_venta);";
    $resultRI = mysqli_query($db, $SQLRI);
    while ($row2 = mysqli_fetch_assoc($resultRI)) {
        $RI .= $row2["CANT"] . ",";
    }
    $RI = trim($RI,",");

    $FU = "";
    $SQLFU = "SELECT COUNT(*) as CANT, YEAR(RM.fecha_venta) FROM soliris_maestro as RM WHERE RM.tipo = 'FU' GROUP BY YEAR(RM.fecha_venta);";
    $resultFU = mysqli_query($db, $SQLFU);
    while ($row3 = mysqli_fetch_assoc($resultFU)) {
        $FU .= $row3["CANT"] . ",";
    }
    $FU = trim($FU,",");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, height=device-height, width=device-width, maximum-scale=1.0, user-scalable=no">

    <title>Reporte Tipos de Venta</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Custom CSS */

    </style>
</head>
<body>


    <div class="col-sm-12 col-xs-12 text-right" >
        <div class="area" style="min-width: 210px; height: 300px; margin: 0 auto; border: thin 1px"></div>
    </div>


    <script type="text/javascript">
        $(document).ready(function() {
            // Create the chart - http://jsfiddle.net/6LXVQ/97/
            $('.area').highcharts({
                chart: {
                    type: 'area'
                },
                title: {
                    text: '<b>' + 'Unidades Vendidas' + '</b>'
                },
                xAxis: {
                    allowDecimals: false,
                    labels: {
                        formatter: function () {
                            return this.value; // clean, unformatted number for year
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'Unidades Vendidas'
                    },
                    labels: {
                        formatter: function () {
                            return this.value / 1000 + 'k';
                        }
                    }
                },
                tooltip: {
                    pointFormat: '{series.name} vendidas <b>{point.y:,.0f}</b><br/>en {point.x}'
                },
                plotOptions: {
                    area: {
                        pointStart: '<?php echo $firstAnio;?>',
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                series: [{
                    name: 'FU',
                    <?php  echo "data: [" . $FU . "]";?>
                }, {
                    name: 'RI',
                    <?php  echo "data: [" . $RI . "]";?>
                }]
            });
        });
    </script>
</body>
</html>


