<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Detalle de Ventas</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* EasyUI */
        @import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Iconos de Estados Listados */
        @import "../resources/Sprites/spriteListado.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/listado_details.css";
    </style>



</head>

<body>
    <div class="row col-sm-12 col-xs-12">
        <fieldset>
            <legend class="LabelDTB">Datos del Paciente</legend>
            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="PacDat" style="font-size: 13px">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Sexo</th>
                        <th>C.Ges</th>
                        <th>F.Nac (DD/MM/YYYY)</th>
                        <th>Edad</th>
                        <th>Patologia</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </fieldset>
        <hr>
        </fieldset>
        <hr>
        <fieldset class="form-horizontal col-sm-10 col-xs-10">
            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataDetailsHVentas" style="font-size: 13px">
                <thead>
                    <tr>
                        <th> ID </th>
                        <th> Médico </th>
                        <th> Edad </th>
                        <th> Presentacion </th>
                        <th> Unid </th>
                        <th title="(YYYY-MM-DD)"> F. Venta</th>
                        <th title="(YYYY-MM-DD)"> F. Receta</th>
                        <th> Canal </th>
                        <th> Institución </th>
                        <th> APM </th>
                        <th> Estado </th>
                        <th> Documentación </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </fieldset>
    </div>
    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/BootstrapCombobox.php";
    include "../resources/Includes/DataTables.php";
    ?>

    <!-- Custom JS -->
    <script src="../resources/JS/Develop/listado_details.js"></script>
    <script type="text/javascript" language="javascript" src="../resources/JS/Develop/datos_pac.js"></script>


</body>

</html>