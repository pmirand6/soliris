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
    $direccion = mysqli_real_escape_string($db, $_POST["direccion"]);
    $mail = mysqli_real_escape_string($db, $_POST["mail"]);
    $dir_tec = mysqli_real_escape_string($db, $_POST["dir_tec"]);
    $cont_venta = mysqli_real_escape_string($db, $_POST["cont_venta"]);
    $cont_otro = mysqli_real_escape_string($db, $_POST["cont_otro"]);

    $estado = mysqli_real_escape_string($db, $_POST["estado"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* Seteo de variables */


    /* -------------- */

    if (isset($id) AND $id != ""){
            $SQL = "SELECT FU_UP_CANAL('$nombre', '$familia', '$direccion', '$mail', '$dir_tec', '$cont_venta', '$cont_otro', '$estado', '$usuario', '$id') as response";
        } else {
            /* Verifico que no exista el Medico en la base */
                $arr_exists = mysqli_query($db, "SELECT id FROM canales WHERE canal = '$nombre';");
            /* Determinar el número de filas del resultado */
                $row_cnt = mysqli_num_rows($arr_exists);
                if ($row_cnt == 0){
                    $SQL = "SELECT FU_NEW_CANAL('$nombre', '$familia', '$direccion', '$mail', '$dir_tec', '$cont_venta', '$cont_otro', '$usuario', '$estado') as response";
                }else{
                    echo "ERROR: Ya existe un canal con ese nombre";
                }
                mysqli_free_result($arr_exists);
        }

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "canal_form.php", "1");
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

        $SQL = "UPDATE canales SET estado = 'Inactivo' WHERE id = $id";

        if (isset($SQL) AND $SQL != ""){
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "canal_form.php", "1");
            echo("$response");
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

        $SQL = "UPDATE canales SET estado = 'Activo' WHERE id = $id";

        if (isset($SQL) AND $SQL != ""){
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "canal_form.php", "1");
            echo("$response");
        }

        mysqli_close($db);
    };
}
?>