<?php

require_once('../config/config.php');

include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Reporte de Ventas x Paciente</title>

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
        @import "../resources/CSS/Develop/reporte_ventas.css";
    </style>

</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Elija un periodo para generar el reporte</legend>

            <div class="form-group col-sm-6 col-xs-6">
                <label class="col-sm-4 col-xs-4 control-label" for="aoIni">Fecha Inicial:</label>
                <div class="col-sm-8 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="aoIni" name="aoIni" type="text" placeholder="YYYY-MM-DD" class="form-control input-md date" autocomplete="off">
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-6 col-xs-6">
                <label class="col-sm-4 col-xs-4 control-label" for="aoIni">Fecha Final:</label>
                <div class="col-sm-8 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="aoFin" name="aoFin" type="text" placeholder="YYYY-MM-DD" class="form-control input-md date" autocomplete="off">
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-12 col-xs-12 text-center">
                <div class="row">
                    <div class="col-sm-12 col-xs-12">
                        <button type="submit" id="buscar" name="buscar" class="btn btn-info">
                            <span class="fa fa-search"></span>
                            Buscar
                        </button>

                        <button id="limpiar" name="limpiar" class="btn btn-sm btn-warning">
                            <span class="fa fa-eraser"></span>
                            Limpiar
                        </button>

                        <i id="loading" class="fa fa-spinner fa-pulse"></i>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
    <div class="row">
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
            <table class="table table-bordered table-responsive rows" id="DataRV">
                <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Dosis 1 MG</th>
                        <th>Dosis 2 MG</th>
                        <th>Dosis 3 MG</th>
                        <th>Dosis 4 MG</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <hr>

    <div class="col-sm-12 col-xs-12" id="graphs"></div>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DataTables.php";
    include "../resources/Includes/DatePicker.php";
    ?>

    <!-- Custom JS -->
    <script src="../resources/JS/Develop/reporte_ventas.js"></script>
    <!--    <script src="../resources/JS/reporte_ventas.min.js"></script>-->
</body>
</html>
