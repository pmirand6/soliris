<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Reporte de Ventas x Paciente</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Include Bootstrap Datepicker */
        @import "../resources/Bootstrap-DatePicker/css/datepicker.css";
        /* Bootstrap Validator */
        @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Custom CSS */
        @import "../resources/Sprites/file_extension.css";
        @import "../resources/CSS/Develop/reporte_docs_paciente.css";
    </style>
</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Seleccione Periodo a Consultar</legend>

            <div class="form-group col-sm-6 col-xs-6">
                <label class="col-sm-6 col-xs-6 control-label" for="aoIni">Año Inicial:</label>
                <div class="col-sm-6 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="aoIni" name="aoIni" type="text" placeholder="YYYY" class="form-control input-md date" autocomplete="off">
                    </div>
                </div>
            </div>

            <div class="form-group col-sm-6 col-xs-6">
                <label class="col-sm-6 col-xs-6 control-label" for="aoIni">Año Final:</label>
                <div class="col-sm-6 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="aoFin" name="aoFin" type="text" placeholder="YYYY" class="form-control input-md date" autocomplete="off">
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-12 col-xs-12 text-center">
                <div class="col-sm-12">
                    <button type="submit" id="buscar" name="buscar" class="btn btn-info">
                        <span class="fa fa-search"></span>
                        Buscar
                    </button>
                    <i id="loading" class="fa fa-spinner fa-pulse"></i>
                </div>
            </div>
        </fieldset>
    </form>
    <div class="row">
        <div class="col-sm-11 col-xs-11 text-left" style="margin-left: 10px">
            <table class="table table-bordered table-responsive" id="DataRVP">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Nro Ventas (Periodo)</th>
                        <th>Última Venta</th>
                        <th>Tarjeta</th>
                        <th>Consentimiento</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DataTables.php";
    include "../resources/Includes/DatePicker.php";
    ?>
    <!-- Custom JS -->
    <script src="../resources/JS/Develop/reporte_docs_paciente.js"></script>

</body>
</html>

<?php
function functRI($apm, $ao, $mes){
    require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    $SQLRI = "SELECT count(id) as CANT FROM soliris_maestro WHERE apm = '$apm' AND year(fecha_venta) = '$ao' AND month(fecha_venta) = '$mes' AND estado = 'NP' AND tipo = 'RI';";
    $responseRI = mysqli_query($db, $SQLRI);
    if ($responseRI){
        while ($rowRI = mysqli_fetch_assoc($responseRI)) {
            return $rowRI["CANT"];
        }
    } else {
        return false;
    }
    mysqli_close($db);
}
function functUP($apm, $ao, $mes){
    require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    $SQLFU = "SELECT count(id) as CANT FROM soliris_maestro WHERE apm = '$apm' AND year(fecha_venta) = '$ao' AND month(fecha_venta) = '$mes' AND estado = 'NP' AND tipo = 'FU';";
    $responseFU = mysqli_query($db, $SQLFU);
    if ($responseFU){
        while ($rowFU = mysqli_fetch_assoc($responseFU)) {
            return $rowFU["CANT"];
        }
    } else {
        return false;
    }
    mysqli_close($db);
}
?>
