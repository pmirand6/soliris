<?php 

        require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once "../resources/Includes/HighCharts.php";


/**
 *  Formateo de fechas recibidas
 */
$ini = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_GET["ini"]))), 'Y-m-d');
$fin = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_GET["fin"]))), 'Y-m-d');

$query = "
    SELECT
    RM.usuario_id as usuario_id,
    (SELECT UPPER(FU_GET_USERNAME_USUARIO(RM.usuario_id))) as Cargado
    FROM
    maestro_ventas as RM
    WHERE
    RM.fecha_venta BETWEEN '$ini' AND '$fin' AND  RM.estado_id= 23 GROUP BY Cargado, RM.usuario_id;";

        $result = mysqli_query($db, $query);


        $arr_javascript_header = "<script type=\"text/javascript\">
                    $(document).ready(function() {

                        // Radialize the colors
                        Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
                            return {
                                radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
                                stops: [
                                    [0, color],
                                    [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                                ]
                            };
                        });";

        $arr_javascript_body = "";
        $arr_javascript_footer = "});</script>";

        $arr_response = "";

        while ($row = mysqli_fetch_assoc($result)) {
            $user = $row["Cargado"];
            $usuarioId = $row["usuario_id"];
            $arr_graf = "";
            $arr_graf .= user_chart_stats($usuarioId, 27, $ini, $fin);

//            echo $arr_graf;

            $arr_response .= "
                <div class='col-sm-6 col-xs-6'>
                    <div class=\"$user\" style=\"min-width: 110px; height: 300px; max-width: 400px; margin: 0 auto\"></div>
                </div>
            ";

            $arr_javascript_body .="
                        // Build the chart
                        $('.$user').highcharts({
                            chart: {
                                plotBackgroundColor: null,
                                plotBorderWidth: null,
                                plotShadow: false
                            },
                            title: {
                                text: '$user'
                            },
                            tooltip: {
                                pointFormat: '{series.name}: <b>{point.y:.0f} ({point.percentage:.1f}%)</b>'
                            },
                            plotOptions: {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        },
                                        connectorColor: 'silver'
                                    }
                                }
                            },
                            series: [{
                                type: 'pie',
                                name: 'Unidades',
                                data: [
                                    " . trim($arr_graf, ",") . "
                                ]
                            }]
                        });
            ";


        };

        mysqli_free_result($result);
        mysqli_close($db);

    echo $arr_response;
    echo $arr_javascript_header . $arr_javascript_body . $arr_javascript_footer ;


    function user_chart_stats($user, $dosis, $ini, $fin){
        require_once('../config/config.php');
        include $_SERVER['DOCUMENT_ROOT'] . _BD;


        $querysQ = "
    SELECT
    SUM(RM.unidades) as Cantidad
    FROM
    maestro_ventas as RM
    WHERE
    RM.presentacion_id = '$dosis' AND
    RM.fecha_venta BETWEEN '$ini' AND '$fin' AND
    RM.estado_id = 23 AND
    RM.usuario_id = '$user';";

        $resultsQ = mysqli_query($db, $querysQ);

        while ($rowsQ = mysqli_fetch_assoc($resultsQ)) {
            return "['" . $dosis . "', " . round($rowsQ["Cantidad"]) . "],";
        }
        mysqli_free_result($resultsQ);
    }
?>