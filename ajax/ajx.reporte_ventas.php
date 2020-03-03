<?php 

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;


if(isset($_GET["ini"]) AND !empty($_GET["ini"]) AND isset($_GET["fin"]) AND !empty($_GET["fin"])){
    $ini = $_GET["ini"];
    $fin = $_GET["fin"];

    $query = "
    SELECT
    RM.cargado as Cargado
    FROM
    soliris_maestro as RM
    WHERE
    RM.fecha_venta BETWEEN '$ini' AND '$fin' AND  RM.estado='NP' GROUP BY RM.cargado;";

    $result = mysqli_query($db, $query);

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $cargado = $row["Cargado"];
        $MG1 = subQuerys_Cargados($cargado, '1 Mg', $ini, $fin);
        $MG2 = subQuerys_Cargados($cargado, '2 Mg', $ini, $fin);
        $MG3 = subQuerys_Cargados($cargado, '3 Mg', $ini, $fin);
        $MG4 = subQuerys_Cargados($cargado, '4 Mg', $ini, $fin);

        $arr_row = array(
            "cargado" => $cargado,
            "dosis1" => $MG1,
            "dosis2" => $MG2,
            "dosis3" => $MG3,
            "dosis4" => $MG4
            );
        array_push($arr_tbody, $arr_row);
    };

    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
} else {
    echo "{\"aaData\": []}";
}

function subQuerys_Cargados($user, $dosis, $ini, $fin){
    
    
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
        return round($rowsQ["Cantidad"]);
    }
    mysqli_free_result($resultsQ);
    mysqli_close($db);
}
?>

