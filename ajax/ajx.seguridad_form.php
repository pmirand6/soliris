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
    
    /* Seteo de variables */
    $pagina = strtolower($_POST["pagina"]);
    $descripcion = $_POST["descripcion"];
    $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */

    /* Verifico que no exista el Paciente en la base */
    $arr_exists = mysqli_query($db, "select id from soliris_seguridad where pagina = '$pagina';");

    /* determinar el número de filas del resultado */
    $row_cnt = mysqli_num_rows($arr_exists);
    if ($row_cnt == 0){
        $SQL = "INSERT into soliris_seguridad SET pagina = '$pagina', descripcion = '$descripcion'";
    }else{
        echo "ERROR: Ya existe la página seleccionada";
    }
    mysqli_free_result($arr_exists);

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
//      echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "seguridad_form.php", "0");
        echo("$response");
    }
    mysqli_close($db);
}


if(isset($_POST["oper"]) AND $_POST["oper"] == "SetPermisos"){
    
        require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    


    /* Seteo de variables */
    $idPagina = $_POST["idPagina"];
    $grupo = mysqli_real_escape_string($db, $_POST["grupo"]);
    $estado = $_POST["estado"];
    $usuario = $_SESSION["soliris_usuario"];


   $SQL = "CALL ST_SET_SEGURIDAD($idPagina, '$grupo', $estado, '$usuario')";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
//      echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "seguridad_form.php", "0");
        echo("$response");
    }
    mysqli_close($db);
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "Eliminar"){
    
    require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    


    /* Seteo de variables */
    $id = $_POST["id"];
    $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */

    /* Verifico que no exista el Paciente en la base */
    $arr_exists = mysqli_query($db, "select id from soliris_seguridad where  id = '$id';");

    /* determinar el número de filas del resultado */
    $row_cnt = mysqli_num_rows($arr_exists);
    if ($row_cnt == 0){
        echo "ERROR: No Existe la página seleccionada";
    }else{
        $SQL = "DELETE FROM soliris_seguridad WHERE id = '$id'";
    }
    mysqli_free_result($arr_exists);

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
//      echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "seguridad_form.php", "0");
        echo("$response");
    }
    mysqli_close($db);
}
?>