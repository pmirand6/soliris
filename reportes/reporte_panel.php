<?php

require_once('../config/config.php');
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

    <title>Panel General</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Include Bootstrap Datepicker */
        @import "../resources/Bootstrap-DatePicker/css/datepicker.css";
        /* Bootstrap Validator */
        @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Custom CSS */
        @import "../resources/Sprites/file_extension.css";
        @import "../resources/CSS/Develop/reportes_panel.css";
    </style>
</head>

<body>
    <section>
        <div class="container">
            <h1 class="display-1 text-center" id="titulo-venta"></h1>
            <hr>
            <br>
            <p class="text-center"><b>Por favor seleccione una fecha</b></p>
            <br>
        </div>
    </section>
    <!-- form de seleccion de fecha para las consultas de los reportes -->
    <div class="container" style="text-align: center;">
        <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
            <fieldset>
                <div class="form-group col-sm-10 col-xs-10">
                    <label class="col-sm-4 col-xs-4 control-label" for="fecha">Fecha:</label>
                    <div class="col-sm-4 col-xs-4">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                            <input id="fecha" name="fecha" type="text" placeholder="YYYY-MM" class="form-control input-md date" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <button type="submit" id="buscar" name="buscar" class="btn btn-info">
                            <span class="fa fa-search"></span>
                            Buscar
                        </button>
                        <i id="loading" class="fa fa-spinner fa-pulse"></i>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>

    <!-- Seccion de graficos -->

    <section id="datos">
        <div class="col-sm-6 col-xs-6 text-center" style="margin-top: 15px;">
            <fieldset>
                <!-- Gráfico con tipos de reporte (RI, FU) -->
                <div id="graphTiposReporte" class="table-bordered" style="margin-bottom: 20px;"></div>
            </fieldset>
            <fieldset>
                <div id="graph2" class="table-bordered"></div>
            </fieldset>

        </div>
        <div class="col-sm-6 col-xs-6 text-center">
            <br>
            <fieldset style="margin-bottom: 21px;">
                <div id="graph3" class="table-bordered"></div>
            </fieldset>
            <fieldset>
                <div id="graph4" class="table-bordered"></div>
            </fieldset>
        </div>
        </div>
    </section>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DataTables.php";
    include "../resources/Includes/DatePicker.php";
    include "../resources/Includes/HighCharts.php";
    ?>
    <!-- Custom JS -->
    <script src="../resources/JS/Develop/reportes_panel.js"></script>
    <!--<script src="../resources/JS/reportes_panel.min.js"></script>
</body>
</html>