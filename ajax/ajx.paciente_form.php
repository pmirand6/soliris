<?php

require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _MAIL;



// crear paciente
if (isset($_POST["oper"]) and (strcasecmp($_POST["oper"], "savePac") == 0)) {

    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;


    /* Seteo de variables */
    // Varaibles que no pueden ser NULL o vacías
    $nombre = mysqli_real_escape_string($db, strtoupper($_POST["nombre"]));
    $apellido = mysqli_real_escape_string($db, strtoupper($_POST["apellido"]));
    $f_nac = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_POST["f_nac"]))), 'Y-m-d');
    $sexo = mysqli_real_escape_string($db, strtoupper($_POST["sexo"]));
    $pais = mysqli_real_escape_string($db, strtoupper($_POST["pais"]));
    $estado = (!isset($_POST["estado"]) || $_POST["estado"] != '' || $_SESSION["grupo"] != 'ventas') ? 7 : $_POST["estado"];
    $sub_estado = mysqli_real_escape_string($db, $_POST["sub_estado"]);
    $patologia = mysqli_real_escape_string($db, $_POST["patologia"]);
    $usuario = $_SESSION["soliris_usuario"];

    // Varaibles que pueden ser NULL o Vacías
    // Se chequea con la funcion parametroEmptyChceck que devuelve un string vacío
    // o el parametro sanitizado
    if (!empty($_POST["sub_patologia"]) && isset($_POST["sub_patologia"])){
        $sub_patologia =mysqli_real_escape_string($db, $_POST["sub_patologia"]);
    }else{
        $sub_patologia =4;
    }
    
    //$sub_patologia = (isset($_POST["sub_patologia"]) ? mysqli_real_escape_string($db, $_POST["sub_patologia"]) : 4);
    $os = (!empty($_POST["os"])) ? $_POST["os"] : 1;
    $telefono = (isset($_POST["telefono"]) ? mysqli_real_escape_string($db, $_POST["telefono"]) : NULL);
    $ciudad = (isset($_POST["ciudad"]) ? mysqli_real_escape_string($db, $_POST["ciudad"]) : NULL);
    $mail = (isset($_POST["mail"]) ? mysqli_real_escape_string($db, $_POST["mail"]) : NULL);
    //$cmrid = ((isset($_POST["crm_id"]) && (!empty($_POST["crm_id"])) ? mysqli_real_escape_string($db, $_POST["crm_id"]) : 0;
    if (isset($_POST["crm_id"]) && !empty($_POST["crm_id"])) {
        $cmrid = mysqli_real_escape_string($db, $_POST["crm_id"]);
    } else {
        $cmrid = 0;
    }



    // Creo Paciente
    $SQL = "CALL `ST_NEW_PACIENTE`(
            '$apellido', 
            '{$nombre}', 
            '{$f_nac}', 
            '{$sexo}', 
            '{$telefono}', 
            '{$ciudad}', 
            {$pais}, 
            '{$mail}', 
            {$patologia}, 
            {$sub_patologia}, 
            {$os}, 
            '{$usuario}', 
            '{$sub_estado}', 
            {$cmrid})";



    /* Realizo la consulta */
    // Verificar el log de auditoria
    if (isset($SQL) and $SQL != "") {
        $response = MySQL_sendFunctionAudit("$SQL", "paciente_form.php", "1");
        echo $response[0]["mensaje"];
        // TODO VER ENVIO DE MAIL EN EL ALTA DEL PACIENTE
        //  sendMailPM('Paciente Pendiente', $nombre, '', '');

    }
    mysqli_close($db);
}

if (isset($_POST["oper"]) and (strcasecmp($_POST["oper"], "bajaPac") == 0)) {
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    $idPac = $_POST["idPac"];
    $notas = mysqli_real_escape_string($db, $_POST["notas"]);

    $SQL = "CALL ST_BAJA_PAC($idPac, '$notas')";
    
        /* Realizo la consulta */
        // Verificar el log de auditoria
        if (isset($SQL) and $SQL != "") {

            $response = MySQL_sendFunctionAudit("$SQL", "paciente_form.php", "0");
            
            // FIXME ARREGLAR EL ENVIO DE MAIL CUANDO SE ACTUALIZA EL PACIENTE
            //  sendMailPM('Paciente Pendiente', $nombre, '', '');

        }
        mysqli_close($db);
}




