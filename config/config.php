<?php 

// DEFINICION DE CONSTANTES

$nombreApp = explode(DIRECTORY_SEPARATOR, __DIR__);

define("_NAME", $nombreApp[3]);
define("_NAME_NP", 'nota_pedido');
define("_BD", "/"  . _NAME . "/base.php");
define("_FN", "/"  . _NAME . "/resources/PHP/funciones.php");
define("_SG", "/"  . _NAME . "/resources/PHP/accesos_seguridad.php");
define("_MAIL","/"  . _NAME . "/resources/PHP/fn_mails.php");
define("HTTP", 'https://' . $_SERVER['HTTP_HOST'] . '/' . _NAME);

