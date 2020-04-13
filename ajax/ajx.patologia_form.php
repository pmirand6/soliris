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
    $familia = mysqli_real_escape_string($db, $_POST["familia"]);
    $estado = mysqli_real_escape_string($db, $_POST["estado"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* Seteo de variables */


    /* -------------- */

    if (isset($id) AND $id != ""){
            $SQL = "SELECT FU_UP_PATOLOGIA('$nombre', '$familia', '$estado', '$usuario', '$id') as response";
        } else {
            /* Verifico que no exista el Medico en la base */
            //FIXME migrar control de existencia a la función
                $arr_exists = mysqli_query($db, "SELECT id FROM patologia WHERE patologia_nombre = '$nombre';");
            /* Determinar el número de filas del resultado */
                $row_cnt = mysqli_num_rows($arr_exists);
                if ($row_cnt == 0){
                    $SQL = "SELECT FU_NEW_PATOLOGIA('$nombre', '$familia', '$usuario') as response";
                }else{
                    echo "ERROR: Ya existe una Patología con ese nombre";
                }
                mysqli_free_result($arr_exists);
        }

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
            // echo $SQL;
        // FIXME VER HARCODE MENSAJE
            $response = MySQL_sendFunctionAudit("$SQL", "ajx.patologia_form.php", "1");
            echo $response[0]["response"];
    }

    mysqli_close($db);
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "Eliminar"){
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];
        // FIXME ver harcode del estado
        $SQL = "UPDATE patologia SET estado_id = 6 WHERE id = $id";

        if (isset($SQL) AND $SQL != ""){
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "ajx.patologia_form.php", "0");
            //FIXME ver hardcode de mensaje
            //var_dump($response);
        }

        mysqli_close($db);
    };
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "Activar"){
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];
        //FIXME ver harcode del estado
        $SQL = "UPDATE patologia SET estado_id = 5 WHERE id = $id";

        if (isset($SQL) AND $SQL != ""){
            
            $response = MySQL_sendFunctionAudit("$SQL", "ajx.patologia_form.php", "0");
            //FIXME ver harcode mensaje
            //echo $response[0]["mensaje"];
        }

        mysqli_close($db);
    };
}
?>