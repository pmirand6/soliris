<?php

include './config/config.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Navegador</title>
    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* EasyUI */
        @import "resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
        @import "resources/JQuery-EasyUI-1.4.2/themes/bootstrap/accordion.css";
        /*@import "resources/JQuery-EasyUI-1.4.2/locale/easyui-lang-es.js";*/
    </style>
    <?php
    # Si bajo los INCLUDES se duplican las flechas del accordion
    include "resources/Includes/BootstrapHTML5.php";
    include "resources/Includes/EasyUI.php";
    ?>
</head>

<body>
    <div class="easyui-accordion" style="height: auto;">
        <div title="Gestión" style="overflow:auto;padding:10px;">
            <p class="nav_item" onclick="pop('main/panel.php')"><span class="margin-right fa fa-home"></span>Principal</p>
            <p class="nav_item" onclick="pop('main/nueva_venta.php')"><span class="margin-right fa fa-cart-plus"></span>Alta de Venta</p>
            <p class="nav_item" onclick="pop('main/listado.php')"><span class="margin-right fa fa-shopping-cart"></span>Historial de Ventas</p>
            <!--        <p class="nav_item" onclick="pop('administrador/reasignar.php')"><span class="margin-right fa fa-history"></span>Ventas a Reasignar</p>-->
            <!--        <p class="nav_item" onclick="pop('administrador/reasignados.php')"><span class="margin-right fa fa-share"></span>Vincular Reasignados</p>-->
        </div>
        <div title="Reportes" style="overflow: auto; padding: 10px;">
            <p class="nav_item" onclick="pop('reportes/reporte_panel.php')"><span class="margin-right fa fa-gears"></span>Panel General</p>
            <p class="nav_item" onclick="pop('reportes/log.php')"><span class="margin-right fa fa-history"></span>Log Registros</p>
            <p class="nav_item" onclick="pop('reportes/reporte_filtros.php')"><span class="margin-right fa fa-briefcase"></span>Reporte Filtros</p>
            <p class="nav_item" onclick="pop('reportes/reporte_360.php')"><span class="margin-right fa fa-briefcase"></span>Reporte 360</p>
            <p class="nav_item" onclick="pop('reportes/reporte_grilla.php')"><span class="margin-right fa fa-briefcase"></span>Reporte Patologías Convenio</p>
            <p class="nav_item" onclick="pop('reportes/reporte_ventas_convenios.php')"><span class="margin-right fa fa-briefcase"></span>Por Convenios</p>
            <p class="nav_item" onclick="pop('reportes/reporte_ANMAT.php')"><span class="margin-right fa fa-bar-chart"></span>Reporte Semestral</p>
            <p class="nav_item" onclick="pop('reportes/reporte_productos.php')"><span class="margin-right fa fa-bar-chart"></span></span>Reporte Productos</p>
            <!--        <p class="nav_item" onclick="pop('reportes/reporte_reasignaciones.php')"><span class="margin-right fa fa-bar-chart"></span></span>Reporte Reasignaciones</p>-->
            <p class="nav_item" onclick="pop('reportes/reporte_ventas.php')"><span class="margin-right fa fa-bar-chart"></span>Reporte de Ventas</p>
            <p class="nav_item" onclick="pop('reportes/reporte_docs_paciente.php')"><span class="margin-right fa fa-bar-chart"></span>Reporte de Ventas (Documentación)</p>
            <p class="nav_item" onclick="pop('reportes/reporte_ventas_apm.php')"><span class="margin-right fa fa-line-chart"></span>Reporte de Ventas x APM</p>
        </div>
        <div title="Administración" style="overflow: auto; padding: 10px;">
            <p class="nav_item" onclick="pop('administrador/pacientes.php')"><span class="margin-right fa fa-hotel"></span>Pacientes</p>
            <p class="nav_item" onclick="pop('administrador/medicos.php')"><span class="margin-right fa fa-user-md"></span>Medicos</p>
            <p class="nav_item" onclick="pop('administrador/apms.php')"><span class="margin-right fa fa-user-secret"></span>APM</p>
            <p class="nav_item" onclick="pop('administrador/instituciones.php')"><span class="margin-right fa fa-institution"></span>Institución</p>
            <p class="nav_item" onclick="pop('administrador/canales.php')"><span class="margin-right fa fa-hospital-o"></span>Canal</p>
            <p class="nav_item" onclick="pop('administrador/dosis.php')"><span class="margin-right fa fa-medkit"></span>Presentaciones</p>
            <p class="nav_item" onclick="pop('administrador/unidades.php')"><span class="margin-right fa fa-medkit"></span>Unidades</p>
            <p class="nav_item" onclick="pop('administrador/especialidades.php')"><span class="margin-right fa fa-stethoscope"></span>Especialidad</p>
            <p class="nav_item" onclick="pop('administrador/patologias.php')"><span class="margin-right fa fa-heartbeat"></span>Patología</p>
            <p class="nav_item" onclick="pop('administrador/usuarios.php')"><span class="margin-right fa fa-users"></span>Usuarios</p>
            <p class="nav_item" onclick="pop('administrador/adm_regs.php')"><span class="margin-right fa fa-sliders"></span>Admin. Registros</p>
            <p class="nav_item" onclick="pop('administrador/seguridad.php')"><span class="margin-right fa fa-lock"></span>Seguridad</p>
        </div>
        <div title="Ayuda" style="overflow: auto; padding: 10px;">
            <p class="nav_item" onclick="pop('bpm/default.htm')"><span class="margin-right fa fa-question-circle"></span>Ayuda</p>
            <p class="nav_item" data-toggle="modal" data-target="#modal_version""><span class=" margin-right fa fa-info-circle"></span>Version</p>
            <iframe src="" class="nav_item"></iframe>
        </div>
    </div>

    <div id="modal_version" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Versión del Sistema</h4>
                </div>
                <div class="modal-body">
                    <div style="text-align: center;">
                        <h1>soliris</h1>
                        <h3>Versión 2.0.0</h3>
                        <br>
                        <h5 style="color: red;">Aplicaciones Raffo</h5>
                        <br>
                        <br>
                        <button style="text-align: center" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

</body>

</html>