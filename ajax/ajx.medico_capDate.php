<?php
/**
 * Created by PhpStorm.
 * User: jgallina
 * Date: 04/05/2015
 * Time: 04:18 PM
 */

if(isset($_POST["oper"]) AND $_POST["oper"] == "reCap"){
    
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    $id = $_POST["id"];
    $fecha_cap = $_POST["fecha_cap"];

   /* $SQL = "UPDATE medicos SET fecha_cap = '$fecha_cap' WHERE id = '$id';"; Se quita la actualizacion de la capacitacion para que unicamente quede del lado 
   de la carga de la cabecera*/

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendQueryAudit("$SQL", "Fecha de Capacitación");
        echo("$response");
    }

    $res_lastDoc = mysqli_query($db, "SELECT id FROM soliris_documentacion WHERE referencia = 'medicos' AND id_maestro = '$id' AND tipo = 'Capacitacion' ORDER BY id DESC LIMIT 1");

    while ($arr_lastDoc = mysqli_fetch_assoc($res_lastDoc)) {
        $lastDoc = $arr_lastDoc["id"];
    }

    if (strlen($lastDoc) > 0){
        $SQL1 = "UPDATE soliris_documentacion SET fecha = '$fecha_cap' WHERE referencia = 'medicos' AND id_maestro = '$id' AND tipo = 'Capacitacion' AND id = '$lastDoc';";

        // Modifico el soliris_documentacion
        if (isset($SQL1) AND $SQL1 != ""){
            // echo $SQL;
            $response1 = MySQL_sendQueryAudit("$SQL1", "Fecha de Capacitación en la Tabla soliris_documentacion");
            echo("$response1");
        }
    }
    mysqli_close($db);

}
?>
