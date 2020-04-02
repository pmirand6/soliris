<?php


require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;

if (isset($_GET["oper"]) && $_GET["oper"] == 'getPresentacion') {
    // FIXME LAS DOSIS CARGADAS SON LAS DE REVLIMID
    $producto = $_GET["producto"];
    $SQL = "SELECT id, valor FROM presentacion WHERE producto_id = '$producto' ORDER BY valor DESC;";
    $result = mysqli_query($db, $SQL);

    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'valor' => $row['valor']];
    }

    echo json_encode($json);

    mysqli_free_result($result);
}
