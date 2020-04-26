<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;

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

    <div class="pie" style="min-width: 210px; height: 300px; margin: 0 auto; border: thin 1px"></div>
    <script type="text/javascript">
        $(document).ready(function() {
            // Create the chart - http://jsfiddle.net/6LXVQ/97/
            $('.pie').highcharts({
                chart: {
                    type: 'pie'
                },
                title: {
                    text: '<b>' + 'Tipos de Reporte' + '</b>'
                },
                exporting: {
                    filename: 'Tipos de Reporte',
                    chartOptions: {
                        title: {
                            text: 'Tipos de Reporte'
                        }
                    },
                },
                xAxis: {
                    type: 'category'
                },
                plotOptions: {
                    series: {
                        borderWidth: 1,
                        dataLabels: {
                            enabled: true,
                        }
                    }
                },
                series: [{
                    id: 'toplevel',
                    name: 'Tipos',
                    data: [
                        <?php
                        if (isset($_GET["fecha"]) and !empty($_GET["fecha"])) {
                            $fecha = $_GET["fecha"];
                        } else {
                            $fecha = date('Y-m');
                        }
                        $SQL = "
                        CALL `ST_CANT_TIPO_VENTAS`('$fecha')";
                        $result = mysqli_query($db, $SQL);
                        $arr_data_str = "";
                        while ($row = mysqli_fetch_assoc($result)) {
                            $arr_data_str .= "{name: '" . $row["valor"] . "', y: " . $row["cantTipo"] . "},";
                        }
                        $arr_data_str = trim($arr_data_str, ",");
                        echo $arr_data_str;
                        ?>
                    ]
                }]
            })
        });
    </script>
</body>

</html>