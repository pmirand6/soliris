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

    <title>Reporte por Filtros</title>

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
        @import "../resources/CSS/Develop/reporte_filtros.css";

        tfoot input {
            width: 100%;
            padding: 3px;
            box-sizing: border-box;
        }
        @page {
            size: A4 landscape;
        }
    </style>

</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset>
            <!-- Form Name -->
            <legend>Seleccione Periodo a Consultar</legend>

            <div class="row">
                <div class="col-sm-12 col-xs-12 text-center">
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
                                <input id="aoFin" name="aoFin" type="text" placeholder="DD-MM-YYYY" class="form-control input-md dateFil" autocomplete="off">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-sm-offset-6 col-sm-12 col-xs-12 text-center">
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
        <table class="table table-bordered table-responsive" id="DataFil">
            <thead>
                <tr>
                    <th>Registro</th>
                    <!--					<th>Estado</th>-->
                    <th>Paciente</th>
                    <th>Paciente (Abr)</th>
                    <th>Sexo</th>
                    <th>Fecha Nacimiento</th>
                    <th>Capacidad Gestar</th>
                    <th>Edad</th>
                    <th>Médico</th>
                    <th>Dosis</th>
                    <th>Unidades</th>
                    <th>Fecha Venta</th>
                    <th>Fecha Cons</th>
                    <th>Patología</th>
                    <th>Institución</th>
                    <th>Canal</th>
                    <th>APM</th>
                    <th>Centro de Atención</th>
                    <th>Tipo</th>

                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
                <tr>
                    <th>Registro</th>
                    <!--					<th>Estado</th>-->
                    <th>Paciente</th>
                    <th>Paciente (Abr)</th>
                    <th>Sexo</th>
                    <th>Fecha Nacimiento</th>
                    <th>Capacidad Gestar</th>
                    <th>Edad</th>
                    <th>Médico</th>
                    <th>Dosis</th>
                    <th>Unidades</th>
                    <th>Fecha Venta</th>
                    <th>Fecha Cons</th>
                    <th>Patología</th>
                    <th>Institución</th>
                    <th>Canal</th>
                    <th>APM</th>
                    <th>Centro de Atención</th>
                    <th>Tipo</th>
                </tr>
            </tfoot>
        </table>

        <div class="modal fade" id="filters" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content col-xs-12 col-sm-12">
                    <div class="modal-header row">
                        <div class="col-xs-12 col-sm-12">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Filtros</h4>
                        </div>
                    </div>
                    <div class="modal-body row">
                        <div class="col-xs-10 col-sm-10">
                            <table class="table table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <th style="vertical-align: top">Columna</th>
                                        <th style="vertical-align: top" colspan="2">Dato</th>
                                        <th style="vertical-align: top">Usar RegExp (<a href="http://msdn.microsoft.com/es-es/library/az24scfc(v=vs.110).aspx" target="_blank">?</a>)</th>
                                        <th style="vertical-align: top">Usar Filtro Inteligente</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="filter_global">
                                        <td>
                                            <b>Busqueda Global</b>
                                        </td>
                                        <td align="center" colspan="2">
                                            <div class="input-group">
                                                <div class="input-group-addon"><span class="fa fa-globe"></span></div>
                                                <input type="text" id="global_filter" class="global_filter form-control input-sm">
                                            </div>
                                        </td>
                                        <td align="center">
                                            <input type="checkbox" id="global_regex" class="global_filter checkbox checkbox-inline">
                                        </td>
                                        <td align="center">
                                            <input type="checkbox" id="global_smart" class="global_filter checkbox checkbox-inline" checked="checked">
                                        </td>
                                    </tr>
                                    <?php
                                    $arr_campos = array('Registro', 'Paciente', 'Sexo', 'Fecha de Nacimiento', 'Capacidad de Gestar', 'Edad', 'Médico','Unidades','Dosis', 'Fecha de Venta', 'Fecha de Consentimiento', 'Patologia', 'Institución', 'Canal', 'APM', 'Centro de Atención');
                                    $arr_icons = array('fa-hashtag', 'fa-user', 'fa-venus-mars', 'fa-calendar', 'fa-users', 'fa-birthday-cake', 'fa-user-md', 'fa-calendar', 'fa-calendar', 'fa-heartbeat', 'fa-hospital-o', 'fa-building', 'fa-male', 'fa-building-o');
                                    for ($i = 1; $i <= 15; $i++) {
                                        $a = $i-1;

                                        if (substr($arr_campos[$a], 0, 5) == 'Fecha'){
                                            $campo = "<input type=\"text\" id=\"col" . $a . "_filter\" class=\"dateFil column_filter form-control input-md\" size=\"30\">";
                                        }else{
                                            $campo = "<input type=\"text\" id=\"col" . $a . "_filter\" class=\"column_filter form-control input-md\" size=\"30\">";
                                        }


                                        echo "
                                        <tr id=\"filter_col$i\" data-column=\"$a\">
                                            <td>" . $arr_campos[$a] . "</td>
                                            <td align=\"center\" colspan=\"2\">
                                                <div class=\"input-group\">
                                                    <div class=\"input-group-addon\"><span class=\"fa " . $arr_icons[$a] . "\"></span></div>
                                                    $campo
                                                </div>
                                            </td>
                                            <td align=\"center\">
                                                <input type=\"checkbox\" id=\"col" . $a . "_regex\" class=\"column_filter checkbox checkbox-inline\">
                                            </td>
                                            <td align=\"center\">
                                                <input type=\"checkbox\" id=\"col" . $a . "_smart\" class=\"global_filter checkbox checkbox-inline\" checked=\"checked\">
                                            </td>
                                        </tr>";
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer row">
                        <div class="col-xs-12 col-sm-12">
                            <button type="button" class="btn btn-warning cleanFilters"><span class="fa fa-eraser"></span>Limpiar Filtros</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DataTables.php";
    include "../resources/Includes/DatePicker.php";
    ?>
    <!-- Custom JS -->
    <script src="../resources/JS/Develop/reporte_filtros.js"></script>
    <!--    <script src="../resources/JS/reporte_filtros.min.js"></script>-->
</body>
</html>
