<?php
//require($_SERVER['DOCUMENT_ROOT'] . '/soliris_pq/config/config.php');
require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Listado de Médicos</title>

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
    /* Iconos de Estados */
    @import "../resources/Sprites/TBL-icons.css";
    /* Custom CSS */
    @import "../resources/CSS/Develop/medicos.css";
</style>
</head>
<body >
    <section id="titulo">
        <div class="text-center">
            <h3>Listado de Medicos</h3>
            <hr>
            <br>
        </div>
    </section>
    <br>

    <!--  Buscar Medicos  -->
    <div class="row col-sm-12 col-xs-12">
        <!--  Header  -->
        <div class="col-sm-3 col-xs-2 text-left">
            <img src="../resources/IMG/Preppy.png" style="margin-left:20px;width:42px;">
        </div>
        <br>
        <!--  Busqueda por Iniciales  -->
        <div class="col-sm-9 col-xs-10 text-center" style="margin-bottom: 25px">
            <div class="col-sm-12 col-xs-12 text-center">
                <b class="pointer iniciales btn btn-xs btn-info" id="TODOS" style='margin-right: 5px'>TODOS</b>
                <?php
                for ($i=65;$i<=90;$i++) {
                    echo "<b class=\"pointer iniciales btn btn-xs btn-info\" id=\"" . chr($i) . "\" style=\"margin-right: 5px\">" . strtoupper(chr($i)) . "</b>";
                }
                ?>
            </div>
        </div>
        <div>
            <br>
            <p style="float: left;margin-left: 22px;"><strong>Seleccionar un médico para ver el detalle</strong></p>
            <br>
        </div>
        <!--  Nuevo Medico  -->
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
            <button type="button" title="Nuevo Medico" id="nwMed" class="btn btn-xs btn-warning pointer fa fa-user-plus text-right" style="margin-right: 10px;margin-bottom: 5px;"> Nuevo Médico</button>
            <br>
            <!-- Text Input para reconstruir las Tablas -->
            <input type="hidden" name="url" id="url">
            <!--  DataTable Pacientes  -->
            <br>    
            <div class="container" style="margin-left: 1%;">
                <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataTMedicos" style="font-size: 10px;width: 100% !important;">
                    <thead>
                        <tr>
                            <th> id </th>
                            <th> Médico </th>
                            <th> Matrícula </th>
                            <th> Especialidad </th>
                            <th> C Atención </th>
                            <th> Tel / Fax </th>
                            <th> E-mail </th>
                            <th> Estado </th>
                            <th> Fec. Cap (DD/MM/YYYY) </th>
                            <th> APM </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!--  PopUP de Medicos  -->
    <div id="win" class="easyui-window" style="height: 1000px; top: 50px;"  data-options="modal:true, closed:true, minimizable:false, title:'Editar Información', closeOnEscape: true, maximized:true, inline:true">
        <iframe src="" id="win_med" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";
    ?>

    <!-- Custom JS -->
    <script type="text/javascript" src="../resources/JS/Develop/medicos.js"></script>
    <!--    <script type="text/javascript" src="../resources/JS/medicos.min.js"></script>-->
    <!--###################-->
</body>
</html>
