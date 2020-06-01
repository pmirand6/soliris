<!DOCTYPE html>
<?php
require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* EasyUI */
        @import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/canales.css";
    </style>
</head>
<body>

<section id="titulo">
        <div class="text-center">
          <h3>Listado de Clientes Habilitados</h3>
          <hr>
          <br>
      </div>
  </section>
  
  <br>
    <div class="row col-sm-12 col-xs-12">
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
            <button type="button" title="Nuevo Cliente" id="newCliente" class="btn btn-xs btn-warning pointer fa fa-plus text-right" style="margin-right: 10px;margin-bottom: 5px;"> Agregar Cliente</button>
            <br>
            <!-- Text Input para reconstruir las Tablas -->
            <input type="hidden" name="url" id="url">
            <!--  DataTable Canales  -->
            <br>
            <div id="DataCanal"></div>
        </div>
    </div>

    <!--  PopUP de Medicos  -->
    <div id="win" class="easyui-window" style="height: 1000px; top: 50px;"  data-options="modal:true, closed:true, minimizable:false, title:'Editar Canal', closeOnEscape: true, maximized:true, inline:true">
        <iframe src="" id="win_can" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>

<?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="../resources/JS/Develop/clientes.js"></script>
      <!-- <script type="text/javascript" src="../resources/JS/canales.min.js"></script> -->
    
</body>
</html>