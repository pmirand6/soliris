<?php

require_once('../config/config.php');
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
include_once $_SERVER['DOCUMENT_ROOT'] . _SG;

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Reporte de distribución por institución/patologia</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/reporte_grilla.css";
    </style>

</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <div class="col-sm-12 col-xs-12 text-center">
                <?php
                $query = "SELECT year(fecha_venta) as anios FROM maestro_ventas GROUP BY year(fecha_venta);";
                free_all_results($db);
                $result = mysqli_query($db, $query);

                $string = "";
                while ($row = mysqli_fetch_assoc($result)) {
                    $string = "<b class=\"pointer iniciales btn btn-xs btn-info\" id=\"" . $row["anios"] . "\" style=\"margin-right: 5px\">" . $row["anios"] . "</b>";
                }

                if (empty($string)){
                    echo "El sistema no tiene ventas registradas por convenios.";
                } else {
                    echo $string;
                }
                ?>
            </div>

        </fieldset>
    </form>
    <div class="row col-sm-12 col-xs-12 text-center margin">
        <div class="col-sm-12 col-xs-12 text-center">
            <i id="loading" class="fa fa-spinner fa-pulse"></i>
        </div>
        <div class="margin col-sm-offset-1 col-xs-offset-1 col-sm-11 col-xs-11" id="tablas"></div>
    </div>


    <?php
        
        include "../resources/Includes/BootstrapHTML5.php"
    ?>

    <!-- Custom JS -->
    <script src="../resources/JS/Develop/reporte_grilla.js"></script>
    <!--    <script src="../resources/JS/reporte_grilla.min.js"></script>-->
</body>
</html>


