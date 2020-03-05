<?php 

if(isset($_POST["oper"]) AND $_POST["oper"] == "DocPacModified"){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        /* Seteo de variables */
        $id = $_POST["id"];
        $usuario = $_SESSION["soliris_usuario"];

        $SQLnom = "SELECT nombre_completo FROM paciente WHERE id = '$id';";
        $resultnom = mysqli_query($db, $SQLnom);
        while ($row = mysqli_fetch_assoc($resultnom)) {
          $nombre = $row["Nombre"];
        }
        /* -------------- */

        //$SQL = "SELECT FU_VAL_PAC('$id', '', '', '$usuario') as response";
        $SQL = "SELECT soliris.ST_DOC_PAC_MODIFIED";
        /* Realizo la consulta */
        if (isset($SQL) AND $SQL != ""){
            $response = MySQL_sendFunctionAudit("$SQL", "paciente_form.php", "1");
            echo $response;

            //sendMailPM("Paciente $estado", $nombre, '', '');
            
        }
        mysqli_close($db);
    };
}




?>