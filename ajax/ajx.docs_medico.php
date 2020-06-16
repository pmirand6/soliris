<?php

require($_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _MAIL;



$flagUpDoc = false;

$fecha_capacitacion = date_format(date_create_from_format('d/m/Y', mysqli_real_escape_string($db, strtoupper($_POST["fecha_capacitacion"]))), 'Y-m-d');
$idMedico = $_POST["idMedico"];
$usuario = $_SESSION["soliris_usuario"];
$mod = $_POST["mod"]; // variable seteada para indicar que el registro es o no una modificación


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
    // FIXME ENVIAR ERROR DE SUBIDA DE DOCUMENTACION
    $ret[] = "Hubo un error al subir el archivo";
    echo json_encode($ret);
} else {
    if($mod !== 'true'){
        sendMail_AltaMedico($idMedico);
    } else {
        sendMail_ModificacionMedico($idMedico);
    }
    $ret[] = " El archivo: '$fileNameCap'. \n Se subió correctamente";
    echo json_encode($ret);
}
