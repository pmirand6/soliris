<?php


require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;

if (isset($_GET["oper"]) && $_GET["oper"] == 'getDosis') {
    // FIXME LAS DOSIS CARGADAS SON LAS DE REVLIMID
    $SQL = "SELECT id, valor FROM auxiliar WHERE tipo = 'dosis' ORDER BY valor DESC;";
    $result = mysqli_query($db, $SQL);

    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'valor' => $row['valor']];
    }

    echo json_encode($json);

    mysqli_free_result($result);
}
