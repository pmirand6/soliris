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

    <title>Vincular Reasignado</title>

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
            @import "../resources/CSS/Develop/reasignados.css";
    </style>
</head>
<body >
<!--  Buscar Pacientes  -->
    <div class="row col-sm-12 col-xs-12">
    <!--  Header  -->
        <div class="col-sm-6 col-xs-6 text-left">
            <img src="../resources/IMG/Copy.png" style="margin-left:20px;width:42px;">
            <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">Vincular Reasignado</samp>
        </div>
    </div>
    <div class="row col-sm-12 col-xs-12"><hr></div>
    <div class="row col-sm-12 col-xs-12">
    <!--  DataTable Pacientes  -->
        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataVentasREDO" style="font-size: 13px">
            <thead>
            <tr>
                <th> id </th>
                <th> Fecha de Venta </th>
                <th> Paciente </th>
                <th> Canal </th>
                <th> Acción </th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

<?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="../resources/JS/Develop/reasignados.js"></script>
        
<!--     ########################### -->
</body>
</html>
