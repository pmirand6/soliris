<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Documentos del Paciente</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Include Bootstrap Datepicker */
        @import "../resources/Bootstrap-DatePicker/css/datepicker.css";
        /* File Upload */
        @import "../resources/JQuery-FileUpload/CSS/uploadfile.css";
        /** Form Validation */
        @import "../resources/formvalidation/dist/css/formValidation.min.css";
        /* Custom CSS */

        #Docs:hover {
            color: #5cb811;
        }
    </style>




</head>

<body>
    <?php
    if (isset($_GET["id"]) and !empty($_GET["id"])) {
        $id = $_GET["id"];
    ?>
        <form id="frmDocsMedico" class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form" method="post" enctype="multipart/form-data" autocomplete="off">
            <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
                <!-- Form Name -->
                <legend>
                    <?php
                    if (isset($_GET["id"]) and !empty($_GET["id"])) {
                    ?>
                        <i id="Docs" class="fa fa-step-backward btn btn-xs btn-default" title="Volver" style="cursor:pointer;margin-right: 50pxs;"></i>
                    <?php
                    }
                    ?>
                    Documentos del Médico
                </legend>

                <!-- ID -->
                <div class="form-group">
                    <label class="col-sm-4 col-xs-4 control-label" for="vw_id">ID</label>
                    <div class="col-sm-3 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                            <input id="vw_id" name="vw_id" type="text" placeholder="ID" class="form-control input-md disabled" disabled value="<?php echo $id ?>">
                            <input id="id" name="id" type="hidden" class="form-control input-md hidden" value="<?php echo $id ?>">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 col-xs-4 control-label" for="fecha">Fecha de Capacitación</label>
                    <div class="col-sm-4 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                            <input id="fecha" name="fecha" type="text" placeholder="Fecha de Capacitación..." class="form-control input-md date" maxlength="12">
                        </div>
                    </div>
                </div>
                <!-- File Capacitacion -->
                <div class="form-group" id="doc_cap">
                    <label class="col-sm-4 col-xs-4 control-label" for="Capacitacion">Capacitación</label>
                    <div class="col-sm-4 col-xs-6">
                        <div id="Capacitacion" name="file_capacitacion">Subir</div>
                    </div>
                </div>

                <?php
                if (isset($_GET["id"]) and !empty($_GET["id"])) {
                ?>

                    <!-- Button (Double) -->
                    <div class="form-group text-center">
                        <div class="col-sm-12">
                            <button type="submit" id="bot_guardar" name="bot_guardar" class="btn btn-success">
                                <span class="fa fa-save"></span>
                                Guardar
                            </button>
                        </div>
                    </div>
                <?php
                }
                ?>
            </fieldset>
        </form>
    <?php
    } else {
        echo "No seleccionó un médico al cuál adjuntar documentación.";
    }
    ?>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DatePicker.php";
    
    ?>

    <!-- JQuery FileUpload-->
    <script type="text/javascript" src="../resources/JQuery-FileUpload/JS/jquery.uploadfile.min.js"></script>

    <!-- Custom JS -->
    <script type="text/javascript" src="../resources/JS/Develop/docs_medico.js"></script>
    <!-- <script type="text/javascript" src="../resources/JS/docs_medico.min.js"></script>-->

</body>

</html>