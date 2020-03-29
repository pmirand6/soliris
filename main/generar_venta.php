<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;

$idPaciente = $_GET["idPac"];

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generación de Venta</title>


    <style type="text/css">
        /* Bulma CSS */
        @import "../resources/CSS/bulma/css/bulma.css";
        /* Select2 CSS */
        @import "../resources/select2/dist/css/select2.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/generar_venta.css";
        /**SELECT 2 */


        html {
            background: #eee;
        }

        .container-form {
            min-width: 320px;
            width: 64%;
            max-width: 40em;
            margin: 10vh auto;
        }
    </style>
</head>

<body>

    <div id="app">

        <section class="hero is-info">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title">
                        Generación de Venta
                    </h1>
                    <h2 class="subtitle">
                        Nombre Paciente
                    </h2>
                </div>
            </div>
        </section>

        <section class="container box">
            <section class="container level">
                <div class="container level-left">
                    <div class="level-item box">
                        <div>
                            <div class="notification is-success">
                                <p class="heading">Datos de la Venta</p>
                            </div>
                            <div class="field">
                                <p class="control">
                                    <input id="medico" name="medico" type="text" placeholder="Seleccione Médico" class="input" maxlength="45" data-id="" required>
                                </p>
                                <div id="result_medicos"></div>
                            </div>

                            <br>
                            <div class="field is-grouped">
                                <p class="control select">
                                    <select>
                                        <option>Selecionar Dosis</option>
                                        <option>With options</option>
                                    </select>
                                </p>
                                <p class="control">
                                    <input class="input" type="text" placeholder="Cantidad Dosis">
                                </p>
                            </div>
                            <br>
                            <div class="field is-grouped">
                                <p class="control select">
                                    <select>
                                        <option>Selecionar Canal</option>
                                        <option>With options</option>
                                    </select>
                                </p>
                                <p class="control select">
                                    <select>
                                        <option>Selecionar Institución</option>
                                        <option>With options</option>
                                    </select>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container level-right" style="margin-top: -100px;">
                    <div class="level-item box">
                        <div>
                            <div class="notification is-success">
                                <p class="heading">Documentación</p>
                            </div>
                            <div class="field is-grouped">
                                <p class="control">
                                    <input class="input" type="text" placeholder="Fecha Receta">
                                </p>
                                <p class="control file is-primary">
                                    <label class="file-label">
                                        <input class="file-input" type="file" name="resume">
                                        <span class="file-cta">
                                            <span class="file-icon">
                                                <i class="fa fa-upload"></i>
                                            </span>
                                            <span class="file-label">
                                                Receta
                                            </span>
                                        </span>
                                    </label>
                                </p>
                            </div>
                            <div class="field is-grouped">
                                <p class="control">
                                    <input class="input" type="text" placeholder="Fecha Receta">
                                </p>
                                <p class="control file is-info">
                                    <label class="file-label">
                                        <input class="file-input" type="file" name="resume">
                                        <span class="file-cta">
                                            <span class="file-icon">
                                                <i class="fa fa-upload"></i>
                                            </span>
                                            <span class="file-label">
                                                Otro
                                            </span>
                                        </span>
                                    </label>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="field is-grouped is-grouped-centered">
                <p class="control">
                    <a class="button is-primary">
                        Generar
                    </a>
                </p>
                <p class="control">
                    <a class="button is-light">
                        Cancelar
                    </a>
                </p>
            </div>
        </section>

    </div>





    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/select2.php"
    ?>

    <script type="text/javascript" language="javascript" src="../resources/JS/Develop/generar_venta.js"></script>

</body>

</html>