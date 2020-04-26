<?php

require '../clases/MailNotificaciones.php';

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

// Notificaciones Medico

function sendMail_AltaMedico($idMedico, $usuarioCreador)
{
    $body = '<html>' .
        ' <body>' .
        '  Se ha dado de alta el Médico con ID: ' . $idMedico . '"' .
        '  Por el usuario: ' .
        '' . strtoupper($usuarioCreador) .'' .
        ' </body>' .
        '</html>';
    $asunto = 'Alta de Médico Soliris';
    MailNotificaciones::sendMessage($asunto, $body, ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
}

function sendMail_ModificacionMedico()
{
    MailNotificaciones::sendMessage('mail prueba', 'este es el body', ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
}

function sendMail_BajaMedico()
{
    MailNotificaciones::sendMessage('mail prueba', 'este es el body', ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);
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
