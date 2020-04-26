<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;


if ($_GET["oper"] == 'CAN' and isset($_GET["ao"]) and !empty($_GET["ao"])) {

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
            DISTINCT(p.patologia_nombre) AS Patologia
        FROM
         maestro_ventas AS m
         INNER JOIN institucion i ON i.id = m.institucion_id
         INNER JOIN patologia p ON p.id = m.patologia_id
        WHERE YEAR(m.fecha_venta) = '$ao' AND i.nombre = '$canal' AND m.estado_id IN (23);";



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
            $cantMesTot = patsXmes($pat, $ao, $a, $canal);
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

function patXmes($patologia, $ao, $ms, $canal)
{

    require_once('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    $querysPAT = "  SELECT 
	COUNT(*) AS CANT
FROM
 maestro_ventas AS m
 INNER JOIN patologia p ON p.id = m.patologia_id
 INNER JOIN institucion i ON i.id = m.institucion_id
 WHERE
 p.patologia_nombre = '" . $patologia . "' 
 AND 
 i.nombre = '$canal'
 AND 
 YEAR(m.fecha_venta) = '$ao' 
 AND 
 MONTH(m.fecha_venta) = '$ms' AND m.estado_id IN (23);";


    $resultsPat = mysqli_query($db, $querysPAT);

    while ($rowsPat = mysqli_fetch_assoc($resultsPat)) {
        return $rowsPat["CANT"];
    }
    mysqli_free_result($resultsPat);
}
function patsXmes($patologia, $ao, $ms, $canal)
{

    require_once('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;


    $querysPATS = "SELECT 
	COUNT(*) AS CANT, 
	MONTH(m.fecha_venta) AS Mes
    FROM maestro_ventas AS m
    INNER JOIN patologia p ON p.id = m.patologia_id
    INNER JOIN institucion i ON i.id = m.institucion_id
    WHERE
    p.patologia_nombre = '" . $patologia . "' 
    AND 
    i.nombre = '$canal'
    AND 
    YEAR(m.fecha_venta) = '$ao' 
    AND 
    MONTH(m.fecha_venta) = '$ms' AND m.estado_id IN (23) GROUP BY Mes;";

   

    $resultsPats = mysqli_query($db, $querysPATS);

    $returnCant = 0;
    while ($rowsPats = mysqli_fetch_assoc($resultsPats)) {
        $returnCant = $rowsPats["CANT"];
    }
    return $returnCant;

    mysqli_free_result($resultsPats);
}
