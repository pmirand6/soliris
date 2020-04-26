<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;

if (isset($_GET["fecha"]) and !empty($_GET["fecha"])) {
    $fecha = $_GET["fecha"];
} else {
    $fecha = date('Y-m');
}
$anio = substr($fecha, 0, 4);



$RI = "";
// Cuenta de ventas de tipo RI
$SQLRI = "SELECT COUNT(*) AS CANT, MONTH(m.fecha_venta)
    FROM maestro_ventas m
    WHERE YEAR(m.fecha_venta) = '$anio' AND m.venta_tipo_id = 1 AND m.estado_id IN (23)
    GROUP BY MONTH(m.fecha_venta);";

$resultRI = mysqli_query($db, $SQLRI);
while ($row2 = mysqli_fetch_assoc($resultRI)) {
    $RI .= $row2["CANT"] . ",";
}
$RI = trim($RI, ",");

// Cuenta de ventas de tipo FU
$FU = "";
$SQLFU = "SELECT COUNT(*) AS CANT, MONTH(m.fecha_venta)
    FROM maestro_ventas m
    WHERE YEAR(m.fecha_venta) = '$anio' AND m.venta_tipo_id = 2 AND m.estado_id IN (23)
    GROUP BY MONTH(m.fecha_venta);";
$resultFU = mysqli_query($db, $SQLFU);
while ($row3 = mysqli_fetch_assoc($resultFU)) {
    $FU .= $row3["CANT"] . ",";
}
$FU = trim($FU, ",");


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


    <div class="col-sm-12 col-xs-12 text-right">
        <div class="stacked" style="min-width: 210px; height: 300px; margin: 0 auto; border: thin 1px"></div>
    </div>


    <script type="text/javascript">
        $(document).ready(function() {
            // Create the chart - http://jsfiddle.net/6LXVQ/97/
            $('.stacked').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '<b>' + 'Unidades Vendidas en ' + '' + <?php echo $anio ?> + '</b>'
                },
                xAxis: {
                    categories: [
                        <?php
                        $arr_mes = "";
                        $arr_mons = array("Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic");
                        foreach ($arr_mons as $mes) {
                            $arr_mes .= "'" . $mes . "',";
                        }
                        echo trim($arr_mes, ",");
                        ?>
                    ]
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Total de Ventas'
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                },
                legend: {
                    align: 'right',
                    x: -30,
                    verticalAlign: 'top',
                    y: 25,
                    floating: true,
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                    borderColor: '#CCC',
                    borderWidth: 1,
                    shadow: false
                },
                tooltip: {
                    formatter: function() {
                        return '<b>' + this.x + '</b><br/>' +
                            this.series.name + ': ' + this.y + '<br/>' +
                            'Total: ' + this.point.stackTotal;
                    }
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                            style: {
                                textShadow: '0 0 3px black'
                            }
                        }
                    }
                },
                series: [{
                    name: 'FU',
                    <?php echo "data: [" . $FU . "]"; ?>
                }, {
                    name: 'RI',
                    <?php echo "data: [" . $RI . "]"; ?>
                }]
            });
        });
    </script>
</body>

</html>