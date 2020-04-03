<?php

/**
 * 
 * Programa para controlar los estados de la modificación de venta.
 * 
 */

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;

if (isset($_POST["oper"]) && $_POST["oper"] == 'controlModicacionVenta' && isset($_POST["idVenta"])) {
    $idVenta = $_POST["idVenta"];
    $userName = $_SESSION["soliris_usuario"];
    $SQL = "CALL ST_CONTROL_MODIFICAR_VENTA('$idVenta', '$userName');";

    $result = mysqli_query($db, $SQL);

    $data = array();


    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }

    echo json_encode($data);
    mysqli_free_result($result);
    mysqli_close($db);
}

if (isset($_POST["oper"]) && $_POST["oper"] == 'deleteControlModicacionVenta' && isset($_POST["idVenta"])) {

    $idVenta = $_POST["idVenta"];
    $idUsuario = $_POST["idUsuario"];
    $idEstado = $_POST["idEstado"];
    $SQL = "CALL ST_DELETE_CONTROL_MODIFICAR_VENTA('$idVenta', '$userName');";

    mysqli_query($db, $SQL);
    mysqli_close($db);

}
