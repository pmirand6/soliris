<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;

if (isset($_POST["id"]) and $_POST["id"] != 0 and !empty($_POST["id"] and $_POST["oper"] == 'showPaciente')) {
    $id = $_POST["id"];
    $SQL = "CALL ST_SHOW_PACIENTE('$id');";
    $result = mysqli_query($db, $SQL);

    $data = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }

    echo json_encode($data);
    mysqli_free_result($result);
}

if (isset($_GET['q'])) {


    //select de pacientes 
    $iniciales = mysqli_real_escape_string($db, $_GET['q']);

    $SQL = "CALL `ST_LIST_PACIENTES_HABILITADOS`('$iniciales');";
    $result = mysqli_query($db, $SQL);

    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'text' => $row['nombre']];
    }

    echo json_encode($json);

    mysqli_free_result($result);

}
