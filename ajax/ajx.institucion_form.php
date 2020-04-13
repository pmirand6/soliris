<?php

/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */

if (isset($_POST["oper"]) and $_POST["oper"] == "Guardar") {

    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;


    if (isset($_POST["id"]) and $_POST["id"] != "") {
        $id = $_POST["id"];
    };

    $nombre = mysqli_real_escape_string($db, $_POST["nombre"]);
    $direccion = mysqli_real_escape_string($db, $_POST["direccion"]);
    $altura = mysqli_real_escape_string($db, $_POST["altura"]);
    $localidad = mysqli_real_escape_string($db, $_POST["localidad"]);
    $provincia = mysqli_real_escape_string($db, $_POST["provincia"]);
    $contacto = mysqli_real_escape_string($db, $_POST["contacto"]);
    $mail = mysqli_real_escape_string($db, $_POST["mail"]);
    $telefono = mysqli_real_escape_string($db, $_POST["telefono"]);
    $notas = mysqli_real_escape_string($db, $_POST["notas"]);
    $tipo = mysqli_real_escape_string($db, $_POST["tipo"]);
    $estado = mysqli_real_escape_string($db, $_POST["estado"]);
    $familia = mysqli_real_escape_string($db, $_POST["familia"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* Seteo de variables */


    /* -------------- */

    if (isset($id) and $id != "") {
        $SQL = "SELECT FU_UP_INST('$nombre', '$direccion', '$altura', '$localidad', '$provincia', '$contacto', '$mail', '$telefono', '$notas', '$tipo', '$estado', '$familia', '$usuario', '$id') as response";
    } else {
        /* Verifico que no exista la Institucion en la base */
        $arr_exists = mysqli_query($db, "select id from institucion where nombre = '$nombre';");
        /* Determinar el número de filas del resultado */
        //FIXME controlar la carga de las instituciones con el mismo nombre
        $row_cnt = mysqli_num_rows($arr_exists);
        if ($row_cnt == 0) {
            if(empty($altura)) $altura = 'NULL';
            $SQL = "SELECT FU_NEW_INST('$nombre', '$direccion', {$altura} , '$localidad', '$provincia', '$contacto', '$mail', '$telefono', '$notas', '$tipo', '$familia', '$usuario') as response";
            echo $SQL;
        } else {
            echo "ERROR: Ya existe un institución con ese nombre";
        }
        mysqli_free_result($arr_exists);
    }

    /* Realizo la consulta */
    if (isset($SQL) and $SQL != "") {
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "institucion_form.php", "1");
        echo $response[0]["mensaje"];
    }

    mysqli_close($db);
}

if (isset($_POST["oper"]) and $_POST["oper"] == "Eliminar") {

    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) and $_POST["id"] != "") {
        $id = $_POST["id"];

        $SQL = "DELETE FROM institucion WHERE id = $id";

        if (isset($SQL) and $SQL != "") {
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "institucion_form.php", "1");
            echo $response[0]["mensaje"];
        }

        mysqli_close($db);
    };
}
