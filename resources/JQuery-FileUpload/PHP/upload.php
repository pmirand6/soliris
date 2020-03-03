<?php
#REVISAR
include_once '../../../config/config.php';
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
$output_dir = realpath($_SERVER["DOCUMENT_ROOT"]) . "/". _NAME . "/documentacion/";
$date = date('Y-m-d');

if(isset($_FILES["myfile"])){
	$ret = array();

	$error = $_FILES["myfile"]["error"];
	//You need to handle  both cases
	//If Any browser does not support serializing of multiple files using FormData()

	if(!is_array($_FILES["myfile"]["name"])){ //single file
 	 	$fileName = str_replace(' ', '-', $_FILES["myfile"]["name"]);
 		move_uploaded_file($_FILES["myfile"]["tmp_name"], $output_dir.$_POST["tipo"]."_".$_POST["id"]."_".$date."_".$fileName);
	    #Se agrega la fecha
    	include_adjuntos($_POST["id"], '0', $_POST["referencia"], $_POST["tipo"],$date,  $_POST["tipo"]."_".$_POST["id"]."_". $date ."_".$fileName);
			$ret[]= " El archivo: '$fileName'. \n Se subió correctamente";
	}
    echo json_encode($ret);
 }
 ?>
