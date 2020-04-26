<?php

require_once '../config/config.php';


include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Reporte de Ventas x APM</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/reporte_ventas_apm.css";
    </style>
</head>

<body>
    <div class="row">
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
            <table class="table table-bordered table-responsive" id="DataTRPA">
                <thead>
                    <tr>

                        <?php
                        echo "<tr><td>APM</td>";
                        
                        $SQL = "SELECT DISTINCT CONCAT(MONTH(`maestro_ventas`.`fecha_venta`),'/', YEAR(`maestro_ventas`.`fecha_venta`)) AS `fecha`
                            FROM `maestro_ventas`
                            WHERE (`maestro_ventas`.`fecha_venta` > (NOW() + INTERVAL -(18) MONTH))
                            ORDER BY 'fecha' DESC";
                            free_all_results($db);
                        $response = mysqli_query($db, $SQL);
                        if ($response) {
                            while ($titulo = mysqli_fetch_assoc($response)) {
                                echo "<td>" . $titulo["fecha"] . "</td>";
                            }
                        }
                        echo "</tr>";
                        ?>
                    </tr>
                    
                    
                </thead>
                <tbody>

                    <?php

                    require_once '../config/config.php';


                    include $_SERVER['DOCUMENT_ROOT'] . _BD;
                    $SQL = "SELECT id, nombre_completo as 'nombre' FROM apm ORDER BY 'nombre' asc;";
                    $response = mysqli_query($db, $SQL);
                    if ($response) {
                        while ($row = mysqli_fetch_assoc($response)) {
                            $id = $row["id"];
                            $nombre = $row["nombre"];
                            echo "<tr><td>$nombre</td>";

                            $SQL = "SELECT DISTINCT CONCAT(MONTH(`maestro_ventas`.`fecha_venta`),'/', YEAR(`maestro_ventas`.`fecha_venta`)) AS `fecha`
                           FROM `maestro_ventas`
                           WHERE (`maestro_ventas`.`fecha_venta` > (NOW() + INTERVAL -(18) MONTH))
                           ORDER BY 'fecha' DESC";
                            $mes = mysqli_query($db, $SQL);
                            if ($mes) {
                                while ($titulo = mysqli_fetch_assoc($mes)) {
                                    echo "<td>";
                                    echo "RI:" . functRI2($nombre, $titulo["fecha"], "RI");
                                    echo "<br/>FU:" . functRI2($nombre, $titulo["fecha"], "FU");
                                    echo "</td>";
                                }
                            }
                        }
                    }

                    mysqli_close($db);
                    ?>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>
    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/DataTables.php";
    ?>
    <!-- Custom JS -->
    <script src="../resources/JS/Develop/reporte_ventas_apm.js"></script>

</body>

</html>

<?php
function functRI2($apm, $fecha, $tipo)
{

    require_once '../config/config.php';

    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    $SQLRI = "SELECT COUNT(m.id) AS CANT
    FROM maestro_ventas m
    INNER JOIN medico med ON med.id = m.medico_id
    INNER JOIN apm a ON a.id = med.apm_id
    INNER JOIN maestro_ventas_tipo mvt ON mvt.id = m.venta_tipo_id
    WHERE a.nombre_completo='$apm' AND CONCAT(MONTH(m.fecha_venta),'/', YEAR(m.fecha_venta))='$fecha' AND m.estado_id=23 AND mvt.valor='$tipo';";

    $responseRI = mysqli_query($db, $SQLRI);
    if ($responseRI) {
        while ($rowRI = mysqli_fetch_assoc($responseRI)) {
            if ($rowRI["CANT"] == 0) {
                return "<span class='count_0'>" . $rowRI["CANT"] . "</span>";
            } else {
                return "<span class=''>" . $rowRI["CANT"] . "</span>";
            }
        }
    } else {
        return false;
    }
    mysqli_close($db);
}


?>