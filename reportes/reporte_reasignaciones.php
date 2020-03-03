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

    <title>Reporte de Reasignaciones</title>

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
        @import "../resources/CSS/Develop/reporte_reasignaciones.css";
    </style>
</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset>
            <!-- Form Name -->
            <legend>Seleccione Periodo a Consultar</legend>

            <div class="form-group col-sm-10 col-xs-10">
                <label class="col-sm-4 col-xs-4 control-label text-left" for="fecha">Fecha (Inicio / Fin):</label>
                <div class="col-sm-6 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="fecha" name="fecha" type="text" placeholder="YYYY-MM-DD / YYYY-MM-DD" class="form-control input-md date" autocomplete="off">
                    </div>
                </div>
                <div class="col-sm-2 col-xs-2">
                    <button type="submit" id="buscar" name="buscar" class="btn btn-info">
                        <span class="fa fa-search"></span>
                        Buscar
                    </button>
                    <i id="loading" class="fa fa-spinner fa-pulse"></i>
                </div>
            </div>
        </fieldset>
    </form>

    <div class="row col-sm-12 col-xs-12 text-center">
        <table class="table table-bordered table-responsive" id="DataReasig">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Nota</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>


    </div>
    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DataTables.php";
    include "../resources/Includes/DatePicker.php";
    ?>
    <!-- Custom JS -->
    <script src="../resources/JS/Develop/reporte_reasignaciones.js"></script>
    <!-- <script src="../resources/JS/reporte_reasignaciones.min.js"></script> -->
</body>
</html>
