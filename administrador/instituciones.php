<?php 

require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Instituciones</title>

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
        @import "../resources/CSS/Develop/instituciones.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
    </style>



</head>
<body>
    <section id="titulo">
        <div class="text-center">
        <h3>Listado de Instituciones</h3>

        </div>
    </section>
    <hr>
    <div>
        <br>
        <p style="float: left;margin-left: 22px;"><strong>Seleccionar una institución para ver el detalle</strong></p>
        <br>
    </div>

    <div class="row col-sm-12 col-xs-12">
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
            <button type="button" title="Nueva Institución" id="newInst" class="btn btn-xs btn-warning pointer fa fa- text-right" style="margin-right: 10px;margin-bottom: 5px;"> Nueva Institución</button>
            <br>
            <!-- Text Input para reconstruir las Tablas -->
            <input type="hidden" name="url" id="url">
            <!--  DataTable Instituciones  -->
            <div id="DataInst"></div>
            <br>
            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataInstitucion" style="font-size: 13px">
                <thead>
                    <tr>
                        <th> id </th>
                        <th> Nombre </th>
                        <th> Dirección </th>
                        <th> Altura </th>
                        <th> Localidad </th>
                        <th> Provincia </th>
                        <th> Tipo </th>
                        <th> Estado </th>
                        <th> Familia </th>
                        <th> Acciones </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!--  PopUP de Medicos  -->
    <div id="win" class="easyui-window" style="height: 1000px; top: 50px;"  data-options="modal:true, closed:true, minimizable:false, title:'Editar Institución', closeOnEscape: true, maximized:true, inline:true">
        <iframe src="" id="win_inst" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/BootstrapCombobox.php";
    include "../resources/Includes/DataTables.php";
    ?>

    <!-- Custom JS -->
    <script type="text/javascript" src="../resources/JS/Develop/instituciones.js"></script>
    <!--<script type="text/javascript" src="../resources/JS/instituciones.min.js"></script>-->

</body>
</html>