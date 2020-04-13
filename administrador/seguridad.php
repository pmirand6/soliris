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

    <title>Seguridad</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Bootstrap Validator */
        @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/seguridad.css";
    </style>
</head>

<body>
    <div class="row col-sm-12 col-xs-12">
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
            <button type="button" title="Nueva Pagina" id="newSeg" class="btn btn-xs btn-warning pointer fa fa- text-right" style="margin-right: 10px;margin-bottom: 5px;"> Nueva Pagina</button>
            <!-- Text Input para reconstruir las Tablas -->
            <input type="hidden" name="url" id="url">
            <!--  DataTable Seguridad  -->
            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="TBLUsr" style="font-size: 13px">
                <thead>
                    <tr>
                        <th> id </th>
                        <th> Pagina </th>
                        <th> Descripción </th>
                        <th> ADMIN </th>
                        <th> FV </th>
                        <th> Marketing </th>
                        <th> Ventas </th>
                        <th> Auditor </th>
                        <th> APM </th>
                        <th> Acción </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!--  Modal -->
    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="Modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="ModalLabel"></h4>
                </div>
                <div class="modal-body col-sm-11 col-xs-11">
                    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
                        <!-- Página -->
                        <div class="form-group">
                            <label class="col-sm-4 col-xs-4 control-label" for="pagina">Página</label>
                            <div class="col-sm-8 col-xs-8">
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="fa fa-navicon"></span></div>
                                    <input id="pagina" name="pagina" type="text" autocomplete="off" placeholder="Página..." class="form-control input-md" maxlength="90" required="">
                                </div>
                            </div>
                        </div>
                        <!-- Descripción -->
                        <div class="form-group">
                            <label class="col-sm-4 col-xs-4 control-label" for="descripcion">Descripción</label>
                            <div class="col-sm-8 col-xs-8">
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="fa fa-desktop"></span></div>
                                    <input id="descripcion" name="descripcion" type="text" autocomplete="off" placeholder="Descripción..." class="form-control input-md" maxlength="255">
                                </div>
                            </div>
                        </div>

                        <!-- Button (Double) -->
                        <div class="form-group text-center">
                            <div class="col-sm-12">
                                <button type="submit" id="bot_guardar" name="guardar" class="btn btn-success disabled">
                                    <span class="fa fa-save"></span>
                                    Guardar
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>


    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DataTables.php";
    ?>
    <!-- Custom JS -->
    <script type="text/javascript" src="../resources/JS/Develop/seguridad.js"></script>
    <!--        <script type="text/javascript" src="../resources/JS/seguridad.min.js"></script>-->

    <!-- ################## -->

</body>

</html>