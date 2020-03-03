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

    <title>Administrador de Reasignaciones</title>

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
        /* Iconos de Estados Listados */
            @import "../resources/Sprites/spriteListado.css";
        /* Custom CSS */
            @import "../resources/CSS/Develop/listado.css";
    </style>
</head>
<body >
<!--  Buscar Historial Ventas  -->
<!--    <div class="row" style="margin-bottom: 25px;margin-top: 25px;">-->
    <div class="row col-sm-12 col-xs-12">
    <!--  Header  -->
        <div class="col-sm-3 col-xs-2 text-left">
            <img src="../resources/IMG/barchart.png" style="margin-left:20px;width:42px;">
            <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">Historial de Ventas</samp>
        </div>
    </div>

      <div>
        <!--  DataTable Historial Ventas  -->
            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataReasignar" style="font-size: 13px">
                <thead>
                    <tr>
                        <th> id Venta</th>
                        <th> Paciente </th>
                        <th> Sexo </th>
                        <th> F. Nac (YYYY/MM/DD)</th>
                        <th> Edad </th>
                        <th> Patología </th>
                        <th> Estado </th>
                        <th> Documentación </th>
                        <th> Acciones </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!--  PopUP de Pacientes  -->
    <div id="win" class="easyui-window" style="height: 1000px; top: 50px;"  data-options="modal:true, closed:true, minimizable:false, title:'Ver Historial', closeOnEscape: true, maximized:true, inline:true">
        <iframe src="" id="win_list" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>

<?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";
?>

    <!-- Custom JS -->
       <script src="../resources/JS/Develop/adm_reasignar.js"></script>
       <!-- <script src="../resources/JS/adm_reasignar.min.js"></script> -->
<!--     ########################### -->
</body>
</html>
