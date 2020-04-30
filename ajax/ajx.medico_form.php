<?php

/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */


if (isset($_POST["oper"]) and $_POST["oper"] == "Guardar") {


    require($_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;


    $nombre = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["nombre"])));
    $apellido = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["apellidos"])));
    $matricula_tipo = $_POST["matricula_tipo"];
    $matricula_numero = mysqli_real_escape_string($db, $_POST["matricula_numero"]);
    $lugar = mysqli_real_escape_string($db, $_POST["lugar"]);
    $c_atencion = mysqli_real_escape_string($db, strtoupper($_POST["c_atencion"]));
    $telefono = mysqli_real_escape_string($db, $_POST["telefono"]);
    $fax = mysqli_real_escape_string($db, $_POST["fax"]);
    $email = mysqli_real_escape_string($db, $_POST["email"]);
    $domicilio = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["domicilio"])));
    $localidad = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["localidad"])));
    $provincia = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["provincia"])));
    $especialidades = $_POST["especialidad"];
    $apm = mysqli_real_escape_string($db, $_POST["apm"]);
    $usuario = $_SESSION["soliris_usuario"];

    $SQL = "CALL ST_NEW_MEDICO(
    '$nombre', 
    '$apellido', 
    '$matricula_tipo', 
    '$matricula_numero', 
    '$lugar', 
    '$c_atencion', 
    '$telefono', 
    '$fax', 
    '$domicilio', 
    '$localidad', 
    '$provincia', 
    '$apm', 
    '$email',
    '$usuario')";


    // Realizo la consulta
    if (isset($SQL) and $SQL != "") {
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "medico_form.php", "1");
        $idMedico = $response[0]["mensaje"];
        if (is_numeric($idMedico)) {
            foreach ($especialidades as $esp) {
                $SQL = "CALL ST_REL_ESP_MED($idMedico, '$esp')";
                mysqli_query($db, $SQL);
            }
            echo $idMedico;
        } else {
            echo $response[0]["mensaje"];
        }
    }
    mysqli_close($db);
}

if (isset($_POST["oper"]) and $_POST["oper"] == "Actualizar") {


    require($_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    include_once $_SERVER['DOCUMENT_ROOT'] . _MAIL;




    if (isset($_POST["id"]) and $_POST["id"] != "") {
        $id = $_POST["id"];
    };

    $nombre = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["nombre"])));
    $apellido = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["apellidos"])));
    $matricula_tipo = $_POST["matricula_tipo"];
    $matricula_numero = mysqli_real_escape_string($db, $_POST["matricula_numero"]);
    $lugar = mysqli_real_escape_string($db, $_POST["lugar"]);
    $c_atencion = mysqli_real_escape_string($db, strtoupper($_POST["c_atencion"]));
    $telefono = mysqli_real_escape_string($db, $_POST["telefono"]);
    $fax = mysqli_real_escape_string($db, $_POST["fax"]);
    $email = mysqli_real_escape_string($db, $_POST["email"]);
    $domicilio = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["domicilio"])));
    $localidad = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["localidad"])));
    $provincia = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["provincia"])));
    $notas = mysqli_real_escape_string($db, $_POST["notas"]);

    $especialidades = $_POST["especialidad"];
    $apm = mysqli_real_escape_string($db, $_POST["apm"]);
    $usuario = $_SESSION["soliris_usuario"];
    $estado_id = mysqli_real_escape_string($db, $_POST["estado"]);


    $SQLMed = "CALL ST_UP_MEDICO($id, $estado_id, '$nombre', '$apellido',
     $matricula_tipo, '$matricula_numero', '$lugar', '$c_atencion', '$telefono', '$fax', '$domicilio', '$localidad','$provincia', $apm, '$email', '$usuario', '$notas')";


    foreach ($especialidades as $esp) {
        $SQL = "CALL ST_REL_ESP_MED($id, '$esp')";
        mysqli_query($db, $SQL);
        free_all_results($db);
    }



    // Realizo la consulta
    if (isset($SQL) and $SQL != "") {
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQLMed", "medico_form.php", "1");

        echo $response[0]['mensaje'];
    }

    //NOTE Switcheo entreo los estados del medico para el envio del mail
    switch ($estado_id) {
        case 19:
            sendMail_ModificacionMedico($id);
            break;
        case 20:
            sendMail_BajaMedico($id);
            break;
    }

    mysqli_close($db);
}
