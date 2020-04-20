<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<!DOCTYPE html>
<html>

<head>
	<title>Reporte 360</title>

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<style>
		/* Latest compiled and minified CSS */
		@import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
		/* Optional theme */
		@import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
		/* Font-Awesome */
		@import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
		/* EasyUI */
		@import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
		
		/* Iconos de Estados Listados */
		@import "../resources/Sprites/spriteListado.css";
	</style>

	<link rel="stylesheet" type="text/css" href="../resources/devextreme/dist/css/dx.common.css" />
	<link rel="stylesheet" type="text/css" href="../resources/devextreme/dist/css/dx.light.css" />
	<link rel="stylesheet" type="text/css" href="css/index.css" />

	<?php

	include "../resources/Includes/BootstrapHTML5.php";
	?>
	<script src="../resources/JS/funciones.min.js"></script>
	<script src="../resources/jszip/dist/jszip.min.js"></script>
	<script type="text/javascript" src="../resources/devextreme/dist/js/dx.all.js"></script>
	<script type="text/javascript" src="../resources/devextreme-aspnet-data/js/dx.aspnet.data.js"></script>
	<script type="text/javascript" src="js/index.js"></script>

</head>

<body>
	<div class="container">
		<div id="pivotgrid-chart" style="display: none"></div>
		<div id="pivotgrid"></div>
	</div>
</body>

</html>