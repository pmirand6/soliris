<?php 
    
require_once('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;


    if($_GET["oper"] == 'CAN' AND isset($_GET["ao"]) AND !empty($_GET["ao"])) {

        $ao = $_GET["ao"];

        $canal = "";
        $queryINST = "
                    SELECT
                      nombre as institucion
                    FROM
                      institucion where tipo = 'Convenio'
                    ORDER BY
                      nombre ASC;";

        $resultsINST = mysqli_query($db, $queryINST);

        while ($rowsCAN = mysqli_fetch_assoc($resultsINST)) {
            $canal = $rowsCAN["institucion"];

            echo "<div class=\"row margin\">
                <div class=\"col-sm-11 col-xs-11 text-left\" style=\"margin-left: 10px\">
                    <table class=\"table table-bordered table-responsive text-center\">
                        <thead>
                            <tr>
                                <th class='bg-info'>$canal</th>";
            $ar_meses = array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
            foreach ($ar_meses as $mes) {
                echo "<th class='bg-info'>$mes</th>";
            }

            echo "
                                <th class='bg-info'>Totales</th>
                            </tr>
                        </thead>
                        <tbody>";

            $query = "  SELECT
                            distinct(RM.patologia) as Patologia
                        FROM
                            soliris_maestro as RM
                        WHERE
                            YEAR(RM.fecha_venta) = '$ao' AND RM.institucion = '$canal' AND estado in ('NP', 'Historico');";

            $results = mysqli_query($db, $query);
            while ($rows = mysqli_fetch_assoc($results)) {
                $pat = $rows["Patologia"];
                $totales = 0;

                echo "<tr>";
                echo "<td>$pat</td>";
                for ($i = 1; $i <= 12; $i++) {
                    $cant = 0;
                    $cant = patXmes($pat, $ao, $i, $canal);
                    $totales = $totales + $cant;
                    echo "<td onmouseover=\"this.className='over'\" onmouseout=\"this.className='out'\">$cant</td>";

                }
                echo "<td class='bg-success'>$totales</td>";
                echo "</tr>";
            }
            mysqli_free_result($results);

            $totTotal = 0;
            echo "<tr><td class='bg-success'>Total por Mes</td>";
            for ($a = 1; $a <= 12; $a++) {
                $cantMesTot = 0;
                $cantMesTot = patsXmes($ao, $a, $canal);
                $totTotal = $totTotal + $cantMesTot;
                echo "<td class='bg-success'>$cantMesTot</td>";
            }
            echo "<td class='bg-success'>" . $totTotal . "</td></tr>";

            echo "    </tbody>
                    </table>
                </div>
            </div>";
        }
    }

    function patXmes($patologia, $ao, $ms, $canal){
        
    require_once('../config/config.php');
        include $_SERVER['DOCUMENT_ROOT'] . _BD;

        $querysPAT = "  SELECT
                            COUNT(*) AS CANT
                        FROM
                            soliris_maestro AS RM
                        WHERE
                            RM.patologia = '" . $patologia . "'  AND RM.institucion = '$canal' AND YEAR(RM.fecha_venta) = '$ao' AND MONTH(RM.fecha_venta) = '$ms' AND estado in ('NP', 'Historico');";

        $resultsPat = mysqli_query($db, $querysPAT);

        while ($rowsPat = mysqli_fetch_assoc($resultsPat)) {
            return $rowsPat["CANT"];
        }
        mysqli_free_result($resultsPat);
    }
    function patsXmes($ao, $ms, $canal){
        
    require_once('../config/config.php');
        include $_SERVER['DOCUMENT_ROOT'] . _BD;
        

        $querysPATS = "  SELECT
                            COUNT(*) AS CANT, MONTH(RM.fecha_venta) as Mes
                        FROM
                            soliris_maestro AS RM
                        WHERE
                            YEAR(RM.fecha_venta) = '$ao' AND MONTH(RM.fecha_venta) = '$ms' AND RM.institucion = '$canal' AND estado in ('NP', 'Historico')
                        GROUP BY Mes;";

        $resultsPats = mysqli_query($db, $querysPATS);

        $returnCant = 0;
        while ($rowsPats = mysqli_fetch_assoc($resultsPats)) {
            $returnCant = $rowsPats["CANT"];
        }
        return $returnCant;

        mysqli_free_result($resultsPats);
    }
?>