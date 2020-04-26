<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;


if (isset($_POST["oper"], $_POST["f_receta"]) && $_POST["oper"] == 'checkDocFechaVenta') {
    $f_receta = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_POST["f_receta"]))), 'Y-m-d');
    $idPac = $_POST["idPac"];
    $sql = "CALL ST_CONTROL_RECETA_VENTA('$f_receta', '$idPac')";
    $response = MySQL_sendFunctionAudit("$sql", "check_doc_receta", "1");

    
    if($response[0]["mensaje"] != '0'){
        $resp = array(
            'title' => 'Documento con Fecha Duplicada',
            'icon' => 'warning',
            'html' => 'Se encontró la fecha <b>' . $_POST["f_receta"] . '</b></br> ' .
            'en otra venta asociada a este paciente </ br>' .
            '</br><a target="_blank" href="' . constant('HTTP') . $response[0]["url_doc"] . '">Ver Documento</a> ' .
            '</br><small><i> * Usted puede sin embargo continuar con la venta</i></small>'
        );
        echo json_encode($resp, JSON_PRETTY_PRINT);
    } else {
        echo false;
    }
    
}


