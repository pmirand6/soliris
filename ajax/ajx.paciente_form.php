<?php

require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _MAIL;



// crear paciente o actualizar paciente
if(isset($_POST["oper"]) AND $_POST["oper"] == "Guardar"){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    
    (isset($_POST["idPac"]) AND $_POST["idPac"] != "") ? $idPac = $_POST["idPac"] : '';
    

    /* Seteo de variables */
        // Varaibles que no pueden ser NULL o vacías
        $nombre = mysqli_real_escape_string($db, strtoupper($_POST["nombre"]));
        $apellido = mysqli_real_escape_string($db, strtoupper($_POST["apellido"]));
        $f_nac = mysqli_real_escape_string($db, strtoupper($_POST["f_nac"]));
        $sexo = mysqli_real_escape_string($db, strtoupper($_POST["sexo"]));
        $pais = mysqli_real_escape_string($db, strtoupper($_POST["pais"]));
        $estado = (!isset($_POST["estado"]) || $_POST["estado"] != '' || $_SESSION["grupo"] != 'ventas') ? 7 : $_POST["estado"];
        $sub_estado = mysqli_real_escape_string($db, $_POST["sub_estado"]);
        $patologia = mysqli_real_escape_string($db, $_POST["patologia"]);
        $usuario = $_SESSION["soliris_usuario"];

        // Varaibles que pueden ser NULL o Vacías
        // Se chequea con la funcion parametroEmptyChceck que devuelve un string vacío
        // o el parametro sanitizado
                
        $sub_patologia = (isset($_POST["sub_patologia"]) ? mysqli_real_escape_string($db, $_POST["sub_patologia"]) : 4);
        $os = parametroEmptyChceck($_POST["os"]);
        $telefono = parametroEmptyChceck($_POST["telefono"]);
        $ciudad = parametroEmptyChceck($_POST["ciudad"]);
        $mail = (isset($_POST["mail"]) ? parametroEmptyChceck($_POST["mail"]) : 'NULL');
        $cmrid = (isset($_POST["crm_id"]) ? parametroEmptyChceck($_POST["crm_id"]) : 'NULL');

        
    /* -------------- */
    
    if (isset($idPac) AND $idPac != ""){
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
            {$cmrid})";
    } else {
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

    }
    
    /* Realizo la consulta */
    // Verificar el log de auditoria
    if (isset($SQL) AND $SQL != ""){
        $response = MySQL_sendFunctionAudit("$SQL", "paciente_form.php", "1");
        echo $response[0]["mensaje"];
        
      //  sendMailPM('Paciente Pendiente', $nombre, '', '');

    }
    mysqli_close($db);
}

// validar paciente
if(isset($_POST["oper"]) AND (strcasecmp($_POST["oper"], "ValidaPac") == 0)){
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["idPac"]) AND $_POST["idPac"] != ""){
        /* Seteo de variables */
        $idPac = $_POST["idPac"];
        $nombre = mysqli_real_escape_string($db, $_POST["nombre"]);
        $comentario = mysqli_real_escape_string($db, $_POST["comentario"]);
        $estado = mysqli_real_escape_string($db, $_POST["estado"]);
        $usuario = $_SESSION["soliris_usuario"];

        /* -------------- */
	
        $SQL = "SELECT FU_VAL_PAC('$idPac', '$comentario', '$estado', '$usuario') as response";

        /* Realizo la consulta */
        if (isset($SQL) AND $SQL != ""){
            $response = MySQL_sendFunctionAudit("$SQL", "paciente_form.php", "1");
            echo($response[0]["mensaje"]);

            sendMailPM("Paciente $estado", $nombre, '', $comentario);
        }
        mysqli_close($db);
		
    };
}

function l_aprobated($estado) {
    switch ($estado) {
        case "Aprobado":
            return "'" . $_SESSION["soliris_usuario"] . "'";
			break;
        default:
            return "null";
			break;
    }
}

if (isset($_POST["oper"]) AND strcasecmp($_POST["oper"], 'e_edad') == 0) {

    $edad = $_POST["edad"];
    $sexo = "";
    $sexo = $_POST["sexo"];
    //echo f_l_edad_pac($edad);
    echo f_l_edad_pac($edad, $sexo);
}
?>
