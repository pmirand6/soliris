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

    <title>Listado de Pacientes</title>

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
        /* Iconos de Estados */
        @import "../resources/Sprites/spriteListado.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/pacientes.css";
    </style>
</head>

<body>

    <section id="titulo">
        <div class="text-center">
            <h3>Listado de Pacientes</h3>
            <hr>
            <br>
        </div>
    </section>
    <!--  Buscar Pacientes  -->
    <div class="row col-sm-12 col-xs-12">
        <!--  Header  -->
        <div class="col-sm-3 col-xs-2 text-left">
            <img src="../resources/IMG/Clients.png" style="margin-left:20px;width:42px;">
            <!--<samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">Listado de Pacientes</samp>-->

        </div>


        <!--  Busqueda por Iniciales  -->
        <div class="col-sm-9 col-xs-10 text-center" style="margin-bottom: 25px">
            <div class="col-sm-12 col-xs-12 text-center" style="margin-left: 7%;">
                <b class="pointer iniciales btn btn-xs btn-info" id="TODOS" style='margin-right: 5px'>TODOS</b>
                <?php
                for ($i = 65; $i <= 90; $i++) {
                    echo "<b class=\"pointer iniciales btn btn-xs 
                " . f_l_pac(chr($i)) . "\" id=\"" . chr($i) . "\" style=\"margin-right: 5px\">" . strtoupper(chr($i)) . "</b>";
                }
                ?>
            </div>
        </div>
        <div>
            <br>
            <p style="float: left;margin-left: 22px;"><strong>Seleccionar un paciente para ver el detalle</strong></p>
            <br>
        </div>

        <!--  Nuevo Paciente  -->
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">


        <!--FIXME Verificar harcode-->
        <?php if ($_SESSION["grupo"] == 'atencion_paciente') { ?><button type="button" title="Nuevo Paciente" id="nwPac" class="btn btn-warning fa fa-user-plus" data-grupo="<?= $_SESSION["grupo"] ?>"> Nuevo Paciente</button><?php } ?>
            <br>
            <!-- Text Input para reconstruir las Tablas -->
            <input type="hidden" name="url" id="url">
            <!--  DataTable Pacientes  -->
            <br>
            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataTPacientes">
                <thead>
                    <tr>
                        <th> id </th>
                        <th> Paciente </th>
                        <th> Sexo </th>
                        <th>Edad </th>
                        <th> F. Nac</th>
                        <th> Patología </th>
                        <th> Sub Patología </th>
                        <th> F. Cons</th>
                        <!--<th> E-Mail </th>-->
                        <!--<th> Tel </th>-->
                        <th> Notas </th>
                        <th> Estado </th>
                        <th> Sub Estado </th>
                        <th> Última Venta</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!--  PopUP de Pacientes  -->
    <div id="win" class="easyui-window" style="height: 1000px; top: 50px;" data-options="modal:true">
        <iframe src="" id="win_pac" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";


    function f_l_pac($value)
    {
        include $_SERVER['DOCUMENT_ROOT'] . _BD;
        $SQL = "SELECT count(id) as cant FROM paciente WHERE substring(apellido,1,1) = '$value';";
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
    <script type="text/javascript" src="../resources/JS/Develop/pacientes.js"></script>
    <!--   <script type="text/javascript" src="../resources/JS/pacientes.min.js"></script> -->
    <!--     ########################### -->
</body>

</html>