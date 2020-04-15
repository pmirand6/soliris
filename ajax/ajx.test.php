<?php

require '../clases/MailNotificaciones.php';


MailNotificaciones::sendMessage('mail prueba', 'este es el body', ['pmiranda@raffo.com.ar' => 'Pablo Miranda']);

