<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Panel soliris</title>

    <style type="text/css">
        /* Bulma CSS */
        @import "../resources/CSS/bulma/css/bulma.css";
        /* Select2 CSS */
        @import "../resources/select2/dist/css/select2.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
        /* Style Datatable Bulma CSS */
        @import "../resources/datatables-bulma/css/dataTables.bulma.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/nueva_venta.css";
        /** Sweetalert2 */
        @import "../resources/sweetalert2/dist/sweetalert2.min.css";
    </style>

</head>

<body>


    <section class="hero is-primary" id="titulo">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Alta de Venta
                </h1>
                <h2 class="subtitle">
                    Por favor seleccione un paciente para realizar la venta
                </h2>
            </div>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <table class="table is-striped is-narrow is-hoverable is-fullwidth" id="DataTPacientes">
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
                        <th> Estado </th>
                        <th> Sub Estado </th>
                        <th> Última Venta</th>
                        <th>u_idVenta</th>
                        <th>u_venta_estado_id</th>
                        <th>u_venta_estado</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </section>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";
    include "../resources/Includes/datatables-bulma.php";
    include "../resources/Includes/sweetalert2.php";
    ?>

    <script type="text/javascript" language="javascript" src="../resources/JS/Develop/nueva_venta.js"></script>
</body>