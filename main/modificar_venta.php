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
    </style>

</head>

<body>

<?php var_dump($_GET); ?>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";
    include "../resources/Includes/datatables-bulma.php";
    ?>

</body>