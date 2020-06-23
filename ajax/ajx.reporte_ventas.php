<?php 

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;


if(isset($_GET["ini"]) AND !empty($_GET["ini"]) AND isset($_GET["fin"]) AND !empty($_GET["fin"])){
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

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $cargado = $row["Cargado"];
        $usuarioId = $row["usuario_id"];
        $dosis = subQuerys_Cargados($usuarioId, 27, $ini, $fin);

        $arr_row = array(
            "cargado" => $cargado,
            "dosis1" => $dosis,
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
        return round($rowsQ["Cantidad"]);
    }
    mysqli_free_result($resultsQ);
    mysqli_close($db);
}
?>

