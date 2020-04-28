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
 * idProducto: (Id Producto)
 * idPresentacion: (Id de la Presentacion del medicamento)
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
include $_SERVER['DOCUMENT_ROOT'] . _MAIL;

if (isset($_POST["oper"]) && $_POST["oper"] == 'guardar_venta') {

    $flagUpDoc = false;

    $idPac = $_POST["idPac"];
    $idMedico = $_POST["idMedico"];
    $idProducto = $_POST["idProducto"];
    $idInstitucion = $_POST["idInstitucion"];
    $idPresentacion = $_POST["idPresentacion"];
    $cantUnidades = $_POST["cantUnidades"];
    $idCanal = $_POST["idCanal"];
    $usuario = $_SESSION["soliris_usuario"];
    if (isset($_POST["oc"])) {
        $oc = $_POST["oc"];
    } else {
        $oc = '';
    }



    $SQL = "CALL `ST_GUARDAR_VENTA`('$idPac',
     '$idMedico', 
     '$idProducto', 
     '$idPresentacion', 
     '$cantUnidades', 
     '$idInstitucion', 
     '$idCanal', 
     '$usuario',
     '$oc')";



    if (isset($SQL) and $SQL != "") {
        $response = MySQL_sendFunctionAudit("$SQL", "ajx.guarda_venta.php", "1");
        //FIXME VERIFICAR DE RESPONDER TAMBIEN EL ID COMPUESTO DE LA VENTA
        $idVenta = $response[0]["mensaje"];
        $codigoVenta = $response[0]["codigo_venta"];
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

    if (is_numeric($idVenta)) {


        if (isset($_FILES["file_receta"]) && !empty($_FILES["file_receta"]) && !empty($_POST["f_receta"])) {

            $f_receta = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_POST["f_receta"]))), 'Y-m-d');
            // Salvo el archivo
            $tipoArchivo = 'receta';

            $fileNameReceta = f_saveDocVentas($_FILES["file_receta"], $idVenta, $f_receta, $idPac, $tipoArchivo);

            if ($fileNameReceta) {
                $fileName = str_replace(' ', '-', $_FILES["file_receta"]["name"]);
                $finalName = 'receta' . "_" . $idPac . "_" . $f_receta . "_" . $fileName;


                $sqlDocsReceta = "CALL `ST_GUARDAR_VENTA_DOCUMENTACION`('$idVenta', '3', '$finalName', '$usuario', '$f_receta')";
                $response = MySQL_sendFunctionAudit("$sqlDocsReceta", "save_doc_receta", "1");
            } else {
                $flagUpDoc = true;
            }
        }

        if (isset($_FILES["file_otro"]) && !empty($_FILES["file_otro"]) && !empty($_POST["f_otro"])) {
            $tipoArchivo = 'otro';
            $f_otro = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_POST["f_otro"]))), 'Y-m-d');
            //Salvo el archivo
            $fileNameOtro = f_saveDocVentas($_FILES["file_otro"], $idVenta, $f_otro, $idPac, $tipoArchivo);


            if ($fileNameOtro) {
                $fileName = str_replace(' ', '-', $_FILES["file_otro"]["name"]);
                $tmpName = $_FILES["file_otro"]["tmp_name"];
                $finalName = 'otro' . "_" . $idPac . "_" . $f_otro . "_" . $fileName;

                $sqlDocsOtro = "CALL `ST_GUARDAR_VENTA_DOCUMENTACION`('$idVenta', '4', '$finalName', '$usuario', '$f_otro')";
                $response = MySQL_sendFunctionAudit("$sqlDocsOtro", "save_doc_otro", "1");
            } else {
                $flagUpDoc = true;
            }
        }

        // FIXME MENSAJE DE REGISTRO DE VENTA GENERADA CORRECTAMENTE

        if ($flagUpDoc) {

            //sendMail_ErrorDocVenta($idVenta);

            $resp = array(
                'title' => 'Error al Guardar la documentación!',
                'icon' => 'warning',
                'text' => 'Se ha generado el registro de venta con el ID: <b>' . $idVenta . '</b>  y con el código de venta: <b>' . $codigoVenta . '</b>pero no se pudo guardar la documentación',
            );

            echo json_encode($resp, JSON_PRETTY_PRINT);
        } else {

            $resp = array(
                'title' => 'Venta Generada!',
                'icon' => 'success',
                'text' => 'Se generó el registro de venta: <b>' . $idVenta . '</b>. <br/> El código interno de esta venta es: <b>' . $codigoVenta. '</b>',
            );

            echo json_encode($resp, JSON_PRETTY_PRINT);
        }
    } else {
        f_logErrorVenta($idVenta, $SQL);
        $resp = array(
            'title' => 'Error al generar la venta',
            'icon' => 'error',
            'text' => 'Ha ocurrido un error al generar la venta, por favor contacte al administrador',
        );
        echo json_encode($resp, JSON_PRETTY_PRINT);
    }
}
