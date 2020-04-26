<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;

if (isset($_GET["fecha"]) and !empty($_GET["fecha"])) {
    $fecha = $_GET["fecha"];
} else {
    $fecha = date('Y-m');
}

$SQL = "
SELECT count(id) as cantTipo
FROM maestro_ventas
WHERE DATE_FORMAT(fecha_venta, '%Y-%m') = '$fecha' AND estado_id IN (23);";

$result = mysqli_query($db, $SQL);
while ($row = mysqli_fetch_assoc($result)) {
    $tot = $row["cantTipo"];
}
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


    <div class="col-sm-12 col-xs-12 text-center">
        <div class="bar" style="min-width: 210px; height: 300px; margin: 0 auto; border: thin 1px"></div>
        <div class="col-sm-12 col-xs-12">
            <table id="datatable" class="table table-bordered table-responsive">
                <thead>
                    <tr>
                        <th align="center">Patología</th>
                        <th align="center">Ventas</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $DTB = "
                    SELECT COUNT(m.id) AS cantTipo, pat.patologia_nombre
FROM maestro_ventas m
INNER JOIN paciente p ON p.id = m.paciente_id
INNER JOIN patologia pat ON pat.id = p.patologia_id
WHERE DATE_FORMAT(m.fecha_venta, '%Y-%m') = '2020-04' AND m.estado_id IN (23)
GROUP BY pat.id;
                    ";
                    $resultDTB = mysqli_query($db, $DTB);
                    $arr_data_str = "";
                    while ($rowDTB = mysqli_fetch_assoc($resultDTB)) {
                        echo "<tr><th>" . $rowDTB["patologia_nombre"] . "</th><td>" . $rowDTB["cantTipo"] . "</td></tr>";
                    }
                    echo $arr_data_str;
                    ?>
                    <tr>

                    </tr>
                </tbody>
            </table>
        </div>

    </div>


    <script type="text/javascript">
        $(document).ready(function() {
            // Create the chart - http://jsfiddle.net/6LXVQ/97/
            $('.bar').highcharts({
                data: {
                    table: 'datatable'
                },
                chart: {
                    type: 'column'
                },
                title: {
                    text: '<b>' + 'Ventas por Patologia' + '</b>'
                },
                plotOptions: {
                    series: {
                        borderWidth: 1,
                        dataLabels: {
                            enabled: true,
                        }
                    }
                },
                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: 'Ventas'
                    }
                },
                tooltip: {
                    formatter: function() {
                        return '<b>' + this.series.name + '</b><br/>' +
                            this.point.y + ' ' + this.point.name.toLowerCase();
                    }
                }
            });
        });
    </script>
</body>

</html>