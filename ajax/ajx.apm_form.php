<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM.
 */
if (isset($_POST['oper']) and $_POST['oper'] == 'Guardar') {
    require_once '../config/config.php';
    include_once $_SERVER['DOCUMENT_ROOT']._BD;
    include_once $_SERVER['DOCUMENT_ROOT']._FN;

    if (isset($_POST['id']) and $_POST['id'] != '') {
        $id = $_POST['id'];
    }

    $username = mysqli_real_escape_string($db, $_POST['username']);
    $email = $_POST['email'];
    $nombreCompleto = $_POST['nombreCompleto'];
    $estado = mysqli_real_escape_string($db, $_POST['estado']);
    $usuario = $_SESSION['soliris_usuario'];

    /* Seteo de variables */

    /* -------------- */

    if (isset($id) and $id != '') {
        $SQL = "SELECT FU_UP_APM('$id', '$estado', '$usuario') as response";
    } else {
        /* Verifico que no exista el APM en la base */
        $arr_exists = mysqli_query($db, "SELECT id FROM apm WHERE email = '$email';");
        /* Determinar el número de filas del resultado */
        $row_cnt = mysqli_num_rows($arr_exists);
        if ($row_cnt == 0) {
            $SQL = "CALL ST_NEW_APM('$estado', '$usuario', '$username', '$email', '$nombreCompleto')";
        } else {
            echo 'ERROR: Ya existe un APM con ese nombre';
        }
        mysqli_free_result($arr_exists);
    }

    /* Realizo la consulta */
    if (isset($SQL) and $SQL != '') {
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", 'apm_form.php', '1');
        echo $response[0]['mensaje'];
    }

    mysqli_close($db);
}

if (isset($_POST['oper']) and $_POST['oper'] == 'Eliminar') {
    require_once '../config/config.php';
    include_once $_SERVER['DOCUMENT_ROOT']._BD;
    include_once $_SERVER['DOCUMENT_ROOT']._FN;

    if (isset($_POST['id']) and $_POST['id'] != '') {
        $id = $_POST['id'];

        //FIXME revisar harcode del estado
        $SQL = "UPDATE apm SET estado_id = 18 WHERE id = $id";

        if (isset($SQL) and $SQL != '') {
            echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", 'apms_form.php', '1');
            echo $response[0]['mensaje'];
        }

        mysqli_close($db);
    }
}
if (isset($_POST['oper']) and $_POST['oper'] == 'Reactivar') {
    require_once '../config/config.php';
    include_once $_SERVER['DOCUMENT_ROOT']._BD;
    include_once $_SERVER['DOCUMENT_ROOT']._FN;

    if (isset($_POST['id']) and $_POST['id'] != '') {
        $id = $_POST['id'];
        //FIXME revisar harcode de estado
        $SQL = "UPDATE apm SET estado_id = 17 WHERE id = $id";

        if (isset($SQL) and $SQL != '') {
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", 'apms_form.php', '1');
            echo $response[0]['mensaje'];
        }

        mysqli_close($db);
    }
}
