<?php

/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */


if (isset($_POST["oper"]) and $_POST["oper"] == "Guardar") {

    require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) and $_POST["id"] != "") {
        $id = $_POST["id"];
    };

    /* Seteo de variables */

    $usuario = mysqli_real_escape_string($db, $_POST["usuario"]);
    $rol = mysqli_real_escape_string($db, $_POST["rol"]);
    $familia = "SOL";
    $mail = mysqli_real_escape_string($db, $_POST["mail"]);
    $estado = mysqli_real_escape_string($db, $_POST["estado"]);

    /* -------------- */
    //FIXME verificar de corregir la creación de usuarios
    if (isset($id) and $id != "") {
        $SQL = "CALL `ST_UP_USUARIO`($id, '$usuario', '$mail', '$estado', $rol)";
    } else {
        $SQL = "CALL `ST_NEW_USUARIO`('$usuario', '$mail', '$estado', $rol)";
        
    }

    

    /* Realizo la consulta */
    if (isset($SQL) and $SQL != "") {
        $response = MySQL_sendFunctionAudit("$SQL", "usuario_form.php", "1");
        echo ($response[0]["mensaje"]);
    }

    mysqli_close($db);
}

if (isset($_POST["oper"]) and $_POST["oper"] == "Eliminar") {

    require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) and $_POST["id"] != "") {
        $id = $_POST["id"];
        //FIXME ver harcode de estado
        $SQL = "UPDATE usuario SET estado_id = 2 WHERE id = '$id';";

        if (isset($SQL) and $SQL != "") {
            //echo $SQL;
            //FIXME harcode de mensaje
            $response = MySQL_sendFunctionAudit("$SQL", "usuario_form.php", "0");
            //echo("$response");
        }

        mysqli_close($db);
    };
}

if (isset($_POST["oper"]) and $_POST["oper"] == "Activar") {

    require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) and $_POST["id"] != "") {
        $id = $_POST["id"];
        //FIXME harcode de estado
        $SQL = "UPDATE usuario SET estado_id = 1 WHERE id = '$id';";

        if (isset($SQL) and $SQL != "") {
            //echo $SQL;
            //FIXME hardcode de mensaje
            $response = MySQL_sendFunctionAudit("$SQL", "usuario_form.php", "0");
            //echo("$response");
        }

        mysqli_close($db);
    };
}
