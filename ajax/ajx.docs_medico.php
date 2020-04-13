<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;

$flagUpDoc = false;

$fecha_capacitacion = date_format(date_create_from_format('d/m/Y', mysqli_real_escape_string($db, strtoupper($_POST["fecha_capacitacion"]))), 'Y-m-d');
$idMedico = $_POST["idMedico"];
$usuario = $_SESSION["soliris_usuario"];

$upDocMed = f_saveDocCapMedico($idMedico, $fecha_capacitacion);

if ($upDocMed) {
    $fileNameCap = str_replace(' ', '-', $_FILES["file_capacitacion"]["name"]);
    $tmpNameCap = $_FILES["file_capacitacion"]["tmp_name"];
    $finalNameCap = 'capacitacion' . "_" . $idMedico . "_" . $fecha_capacitacion . "_" . $fileNameCap;
    $sqlDocsMed = "CALL `ST_GUARDAR_MEDICO_DOCS`('$idMedico', '6', '$finalNameCap', '$usuario', '$fecha_capacitacion')";
    $response = MySQL_sendFunctionAudit("$sqlDocsMed", "save_doc_medico", "1");
    
} else {
    $flagUpDoc = true;
}

if ($flagUpDoc) {
    // FIXME ENVIAR MAIL DE ALTA DE MEDICO
    $ret[] = "Hubo un error al subir el archivo";
    echo json_encode($ret);
} else {

    $ret[] = " El archivo: '$fileNameCap'. \n Se subió correctamente";
    echo json_encode($ret);
}
