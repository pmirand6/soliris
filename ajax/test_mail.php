<?php

require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _MAIL;


sendMail('pmiranda@raffo.com.ar', 'mail prueba', 'mail prueba');


?>