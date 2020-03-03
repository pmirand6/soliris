<?php
#REVISAR
session_start();
require_once '../../../config/config.php';
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
$output_dir = realpath($_SERVER["DOCUMENT_ROOT"]) . "/". _NAME . "/documentacion/";
$date = date('Y-m-d');
$usuario = $_SESSION["soliris_usuario"];


if(isset($_FILES["myfile"])){
	$ret = array();
	$error = $_FILES["myfile"]["error"];
	//You need to handle  both cases
	//If Any browser does not support serializing of multiple files using FormData()

	if(!is_array($_FILES["myfile"]["name"])){ //single file
 	 	$fileName = str_replace(' ', '-', $_FILES["myfile"]["name"]);
 		move_uploaded_file($_FILES["myfile"]["tmp_name"], $output_dir."Receta_".$_POST["idreg"]."_".$date."_".$fileName);
        $ret[]= " El archivo: '$fileName'. \n Se subió correctamente";

        include_adjuntos($_POST["idreg"],$_POST["numero"], 'soliris_maestro', 'Receta', '', "Receta_".$_POST["idreg"]."_".$date."_".$fileName);
        MySQL_sendQueryAudit("INSERT into soliris_notas SET registro = '" . $_POST["idreg"] . "', notas = '" . $_POST["motivo"] . "', fecha = now(), usuario = '$usuario';", "Modificación de Receta - adm_regs");
	}
    echo json_encode($ret);
 }
 ?>
