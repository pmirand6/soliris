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




?>