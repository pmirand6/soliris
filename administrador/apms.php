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

    <title>APMs</title>

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
        @import "../resources/Sprites/spriteListado.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/apms.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
    </style>
</head>
<body>
    <section id="titulo">
        <div class="text-center">
        <h3>Listado de APMs</h3>

      </div>
  </section>
  <hr>    
  <div class="row col-sm-12 col-xs-12">
    <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
        <button type="button" title="Nuevo APM" id="newAPM" class="btn btn-xs btn-warning pointer text-right" style="margin-right: 10px;margin-bottom: 5px;"> Nuevo APM</button>
        <br>
        <!-- Text Input para reconstruir las Tablas -->
        <input type="hidden" name="url" id="url">
        <!--  DataTable APM  -->
        <br>
        <table class="table table-bordered" id="TBLAPM" style="width: 70%;margin: 0px 56px 0px 157px;">
            <thead>
                <tr>
                    <th > id </th>
                    <th > Nombre </th>
                    <th > Estado </th>
                    <th > Acciones </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<!--  PopUP de APM  -->
<div id="win" class="easyui-window" style="height: 1000px; top: 50px;"  data-options="modal:true, closed:true, minimizable:false, title:'APM', closeOnEscape: true, maximized:true, inline:true">
    <iframe src="" id="win_can" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
</div>
<?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/EasyUI.php";
include "../resources/Includes/FormValidation.php";
include "../resources/Includes/BootstrapCombobox.php";
include "../resources/Includes/DataTables.php";
?>
<!-- Custom JS -->
<script type="text/javascript" src="../resources/JS/Develop/apms.js"></script>
<!--       <script type="text/javascript" src="../resources/JS/apms.min.js"></script>-->

</body>
</html>
