<?php 

        require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once "../resources/Includes/HighCharts.php";


        $ini = $_GET["ini"];
        $fin = $_GET["fin"];

        $query = "
            SELECT
              RM.cargado as Cargado
            FROM
              soliris_maestro as RM
            WHERE
              RM.fecha_venta BETWEEN '$ini' AND '$fin' AND RM.estado='NP' GROUP BY RM.cargado;";

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
            $arr_graf = "";
            $arr_graf .= user_chart_stats($user, '1 Mg', $ini, $fin);
            $arr_graf .= user_chart_stats($user, '2 Mg', $ini, $fin);
            $arr_graf .= user_chart_stats($user, '3 Mg', $ini, $fin);
            $arr_graf .= user_chart_stats($user, '4 Mg', $ini, $fin);

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
            SUM(RM.unidades)/21 as Cantidad
        FROM
            soliris_maestro as RM
        WHERE
            RM.dosis = '$dosis' AND
            RM.fecha_venta BETWEEN '$ini' AND '$fin' AND
            RM.estado = 'NP' AND
            RM.cargado = '$user';";

        $resultsQ = mysqli_query($db, $querysQ);

        while ($rowsQ = mysqli_fetch_assoc($resultsQ)) {
            return "['" . $dosis . "', " . round($rowsQ["Cantidad"]) . "],";
        }
        mysqli_free_result($resultsQ);
    }
?>