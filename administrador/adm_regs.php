<?php

require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Administrador de Registros</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Bootstrap Validator */
            @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";

        .form-horizontal .selectContainer .form-control-feedback {
            top: 0;
            right: 25px;
        }
    </style>

</head>
<body>
    <form class="col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form" id="form_reg">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <legend>Administrador de Registros</legend>

            <!-- Accion -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="accion">Acción</label>
                <div class="col-sm-4 col-xs-4 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-cog"></span></div>
                        <select id="accion" name="accion" class="form-control selectpicker">
                            <option value="registro">Registro</option>
                            <option value="documento">Documento</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- ID registro -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="idreg">ID del Registro</label>
                <div class="col-sm-3 col-xs-3">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                        <input id="idreg" name="idreg" type="text" placeholder="ID Registro..." class="form-control input-md" maxlength="15" required="">
                    </div>
                </div>
            </div>
            <!-- Motivo de Cambio -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="motivo">Motivo del Cambio</label>
                <div class="col-sm-4 col-xs-4">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-edit"></span></div>
                        <input id="motivo" name="motivo" type="text" placeholder="Motivo del Cambio..." class="form-control input-md" maxlength="200" required="">
                    </div>
                </div>
            </div>
            <hr>
            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-sm-12">
                    <button type="submit" id="buscar" name="buscar" class="btn btn-info disabled">
                        <span class="fa fa-search"></span>
                        Buscar
                    </button>
                </div>
            </div>
        </fieldset>
    </form>

    <div id="registro"></div>

<?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
?>

    <!-- Custom JS -->
        <script src="../resources/JS/Develop/adm_regs.js"></script>
<!--       <script type="text/javascript" src="../resources/JS/adm_regs.min.js"></script>-->

<!-- ################## -->
</body>
</html>