if (isset($_POST["oper"]) and (strcasecmp($_POST["oper"], "actualizaPac") == 0)) {
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;


    if (isset($_POST["idPac"]) and $_POST["idPac"] !== "" and !empty($_POST["idPac"])) {
        $idPac = $_POST["idPac"];
        /* Seteo de variables */
        // Varaibles que no pueden ser NULL o vacías
        $nombre = mysqli_real_escape_string($db, strtoupper($_POST["nombre"]));
        $apellido = mysqli_real_escape_string($db, strtoupper($_POST["apellido"]));
        $f_nac = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_POST["f_nac"]))), 'Y-m-d');
        $sexo = mysqli_real_escape_string($db, strtoupper($_POST["sexo"]));
        $pais = mysqli_real_escape_string($db, strtoupper($_POST["pais"]));
        $estado = (!isset($_POST["estado"]) || $_POST["estado"] != '' || $_SESSION["grupo"] != 'atencion_paciente') ? 7 : $_POST["estado"];
        $sub_estado = mysqli_real_escape_string($db, $_POST["sub_estado"]);
        $patologia = mysqli_real_escape_string($db, $_POST["patologia"]);
        $notas = mysqli_real_escape_string($db, $_POST["notas"]);
        $usuario = $_SESSION["soliris_usuario"];

        // Varaibles que pueden ser NULL o Vacías
        // Se chequea con la funcion parametroEmptyChceck que devuelve un string vacío
        // o el parametro sanitizado

        $sub_patologia = (isset($_POST["sub_patologia"]) ? mysqli_real_escape_string($db, $_POST["sub_patologia"]) : 4);
        $os = (isset($_POST["os"]) ? mysqli_real_escape_string($db, $_POST["os"]) : 4);
        $telefono = (isset($_POST["telefono"]) ? parametroEmptyChceck($_POST["telefono"]) : NULL);
        $ciudad = (isset($_POST["ciudad"]) ? parametroEmptyChceck($_POST["ciudad"]) : NULL);
        $mail = (isset($_POST["mail"]) ? parametroEmptyChceck($_POST["mail"]) : NULL);
        $cmrid = (isset($_POST["crm_id"]) ? parametroEmptyChceck($_POST["crm_id"]) : NULL);



        /* -------------- */

        // Actualizo Paciente

        $SQL = "CALL ST_UP_PACIENTE(
            $idPac,
            '$apellido', 
            '{$nombre}', 
            '{$f_nac}', 
            '{$sexo}', 
            '{$telefono}', 
            '{$ciudad}', 
            {$pais}, 
            '{$mail}', 
            {$patologia}, 
            {$sub_patologia}, 
            {$os}, 
            '{$usuario}', 
            '{$sub_estado}',
            '$estado', 
            {$cmrid},
            '$notas')";

            

        /* Realizo la consulta */
        // Verificar el log de auditoria
        if (isset($SQL) and $SQL != "") {

            $response = MySQL_sendFunctionAudit("$SQL", "paciente_form.php", "1");
            echo $response[0]["mensaje"];
            // FIXME ARREGLAR EL ENVIO DE MAIL CUANDO SE ACTUALIZA EL PACIENTE
            //  sendMailPM('Paciente Pendiente', $nombre, '', '');

        }
        mysqli_close($db);
    } else {
        echo "ERROR: No se encontró el paciente";
    }


    echo "ERROR: ERROR AL EJECUTAR LA ACTUALIZACION DEL PACIENTE";
}

// validar paciente
if (isset($_POST["oper"]) and (strcasecmp($_POST["oper"], "ValidaPac") == 0)) {
    // TODO VER ENVIO DE VALIDACION DEL PACIENTE
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["idPac"]) and $_POST["idPac"] != "") {
        /* Seteo de variables */
        $idPac = $_POST["idPac"];
        $comentario = mysqli_real_escape_string($db, $_POST["comentario"]);
        $estado = mysqli_real_escape_string($db, $_POST["estadoList"]);
        $usuario = $_SESSION["soliris_usuario"];

        /* -------------- */

        $SQL = "CALL ST_VAL_PAC('$idPac', '$comentario', '$estado', '$usuario')";



        /* Realizo la consulta */
        if (isset($SQL) and $SQL != "") {
            $response = MySQL_sendFunctionAudit("$SQL", "paciente_form.php", "1");
            echo ($response[0]["mensaje"]);
            // TODO ver mail de envío aprobacion paciente
            //sendMailPM("Paciente $estado", $nombre, '', $comentario);
        }
        mysqli_close($db);
    };
}

if (isset($_POST["oper"]) and strcasecmp($_POST["oper"], 'e_edad') == 0) {

    $edad = $_POST["edad"];
    $sexo = "";
    $sexo = $_POST["sexo"];
    //echo f_l_edad_pac($edad);
    echo f_l_edad_pac($edad, $sexo);
}
