<?php

require '../clases/MailNotificaciones.php';


// Notificacion de prueba

function sendMail_Test($idMedico, $accion)
{

    $SQL = "CALL ST_MAIL_MEDICO('$idMedico', '$accion')";
    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "mailMedico", "1");
    }

    $emailsArray = $response[0]["emails"];
    $chunks = array_chunk(preg_split('/(-|,)/', $emailsArray), 2);
    $emails = array_combine(array_column($chunks, 1), array_column($chunks, 0));
    
    $body = file_get_contents('../mails/medico/emailMedico.php');
    //$body = file_get_contents('../mails/medico/demo.php');
    /*$variables = array(
        "{{accion}}" => $accion,
        "{{nom_medico}}" => $response[0]["nom_medico"],
        "{{accion2}}" => 'Se ha creado con exito',
        "{{especificacion_cambio}}" => 'El registro ha sido creado por',
        "{{user_accion}}" => $response[0]['usuario'],
        "{{notas}}" => $response[0]['notas'],
        "{{url}}" => "http://" . _URL_SERVIDOR ."/". _NAME ."/defa.php?url=/administrador/medico.php&args=?id=" . $idMedico
    );

    foreach ($variables as $key => $value) {
        $body = str_replace($key, $value, $body);
    }*/
    
    MailNotificaciones::sendMessage('Alta de Medico', $body, ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
}


// Notificaciones Venta
function sendMail_AltaVenta()
{
    MailNotificaciones::sendMessage('mail prueba', 'este es el body', ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
}

function sendMail_ModificacionVenta()
{
    MailNotificaciones::sendMessage('mail prueba', 'este es el body', ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
}

function sendMail_CancelacionVenta()
{
    MailNotificaciones::sendMessage('mail prueba', 'este es el body', ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
}

function sendMail_ErrorDocVenta($idVenta)
{
    MailNotificaciones::sendMessage('mail prueba', 'este es el body', ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
}
// Notificaciones Medico

function sendMail_AltaMedico($idMedico)
{
    //FIXME Verificar Hardcode de la accion
    $SQL = "CALL ST_MAIL_MEDICO('$idMedico', 'Alta de Medico')";
    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "mailMedico", "1");
    }

    $emailsArray = $response[0]["emails"];
    $chunks = array_chunk(preg_split('/(-|,)/', $emailsArray), 2);
    $emails = array_combine(array_column($chunks, 1), array_column($chunks, 0));
    
    $body = file_get_contents('../mails/medico/emailMedico.php');
    $variables = array(
        "{{accion}}" => 'Alta de Medico',
        "{{nom_medico}}" => $response[0]["nom_medico"],
        "{{accion2}}" => 'Se ha creado con exito',
        "{{especificacion_cambio}}" => 'El registro ha sido creado por',
        "{{user_accion}}" => $response[0]['usuario'],
        "{{notas}}" => $response[0]['notas'],
        "{{url}}" => "http://" . _URL_SERVIDOR ."/". _NAME ."/defa.php?url=/administrador/medico.php&args=?id=" . $idMedico
    );

    foreach ($variables as $key => $value) {
        $body = str_replace($key, $value, $body);
    }
    
    MailNotificaciones::sendMessage('Alta de Medico', $body, $emails);
}

function sendMail_ModificacionMedico($idMedico)
{
    //FIXME Verificar Hardcode de la accion
    $SQL = "CALL ST_MAIL_MEDICO('$idMedico', 'Modificacion Medico')";
    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "mailMedico", "1");
    }

    $emailsArray = $response[0]["emails"];
    $chunks = array_chunk(preg_split('/(-|,)/', $emailsArray), 2);
    $emails = array_combine(array_column($chunks, 1), array_column($chunks, 0));
    
    $body = file_get_contents('../mails/medico/emailMedico.php');
    $variables = array(
        "{{accion}}" => 'Modificación de Medico',
        "{{nom_medico}}" => $response[0]["nom_medico"],
        "{{accion2}}" => 'Se ha modificado con éxito',
        "{{especificacion_cambio}}" => 'El registro ha sido modificado por',
        "{{user_accion}}" => $response[0]['usuario'],
        "{{notas}}" => 'Notas: <b>' . $response[0]['notas'] . '</b>',
        "{{url}}" => "http://" . _URL_SERVIDOR ."/". _NAME ."/defa.php?url=/administrador/medico.php&args=?id=" . $idMedico
    );

    foreach ($variables as $key => $value) {
        $body = str_replace($key, $value, $body);
    }
    
    MailNotificaciones::sendMessage('Modificacion Medico', $body, $emails);
}

function sendMail_BajaMedico($idMedico)
{
    //FIXME Verificar Hardcode de la accion
    $SQL = "CALL ST_MAIL_MEDICO('$idMedico', 'Baja Medico')";
    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
        $response = MySQL_sendFunctionAudit("$SQL", "mailMedico", "1");
    }

    $emailsArray = $response[0]["emails"];
    $chunks = array_chunk(preg_split('/(-|,)/', $emailsArray), 2);
    $emails = array_combine(array_column($chunks, 1), array_column($chunks, 0));
    
    $body = file_get_contents('../mails/medico/emailMedico.php');
    $variables = array(
        "{{accion}}" => 'Inactivación de Medico',
        "{{nom_medico}}" => $response[0]["nom_medico"],
        "{{accion2}}" => 'Ha sido deshabilitado/a en el sistema',
        "{{especificacion_cambio}}" => 'El registro ha sido modificado por',
        "{{user_accion}}" => $response[0]['usuario'],
        "{{notas}}" => 'Notas: <b>' . $response[0]['notas'] . '</b>',
        "{{url}}" => "http://" . _URL_SERVIDOR ."/". _NAME ."/defa.php?url=/administrador/medico.php&args=?id=" . $idMedico
    );

    foreach ($variables as $key => $value) {
        $body = str_replace($key, $value, $body);
    }
    
    MailNotificaciones::sendMessage('Baja Medico', $body, $emails);
}

// Notificaciones Paciente

function sendMail_AltaPaciente()
{
}

function sendMail_ModificacionPaciente()
{
}

function sendMail_BajaPaciente()
{
}
