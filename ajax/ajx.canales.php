<?php


require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

if (isset($_GET["q"])) {
    $filtro = $_GET["q"];
    $SQL = "CALL `ST_GET_CANAL`('$filtro');";
    $result = mysqli_query($db, $SQL);

    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'text' => $row['canal']];
    }

    echo json_encode($json);

    mysqli_free_result($result);
    mysqli_close($db);
}
