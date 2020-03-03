<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */

$v_error = true;

if(isset($_POST["oper"]) AND $_POST["oper"] == "Nueva_Venta"){
    
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    /* Seteo de variables */

    $id_paciente = mysqli_real_escape_string($db, $_POST["id_paciente"]);
    $f_venta = mysqli_real_escape_string($db, $_POST["f_venta"]);
    $patologia = mysqli_real_escape_string($db, $_POST["patologia"]);
    $dosis = mysqli_real_escape_string($db, $_POST["dosis"]);
    $unidades = mysqli_real_escape_string($db, $_POST["unidades"]);
    $institucion = mysqli_real_escape_string($db, $_POST["institucion"]);
    $canal = mysqli_real_escape_string($db, $_POST["canal"]);
    //$medico = mysqli_real_escape_string($db, $_POST["medico"]);
    $medico = $_POST["medico"];
    $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */
    /* Cargo la Venta - agregar APM por subquery */
    $SQL = "SELECT FU_NEW_VENTA('$id_paciente', '$f_venta', '$patologia', '$dosis', '$unidades', '$institucion', '$canal', '$medico', '$usuario') as response";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
    //      echo $SQL;
        $response = MySQL_sendFunctionAudit($SQL, "informes_nue_pres.php", "1");
        echo("$response");
    }
    $v_error = false;
}
if(isset($_POST["oper"]) AND $_POST["oper"] == "Mod_Venta"){
    
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    /* Seteo de variables */

    $idMst = mysqli_real_escape_string($db, $_POST["idMst"]);
    $f_venta = mysqli_real_escape_string($db, $_POST["f_venta"]);
    $patologia = mysqli_real_escape_string($db, $_POST["patologia"]);
    $dosis = mysqli_real_escape_string($db, $_POST["dosis"]);
    $unidades = mysqli_real_escape_string($db, $_POST["unidades"]);
    $institucion = mysqli_real_escape_string($db, $_POST["institucion"]);
    $canal = mysqli_real_escape_string($db, $_POST["canal"]);
    $medico = mysqli_real_escape_string($db, $_POST["medico"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */
    /* Cargo la Venta - agregar APM por subquery */
    $SQL = "SELECT FU_MOD_VENTA('$idMst', '$f_venta', '$patologia', '$dosis', '$unidades', '$institucion', '$canal', '$medico', '$usuario') as response";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        //      echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "informes_nue_pres.php", "1");
        echo("$response");
    }
    $v_error = false;
}
if(isset($_POST["oper"]) AND $_POST["oper"] == "Adj_Venta_F_Rec"){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    /* Seteo de variables */

    $id_Maestro = mysqli_real_escape_string($db, $_POST["id_Maestro"]);
    $fecha = mysqli_real_escape_string($db, $_POST["fecha"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */
    /* Cargo la Venta - agregar APM por subquery */
    $SQL = "UPDATE soliris_maestro SET fecha_receta = '$fecha' WHERE id = '$id_Maestro'; ";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendQueryAudit("$SQL", "informes_nue_pres.php");
        echo "$response";
    }
    $v_error = false;
}
if(isset($_POST["oper"]) AND $_POST["oper"] == "Adj_Venta_F_Test"){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    /* Seteo de variables */

    $id_Maestro = mysqli_real_escape_string($db, $_POST["id_Maestro"]);
    $fecha = mysqli_real_escape_string($db, $_POST["fecha"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */
    /* Cargo la Venta - agregar APM por subquery */
    $SQL = "UPDATE soliris_maestro SET fecha_test = '$fecha' WHERE id = '$id_Maestro'; ";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendQueryAudit("$SQL", "informes_nue_pres.php");
        echo "$response";
    }
    $v_error = false;
}
if(isset($_POST["oper"]) AND $_POST["oper"] == "Adj_Venta_F_Otro"){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    /* Seteo de variables */

    $id_Maestro = mysqli_real_escape_string($db, $_POST["id_Maestro"]);
    $fecha = mysqli_real_escape_string($db, $_POST["fecha"]);
    $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */
    /* Cargo la Venta - agregar APM por subquery */
    $SQL = "UPDATE soliris_maestro SET fecha_otro = '$fecha' WHERE id = '$id_Maestro'; ";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendQueryAudit("$SQL", "informes_nue_pres.php");
        echo "$response";
    }
    $v_error = false;
}
if ($v_error) {
    echo "ERROR: La operación ingresada no es válida";
};

?>