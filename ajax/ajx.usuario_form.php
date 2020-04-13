<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */


if(isset($_POST["oper"]) AND $_POST["oper"] == "Guardar"){
    
        require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];
    };

    /* Seteo de variables */

    $usuario = mysqli_real_escape_string($db, $_POST["usuario"]);
    $grupo = mysqli_real_escape_string($db, $_POST["grupo"]);
    $familia = "SOL";
    $mail = mysqli_real_escape_string($db, $_POST["mail"]);
    $estado = mysqli_real_escape_string($db, $_POST["estado"]);

    /* -------------- */
//FIXME verificar de corregir la creación de usuarios
    if (isset($id) AND $id != ""){
            $SQL = "SELECT FU_UP_USR('$usuario', '$grupo', '$familia', '$mail', '$estado', '$id') as response";
        } else {
            /* Verifico que no exista el Medico en la base */
                $arr_exists = mysqli_query($db, "select id from usuario where username = '$usuario';");
            /* Determinar el número de filas del resultado */
                $row_cnt = mysqli_num_rows($arr_exists);
                if ($row_cnt == 0){
                    $SQL = "SELECT FU_NEW_USR('$usuario', '$grupo', '$familia', '$mail') as response";
                }else{
                    echo "ERROR: Ya existe un usuario con ese nombre";
                }
                mysqli_free_result($arr_exists);
        }

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "usuario_form.php", "1");
            echo("$response");
    }

    mysqli_close($db);
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "Eliminar"){
    
    require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];
        //FIXME ver harcode de estado
        $SQL = "UPDATE usuario SET estado_id = 2 WHERE id = '$id';";

        if (isset($SQL) AND $SQL != ""){
            //echo $SQL;
            //FIXME harcode de mensaje
            $response = MySQL_sendFunctionAudit("$SQL", "usuario_form.php", "0");
            //echo("$response");
        }

        mysqli_close($db);
    };
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "Activar"){
    
    require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];
        //FIXME harcode de estado
        $SQL = "UPDATE usuario SET estado_id = 1 WHERE id = '$id';";

        if (isset($SQL) AND $SQL != ""){
            //echo $SQL;
            //FIXME hardcode de mensaje
            $response = MySQL_sendFunctionAudit("$SQL", "usuario_form.php", "0");
            //echo("$response");
        }

        mysqli_close($db);
    };
}
?>