<?php 

if(isset($_POST["oper"]) AND $_POST["oper"] == "DocPacModified"){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    include_once $_SERVER['DOCUMENT_ROOT'] . _MAIL;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        /* Seteo de variables */
        $id = $_POST["id"];
        $usuario = $_SESSION["soliris_usuario"];

        $SQLnom = "SELECT nombre_completo FROM paciente WHERE id = '$id';";
        $resultnom = mysqli_query($db, $SQLnom);
        while ($row = mysqli_fetch_assoc($resultnom)) {
          $nombre = $row["nombre_completo"];
        }
        /* -------------- */

        $SQL = "CALL `ST_DOC_PAC_MODIFIED`('$id', '$usuario')";
        /* Realizo la consulta */
        if (isset($SQL) AND $SQL != ""){
            $response = MySQL_sendFunctionAudit("$SQL", "ajx.docs_paciente.php", "1");
            foreach($response as $row_response){
                $estado = $row_response['mensaje'];
                $respuesta = $row_response['mensaje'];
             }
            
           //sendMailPM($estado, $nombre, '', ''); <-- Verificar funcion de envío de mail
            
        }
        mysqli_close($db);
    };
}

if(isset($_FILES["myfile"]) && isset($_POST["oper"]) && $_POST["oper"] == 'saveDocPac'){

  require_once("../config/config.php");
  include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
  include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
  /* recibe desde docs_paciente.js 
    idPac: paramPaciente.idPac, <- Local Storage con los parametros del paciente
    referencia: 'Paciente', 
    tipoDoc: 'Otro', <- Tipo de documento
    oper: 'saveDocPac'
  */


  $output_dir = realpath($_SERVER["DOCUMENT_ROOT"]) . "/". _NAME . "/documentacion/";
  $date = date('Y-m-d');
  $ret = array();
  $idPac = $_POST["idPac"];
  $referencia = $_POST["referencia"];
  $tipoDoc = $_POST["tipoDoc"];
  $usuario = $_SESSION["soliris_usuario"];

	$error = $_FILES["myfile"]["error"];
	//You need to handle  both cases
	//If Any browser does not support serializing of multiple files using FormData()

	if(!is_array($_FILES["myfile"]["name"])){ //single file
      $fileName = str_replace(' ', '-', $_FILES["myfile"]["name"]);
      $resp = move_uploaded_file($_FILES["myfile"]["tmp_name"], $output_dir.$_POST["tipoDoc"]."_".$_POST["idPac"]."_".$date."_".$fileName);

      if ($resp) {
        $ret[]= "$fileName";
  
        $nombreDoc = $tipoDoc ."_". $idPac ."_".$date."_".$fileName;
  
        $SQL = "CALL `ST_UP_DOC_PACIENTE`('{$idPac}', '$tipoDoc', '$nombreDoc', '$usuario')";

        $response = MySQL_sendFunctionAudit($SQL, "ajx.docs_paciente.php", "1");

        if (empty($response)) {
            $ret[]= " El archivo: '$fileName'. \n Se subió correctamente ";  
        } else {
          $ret[]= $response[0]["mensaje"];
        }
        $ret[] = $nombreDoc;
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