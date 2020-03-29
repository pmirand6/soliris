<?php

/**
 * 
 * Programa para guardar los datos del paciente.
 * Los datos recibidos desde la pagina guardar_venta.php
 * ATENCION! LOS CAMPOS NO PUEDEN PASAR VACIOS AL STORE PROCEDURE QUE SE GENERA EN LA BASE
 * oper: guardar_venta
 * idPac: (Id del Paciente)
 * idMedico: (Id del Medico)
 * idInstitucion: (Id Institucion)
 * idDosis: (Id de la dosis del medicamento)
 * cantUnidades: (cantidad de unidades a vender)
 * idCanal: (Id del Canal)
 * fecha_venta: (TimeStamp - Fecha de la venta)
 * usuario: (Usuario que acciona sobre la venta)
 * 
 * Documentos de la venta:
 * file_otro: (File - Archivo Otro) <-- Opcional
 * fecha_otro: (Date - Fecha de documento alternativo) <-- Opcional
 * file_receta: (File - Archivo de receta)
 * fecha_receta: (Date - Fecha de la receta)
 * 
 */

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;

if (isset($_POST["oper"]) && $_POST["oper"] == 'guardar_venta') {

    $idPac = $_POST["idPac"];
    $idMedico = $_POST["idMedico"];
    $idPresentacion = $_POST["idPresentacion"];
    $fecha_venta = $_POST["fecha_venta"];
    $cantUnidades = $_POST["cantUnidades"];
    $idInstitucion = $_POST["idInstitucion"];
    $idDosis = $_POST["idInstitucion"];
    $idCanal = $_POST["idCanal"];
    $usuario = $_SESSION["soliris_usuario"];


   $SQL = "CALL `ST_GUARDAR_VENTA`('$idPac',
     '$idMedico', 
     '$idPresentacion', 
     '$cantUnidades', 
     '$fecha_venta', 
     '$idInstitucion', 
     '$idCanal', 
     '$usuario')";

    if (isset($SQL) and $SQL != "") {
        $response = MySQL_sendFunctionAudit("$SQL", "ajx.guarda_venta.php", "1");
        $idVenta = $response[0]["mensaje"];
        // TODO VER ENVIO DE MAIL EN EL ALTA DEL PACIENTE
        //  sendMailPM('Paciente Pendiente', $nombre, '', '');
    }

    /*
    * Documentos de la venta:
    * file_otro: (File - Archivo Otro)
    * fecha_otro: (Date - Fecha de documento alternativo)
    * file_receta: (File - Archivo de receta)
    * fecha_receta: (Date - Fecha de la receta)
    * 
    */

    //TODO GUARDAR ARCHIVOS CON EL ID DEL PACIENTE Y EL ID DE LA VENTA
    


    if (isset($_FILES["file_receta"])) {

        $file_name = $_FILES["file_receta"]["name"];
        $file_type = $_FILES["file_receta"]["type"];
        $file = $file_name . '.' . $file_type; //FIXME VERIFICAR EL GUARDADO CORRECTO DE LA EXTENSION
        $fecha_receta = $_POST["fecha_receta"];

        $sqlDocsReceta = "CALL `ST_GUARDAR_VENTA_DOCUMENTACION`('$idVenta', '3', '$file', '$usuario', '$fecha_receta')";
        $response = MySQL_sendFunctionAudit("$sqlDocsReceta", "save_doc_receta", "1");
        echo $response[0]["mensaje"];
    }

    if (isset($_FILES["file_otro"])) {

        $file_name = $_FILES["file_otro"]["name"];
        $file_type = $_FILES["file_otro"]["type"];
        $file = $file_name . '.' . $file_type; //FIXME VERIFICAR EL GUARDADO CORRECTO DE LA EXTENSION
        $fecha_receta = $_POST["fecha_otro"];

        $sqlDocsReceta = "CALL `ST_GUARDAR_VENTA_DOCUMENTACION`('$idVenta', '4', '$file', '$usuario', '$fecha_receta')";
        $response = MySQL_sendFunctionAudit("$sqlDocsReceta", "save_doc_otro", "1");
        echo $response[0]["mensaje"];
    }


}
