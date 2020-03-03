<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */


if(isset($_POST["oper"]) AND $_POST["oper"] == "Guardar"){
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];
    };

    $nombre = mysqli_real_escape_string($db, $_POST["nombre"]);
    $estado = mysqli_real_escape_string($db, $_POST["estado"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* Seteo de variables */


    /* -------------- */

    if (isset($id) AND $id != ""){
        $SQL = "SELECT FU_UP_APM('$nombre', '$estado', '$usuario', '$id') as response";
    } else {
        /* Verifico que no exista el APM en la base */
        $arr_exists = mysqli_query($db, "SELECT id FROM apm WHERE nombre = '$nombre';");
        /* Determinar el número de filas del resultado */
        $row_cnt = mysqli_num_rows($arr_exists);
        if ($row_cnt == 0){
            $SQL = "SELECT FU_NEW_APM('$nombre', '$usuario') as response";
        }else{
            echo "ERROR: Ya existe un APM con ese nombre";
        }
        mysqli_free_result($arr_exists);
    }

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "apm_form.php", "1");
        echo("$response");
    }

    mysqli_close($db);
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "Eliminar"){
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];

        $SQL = "UPDATE apm SET estado = 'Inactivo' WHERE id = $id";

        if (isset($SQL) AND $SQL != ""){
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "apms_form.php", "1");
            echo("$response");
        }

        mysqli_close($db);
    };
}
if(isset($_POST["oper"]) AND $_POST["oper"] == "Reactivar"){
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];

        $SQL = "UPDATE apm SET estado = 'Activo' WHERE id = $id";

        if (isset($SQL) AND $SQL != ""){
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "apms_form.php", "1");
            echo("$response");
        }

        mysqli_close($db);
    };
}
?>