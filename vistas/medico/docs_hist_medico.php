<?php

require('../../config/config.php');
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

    <title>Historial de Documentación Medico</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Custom CSS */
        @import "../../resources/Sprites/file_extension.css";


        #Docs:hover {
            color: #5cb811;
        }

        .TBLrows {
            -webkit-transition: all 400ms ease-in-out;
            -moz-transition: all 400ms ease-in-out;
            -ms-transition: all 400ms ease-in-out;
            -o-transition: all 400ms ease-in-out;
            transition: all 400ms ease-in-out;
        }

        .TBLrows:hover {
            background-color: #0081C2;
            color: white;
            -webkit-transition: all 400ms ease-in-out;
            -moz-transition: all 400ms ease-in-out;
            -ms-transition: all 400ms ease-in-out;
            -o-transition: all 400ms ease-in-out;
            transition: all 400ms ease-in-out;
        }
    </style>



</head>

<body>
    <div>
        <i id="Docs" class="fa fa-step-backward btn btn-xs btn-default" title="Volver" style="cursor:pointer;margin-left: 10%;margin-top: 2%;"></i>
    </div>
    <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
        <!-- Form Name -->

        <legend class="text-center"><u>Historial de Documentación del Medico</u><br><b></b></legend>



        <table class="table table-bordered table-responsive">
            <thead class="bg-primary">
                <tr>
                    <th>Tipo</th>
                    <th>Nombre</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th>Documento</th>
                </tr>
            </thead>
            <tbody>
                <?php
                
                free_all_results($db);
                $id = $_GET["id"];


                // NOTE Se muestran todos los documentos del medico
                $SQL = "CALL `ST_LIST_ALL_DOCS_MED`('$id');";

                $result = mysqli_query($db, $SQL);


                while ($doc = mysqli_fetch_assoc($result)) {
                    $documento = $doc["documento"];
                    $tipo = $doc["tipo"];
                    $estado = $doc["estado"];
                    $extension = strtolower(pathinfo($doc["documento"], PATHINFO_EXTENSION));
                    $fecha = $doc["fecha_doc"];

                    echo "<tr class=\"TBLrows\">
                <td>$tipo</td>
                <td>$documento</td>
                <td>$fecha</td>
                <td>$estado</td>
                <td><span class=\"file_extension _$extension\" title=\"$tipo\" onclick = \"openFile('$documento')\"  style='cursor:pointer;'></span></td>
            </tr>";
                }

                ?>
            </tbody>
        </table>
    </fieldset>

    <?php


    include('../../resources/Includes/BootstrapHTML5.php');

    ?>
    <!-- Custom JS -->
    <script type="text/javascript" src="../../resources/JS/Develop/docs_hist_medico.js"></script>
    <!--<script type="text/javascript" src="../resources/JS/docs_hist_medico.min.js"></script>-->

</body>

</html>