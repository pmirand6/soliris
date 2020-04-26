<?php
    
require_once('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Reporte ANMAT</title>

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
        /* Custom CSS */
            @import "../resources/CSS/Develop/reporte_ANMAT.css";
    </style>
</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Elija un periodo para generar el reporte de ANMAT</legend>

            <div class="form-group col-sm-6 col-xs-6">
                <label class="col-sm-4 col-xs-4 control-label" for="aoIni">Fecha Inicial:</label>
                <div class="col-sm-8 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="aoIni" name="aoIni" type="text" placeholder="DD-MM-YYYY" class="form-control input-md date" autocomplete="off">
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-6 col-xs-6">
                <label class="col-sm-4 col-xs-4 control-label" for="aoIni">Fecha Final:</label>
                <div class="col-sm-8 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="aoFin" name="aoFin" type="text" placeholder="DD-MM-YYYY" class="form-control input-md date" autocomplete="off">
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-12 col-xs-12 text-center">
                <div class="col-sm-12">
                    <button type="submit" id="buscar" name="buscar" class="btn btn-success">
                        <span class="fa fa-save"></span>
                        Generar
                    </button>
                    <i id="loading" class="fa fa-spinner fa-pulse"></i>
                </div>
            </div>
        </fieldset>
    </form>
    <iframe id="rep" style="height: 0px;width: 0px;" marginheight="0" marginwidth="0" noresize frameborder="0"></iframe>
<?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DatePicker.php";
?>

<!-- Custom JS -->
    <script src="../resources/JS/Develop/reporte_ANMAT.js"></script>
<!--    <script src="../resources/JS/reporte_ANMAT.min.js"></script>-->
</body>
</html>


