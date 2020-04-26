<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;

$session_grupo = $_SESSION["grupo"];

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">
    

    <title>Panel soliris</title>
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
        @import "../resources/Sprites/spriteListado.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/panel.css";
    </style>

    <?php
    // FIXME ver seguridad en el panel
    if (strtoupper($_SESSION["grupo"]) == "fv" OR strtoupper($_SESSION["grupo"]) == "admin") { $var_grupo = 1; } else { $var_grupo = 1; }
    if (strtoupper($_SESSION["grupo"]) == "ventas" OR strtoupper($_SESSION["grupo"]) == "marketing") { $var_grupo = 2; }



    switch ($var_grupo) {
        case 1:
        $titulo = "Ventas con Notas de Pedido Pendientes";
        $estado = " (RM.estado IN ('Pendiente', 'FV', 'Postergado') OR RM.estado IS NULL)";
        $limite = "";
        $acc = "nu";
        break;
        case 2:
        $titulo = "Documentos Devueltos";
        $estado = " RM.estado IN ('Autorizado', 'Rechazado', 'Documentacion') ";
        $limite = "";
        $acc = "up";
        break;

        default:
        $titulo = "Documentos Pendientes Globales";
        $estado = " RM.estado IN ('Autorizado', 'Pendiente') ";
        $limite = " AND datediff(now(), RM.autoriza_fecha) < 30 ";
        $acc = "";
        break;
    }
    ?>
</head>
<body >
    <!--  Buscar Historial Ventas  -->
    <div class="row col-sm-12 col-xs-12 text-left">
        <h3>
            <img src="../resources/IMG/Home.png" style="margin-left:20px;width:32px;">
            <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">Panel soliris</samp>
        </h3>
    </div>
    <div class="col-sm-8 col-xs-8 text-left">
        <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;"><b><?php  echo $titulo; ?></b></samp>
    </div>

    <div class="row col-sm-12 col-xs-12 box1">

        <!--  Header  -->
        
        <!--  DataTable Ventas Pendientes de NP  -->
        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataDVP" style="font-size: 13px">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Sexo</th>
					<th>C. Gestar</th>
					<th>Edad</th>
					<th>Patología</th>
                    <th>Fecha Venta</th>
                    <th>Tipo de Venta</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>

    <div class="row col-sm-12 col-xs-12">&nbsp;</div>


<div class="row col-sm-12 col-xs-12">&nbsp;</div>

<div class="row col-sm-12 col-xs-12 box3">
    <div class="col-sm-8 col-xs-8 text-left">
        <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">
            <b>Pacientes Pendiente de Activarse [hasta 90 dias]</b>
        </samp>
    </div>
    <!--  DataTable Pacientes Pendiente de Activarse [hasta 90 dias]  -->
    <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataPPA" style="font-size: 13px">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Sexo</th>
                <th>F. Nac</th>
                <th>Patología</th>
                <th>Sub Patología</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<!--  PopUP de Pacientes  -->
<div id="win" class="easyui-window" style="height: 1000px; position: relative;"  data-options="modal:true, closed:true, minimizable:false, title:'Editar Institución', closeOnEscape: true, maximized:true, inline:true">
    <iframe src="" id="win_list" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
</div>

<?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/EasyUI.php";
include "../resources/Includes/DataTables.php";
?>

<!-- Custom JS -->

<script type="text/javascript" language="javascript" src="../resources/JS/Develop/panel.js"></script>
<script type="text/javascript">

    var grupo_usuario = "<?php echo $session_grupo;?>";
    var accion = "<?php echo $acc;?>"

    session_group(grupo_usuario, accion);
    

</script>

</body>
</html>

