<?php

/*ini_set("display_errors", "1");
error_reporting(E_ALL);*/


require('../config/config.php');
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
include_once $_SERVER['DOCUMENT_ROOT'] . _SG;


?>
<!DOCTYPE html>
<html lang="es" xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Editor de Pacientes</title>
    <style type="text/css">
    
    /* Latest compiled and minified CSS */
    @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
    /* Bulma CSS */
    <?php
    // FIXME verificar harcode de estilo
    if($_SESSION["grupo"] !== 'atencion_paciente'){?>
        @import "../resources/CSS/bulma/css/bulma.css";
    <?php } ?>
    /* Font-Awesome */
    @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
    /* Include Bootstrap Datepicker */
    @import "../resources/Bootstrap-DatePicker/min/datepicker.min.css";
    /* Bootstrap Validator */
    @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
    /* Bootstrap-select */
    @import "../resources/Bootstrap-Select/css/bootstrap-select.min.css";
    /* Bootstrap-select-ajax */
    @import "../resources/Bootstrap-Select-Ajax/css/ajax-bootstrap-select.min.css";
    /* Custom CSS */
    @import "../resources/Sprites/file_extension.css";
    /* Iconos de Estados */
    @import "../resources/Sprites/TBL-icons.css";
    /* Iconos de Estados */
    @import "../resources/CSS/Develop/paciente.css";
    
    #editDocs:hover{
        color: #e35919;
    }
    li{
        list-style-type: none;
        height: 48px;
        vertical-align: top;
    }
    li:hover{
        color: #e35919;
    }
    .form-horizontal .selectContainer .form-control-feedback {
        top: 0;
        right: -15px;
    }
</style>


</head>
<body>
    
<?php
// vista form paciente//
include "../vistas/paciente/form_paciente.php";
////////////////////////
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/FormValidation.php";
include "../resources/Includes/DatePicker.php";
include "../resources/Includes/BootstrapSelect.php";
include "../resources/Includes/BootstrapSelectAjax.php";
?>
<!-- Custom JS -->
<script src="../resources/bulmajs/dist/tabs.js"></script>
<script type="text/javascript" src="../resources/JS/Develop/paciente.js"></script>
</body>
</html>
