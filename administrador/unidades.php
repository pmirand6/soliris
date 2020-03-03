<?php

require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Unidades</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* EasyUI */
        @import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/dosis.css";
    </style>


</head>
<body>
    <section id="titulo">
        <div class="text-center">
        <h3>Listado de Unidades Habilitadas</h3>
          <hr>
          <p style="float: left;margin-left: 22px;"><strong>Seleccionar presentacion para ver el detalle</strong></p>
          <br>
      </div>
  </section>
  <div class="row col-sm-12 col-xs-12">
    <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
        <button type="button" title="Nueva Unidad" id="newUnidades" class="btn btn-xs btn-warning pointer fa fa- text-right" style="margin-right: 10px;margin-bottom: 5px;"> Nueva Unidad</button>
        <!-- Text Input para reconstruir las Tablas -->
        <input type="hidden" name="url" id="url">
        <!--  DataTable Canales  -->
        <div id="DataUnidades"></div>
    </div>
</div>

<!--  PopUP de Medicos  -->
<div id="win" class="easyui-window" style="height: 1000px; top: 50px;"  data-options="modal:true, closed:true, minimizable:false, title:'Editar Unidades', closeOnEscape: true, maximized:true, inline:true">
    <iframe src="" id="win_dos" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
</div>

<?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/EasyUI.php";
include "../resources/Includes/DataTables.php";
?>

<!-- Custom JS -->
<script type="text/javascript" src="../resources/JS/Develop/unidades.js"></script>
<!-- <script type="text/javascript" src="../resources/JS/unidades.min.js"></script> -->
</body>
</html>
