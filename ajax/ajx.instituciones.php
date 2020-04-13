<?php


require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;

if (isset($_POST["oper"]) && $_POST["oper"] == 'listInstituciones') {

    $SQL = "CALL `ST_LIST_INSTITUCIONES`();";
    $result = mysqli_query($db, $SQL);

    $var = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $var[] = $row;
    }

    //SALIDA DE JSON
    if (isset($var) && (!empty($var))) {
        echo "{\"data\": " . json_encode($var) . "}";
    } else {
        echo "{\"data\": []}";
    }



    mysqli_free_result($result);
    mysqli_close($db);
}

if (isset($_GET["q"])) {
    $filtro = $_GET["q"];

    $SQL = "CALL ST_LIST_INSTITUCIONES_HABILITADAS('$filtro');";
    $result = mysqli_query($db, $SQL);

    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'text' => $row['nombre']];
    }

    echo json_encode($json);

    mysqli_free_result($result);
    mysqli_close($db);
}
