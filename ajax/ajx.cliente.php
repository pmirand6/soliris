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


    $convenio = $_POST["selConvenio"];
    $p_zcust_addr = $_POST["zcust_addr"];
    $p_zcust_ad_name = $_POST["zcust_ad_name"];
    $p_zcust_ad_city = $_POST["zcust_city"];
    $p_zcust_ad_line1 = $_POST["zcust_line1"];
    
    $usuario = $_SESSION['soliris_usuario'];

    /* Seteo de variables */

    /* -------------- */

    if (isset($id) and $id != '') {
        $SQL = "SELECT FU_UP_CANAL('$nombre', '$familia', '$direccion', '$mail', '$dir_tec', '$cont_venta', '$cont_otro', '$estado', '$usuario', '$id') as response";
    } else {
        $SQL = "CALL ST_NEW_CANAL('$usuario', $convenio, '$p_zcust_addr', '$p_zcust_ad_name', '$p_zcust_ad_city', '$p_zcust_ad_line1')";

        
        
    }

    /* Realizo la consulta */
    if (isset($SQL) and $SQL != '') {
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", 'canal_form.php', '1');
        echo "$response";
    }

    mysqli_close($db);
}

if (isset($_POST['oper']) and $_POST['oper'] == 'Eliminar') {
    require_once '../config/config.php';
    include_once $_SERVER['DOCUMENT_ROOT']._BD;
    include_once $_SERVER['DOCUMENT_ROOT']._FN;

    if (isset($_POST['id']) and $_POST['id'] != '') {
        $id = $_POST['id'];

        $SQL = "UPDATE canales SET estado_id = 25 WHERE id = $id";

        if (isset($SQL) and $SQL != '') {
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", 'canal_form.php', '1');
            echo "$response";
        }

        mysqli_close($db);
    }
}
if (isset($_POST['oper']) and $_POST['oper'] == 'Activar') {
    require_once '../config/config.php';
    include_once $_SERVER['DOCUMENT_ROOT']._BD;
    include_once $_SERVER['DOCUMENT_ROOT']._FN;

    if (isset($_POST['id']) and $_POST['id'] != '') {
        $id = $_POST['id'];

        $SQL = "UPDATE canales SET estado = 'Activo' WHERE id = $id";

        if (isset($SQL) and $SQL != '') {
            // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", 'canal_form.php', '1');
            echo "$response";
        }

        mysqli_close($db);
    }
}
