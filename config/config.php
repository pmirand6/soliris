<?php 

// DEFINICION DE CONSTANTES

$nombreApp = explode(DIRECTORY_SEPARATOR, __DIR__);

define("_NAME", $nombreApp[3]);
define("_NAME_NP", 'nota_pedido');
define("_BD", "/"  . _NAME . "/base.php");
define("_FN", "/"  . _NAME . "/resources/PHP/funciones.php");
define("_SG", "/"  . _NAME . "/resources/PHP/accesos_seguridad.php");
define("_MAIL","/"  . _NAME . "/helpers/mailFunciones.php");
define("HTTP", 'http://' . $_SERVER['HTTP_HOST'] . '/' . _NAME);
define("_RESOURCES", _NAME . '/resources/');
define("_ADMIN_MAIL", 'pmiranda@raffo.com.ar');
define("_DOC_VENTAS", HTTP . '/documentacion/venta/');
define("_URL_SERVIDOR", $_SERVER['SERVER_NAME']);
define("_USUARIO_BD", 'admin');
define("_PASSWORD_BD", '');
define("_TABLA_BD", 'soliris');

