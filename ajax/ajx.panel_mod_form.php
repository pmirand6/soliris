<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */
  
    require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _MAIL;

// MODIFICADO PGM - INICIAR SESION UNICAMENTE SI NO ESTA INICIADA 1/9/2017
if (session_status() == PHP_SESSION_NONE) {
session_start();
  }
  

if(isset($_POST["oper"]) AND $_POST["oper"] == "nu" AND !empty($_POST["id"])){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    /* Seteo de variables */
    $id = $_POST["id"];
    $paciente = $_POST["paciente"];
    $comentario = mysqli_real_escape_string($db, $_POST["comentario"]);
    $estado = mysqli_real_escape_string($db, $_POST["estado"]);
    $grupo = $_SESSION["grupo"];
    $usuario = $_SESSION["soliris_usuario"];

    switch ($estado){
        case "Autorizado":
            $validacion = "N/";
   //			sendMailPM("Autorizado",$paciente,'','');
        break;
        default:
            $validacion = "";
   //			sendMailPM("Rechazado",$paciente,'','');
        break;
   }
   /* -------------- */

    $SQL = "SELECT FU_UP_PANEL_MOD('$id', '$comentario', '$estado', '$grupo', '$validacion', '$usuario') as response";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "panel_mod.php", "1");
            echo "$response";
    } else {
        echo "Error";
    }
    mysqli_close($db);

    sendMailPM($estado, $paciente, $id, $comentario);
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "up" AND !empty($_POST["id"])){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    /* Seteo de variables */
    $id = $_POST["id"];
    $paciente = $_POST["paciente"];
    $usuario = $_SESSION["soliris_usuario"];
    /* -------------- */

    $SQL = "SELECT FU_CONVEN_PANEL_MOD('$id', '$usuario') as response";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "panel_mod.php", "1");
        echo("$response");
    } else {
        echo "Error";
    }
    mysqli_close($db);
}?>
