<?php

require_once('../config/config.php');
include_once $_SERVER['DOCUMENT_ROOT'] . _SG;

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Historial de Ventas</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.css";
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

<body>
    <!--  Buscar Historial Ventas  -->
    <!--    <div class="row" style="margin-bottom: 25px;margin-top: 25px;">-->
    <br>

    <br>
    <div class="container">
        <h1>Historial de Ventas</h1>
    </div>
    <div class="container">
        <!--  DataTable Historial Ventas  -->
        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataHVentas" style="font-size: 13px; margin-left: 6px;">
            <thead>
                <tr>
                    <th> Paciente </th>
                    <th> Sexo </th>
                    <th title="(DD/MM/YYYY)"> F. Nac </th>
                    <th> Edad </th>
                    <th> Patología </th>
                    <th> Estado </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

    </div>

    <!--  PopUP de Pacientes  -->
    <div id="win" class="easyui-window" style="height: 1000px; top: 50px;" data-options="modal:true, closed:true, minimizable:false, title:'Ver Historial', closeOnEscape: true, maximized:true, inline:true">
        <iframe src="" id="win_list" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";


    function f_l_pac($value)
    {
        require_once('../config/config.php');
        include $_SERVER['DOCUMENT_ROOT'] . _BD;

        $SQL = "SELECT COUNT(mv.id) AS cant
    FROM maestro_ventas AS mv
    INNER JOIN paciente AS p ON p.id= mv.paciente_id
    WHERE SUBSTRING(p.apellido,1,1) = '$value';";

        $result = mysqli_query($db, $SQL);

        while ($reg = mysqli_fetch_assoc($result)) {
            if ($reg["cant"] == 0) {
                return "btn-unselected";
            } else {
                return "btn-primary";
            }
        };
    }




    ?>

    <!-- Custom JS -->
    <script src="../resources/JS/Develop/listado.js"></script>
    <!--       <script src="../resources/JS/listado.min.js"></script>-->
    <!--     ########################### -->
</body>

</html>