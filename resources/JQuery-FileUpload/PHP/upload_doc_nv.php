<?php
#REVISAR
require_once '../../../config/config.php';
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
$output_dir = realpath($_SERVER["DOCUMENT_ROOT"]) . "/". _NAME . "/documentacion/";
$date = date('Y-m-d');

if(isset($_FILES["myfile"])){
	$ret = array();

	$error = $_FILES["myfile"]["error"];
	//You need to handle both cases
	//If Any browser does not support serializing of multiple files using FormData()

	if(!is_array($_FILES["myfile"]["name"])){ //single file
		$fileName = str_replace(' ', '-', $_FILES["myfile"]["name"]);
		$resp = move_uploaded_file($_FILES["myfile"]["tmp_name"], $output_dir.$_POST["tipo"]."_".$_POST["id"]."_".$date."_".$fileName);
		
		if ($resp) {
			$ret[]= "$fileName";

			$idMaestro = $_POST["id"];
			$tipo = $_POST["tipo"];
			$file = $_POST["tipo"]."_".$_POST["id"]."_".$date."_".$fileName;

			$SQL = "SELECT FU_ADJ_FILES('$idMaestro', '0', 'soliris_maestro', '$tipo', '', '$file') as response";
			MySQL_sendFunctionAudit($SQL, "Documentación: $tipo - IdMaestro: $idMaestro", 0);

			$ret[]= " El archivo: '$fileName'. \n Se subió correctamente ";
			$ret[] = $file;
			$ret[] = $resp;
			echo json_encode($ret);
		} else {
			$ret["jquery-upload-file-error"] = "Error al Subir Archivo al Servidor";
			echo json_encode($ret);
			die();
		}
	}
 }
 ?>
