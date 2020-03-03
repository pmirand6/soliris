<?php

    require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Documentos del Paciente</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* File Upload */
        @import "../resources/JQuery-FileUpload/CSS/uploadfile.css";
        /* Custom CSS */
        #Docs{
        }
            #Docs:hover{
                color: #5cb811;
            }
    </style>

</head>
<body>
    

<?php
    include("../vistas/paciente/form_docs_paciente.php");
    include "../resources/Includes/BootstrapHTML5.php";
?>

    <!-- JQuery FileUpload-->
    <script type="text/javascript" src="../resources/JQuery-FileUpload/JS/jquery.uploadfile.min.js"></script>
    <!-- Custom JS -->
    <script type="text/javascript" src="../resources/JS/Develop/docs_paciente.js"></script>
</body>
</html>
