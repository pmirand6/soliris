<?php


require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;

if (isset($_GET["oper"]) && $_GET["oper"] == 'getDosis') {
    // FIXME LAS DOSIS CARGADAS SON LAS DE REVLIMID
    $presentacion = $_GET["presentacion"];
    $SQL = "SELECT id, valor FROM dosis WHERE presentacion_id = '$presentacion' ORDER BY valor DESC;";
    $result = mysqli_query($db, $SQL);

    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'valor' => $row['valor']];
    }

    echo json_encode($json);

    mysqli_free_result($result);
}
