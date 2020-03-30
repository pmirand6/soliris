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
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/generar_venta.css";
        /* Include Bootstrap Datepicker */
        @import "../resources/Bootstrap-DatePicker/min/datepicker.min.css";
        /* Bootstrap Validator */
        @import "../node_modules/formvalidation/dist/css/formValidation.css";


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
            <form id="frmVenta" action="">
                <section class="container level">
                    <div class="container level-left">
                        <div class="level-item box">
                            <div>
                                <div class="notification is-success">
                                    <p class="heading">Datos de la Venta</p>
                                </div>
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input id="medico" name="medico" type="text" placeholder="Seleccione Médico" class="form-control input" maxlength="45" data-id="" required>
                                    </p>
                                    <p id="helpMedico" class="help"></p>
                                    <div id="result_medicos"></div>
                                </div>
                                <br>
                                <div class="field">
                                    <p class="control select has-icons-right form-group">
                                        <select id="dosis" class="form-control">
                                            <option value="">Selecionar Dosis</option>
                                        </select>
                                    </p>
                                </div>
                                <br>
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input class="input form-control" type="number" name="cantDosis" id="cantDosis" placeholder="Cantidad Dosis" min="1">
                                    </p>
                                </div>
                                <br>
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input id="canal" name="canal" type="text" placeholder="Seleccione Canal" class="form-control input" maxlength="45" data-id="" required>
                                        <p id="helpCanal" class="help"></p>
                                        <div id="result_canal"></div>
                                    </p>
                                </div>
                                <br>
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input id="institucion" name="institucion" type="text" placeholder="Seleccione Institución" class="form-control input" maxlength="45" data-id="" required>
                                        <p id="helpInstitucion" class="help"></p>
                                        <div id="result_institucion"></div>
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
                                <div class="field is-horizontal">
                                    <div class="field-label"><label class="label is-normal">Receta</label></div>
                                    <div class="field-body">
                                        <div class="field">
                                            <div class="control has-icons-right">
                                                <input id="f_receta" name="f_receta" type="text" placeholder="Fecha de Receta" class="form-control input date">
                                                <span class="icon is-small is-right">
                                                    <i data-field="firstName" class=""></i>
                                                </span>
                                            </div>
                                            <div class="fv-plugins-message-container"></div>
                                        </div>
                                        <div class="field fv-plugins-icon-container">
                                            <div class="control file is-primary has-icons-right">
                                                <label class="file-label">
                                                    <input class="file-input" type="file" name="file_receta">
                                                    <span class="file-cta">
                                                        <span class="file-icon">
                                                            <i class="fa fa-upload"></i>
                                                        </span>
                                                        <span class="file-label">
                                                            Receta
                                                        </span>
                                                    </span>
                                                </label>
                                                <span class="icon is-small is-right">
                                                    <i data-field="lastName" class=""></i>
                                                </span>
                                            </div>
                                            <div class="fv-plugins-message-container"></div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="field is-horizontal">
                                    <div class="field-label"><label class="label is-normal">Otro</label></div>
                                    <div class="field-body">
                                        <div class="field">
                                            <div class="control has-icons-right">
                                                <input id="f_otro" name="f_otro" type="text" placeholder="Fecha de Receta" class="input date">
                                                <span class="icon is-small is-right">
                                                    <i data-field="f_otro" class=""></i>
                                                </span>
                                            </div>
                                            <div class="fv-plugins-message-container"></div>
                                        </div>
                                        <div class="field fv-plugins-icon-container">
                                            <div class="control file is-info has-icons-right">
                                                <label class="file-label">
                                                    <input class="file-input" type="file" name="file_otro">
                                                    <span class="file-cta">
                                                        <span class="file-icon">
                                                            <i class="fa fa-upload"></i>
                                                        </span>
                                                        <span class="file-label">
                                                            Otro
                                                        </span>
                                                    </span>
                                                </label>
                                                <span class="icon is-small is-right">
                                                    <i data-field="f_otro" class=""></i>
                                                </span>
                                            </div>
                                            <div class="fv-plugins-message-container"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="field is-grouped is-grouped-centered">
                    <p class="control form-group">
                        <button class="form-control button is-primary" id="btn-generar" type="submit">
                            Generar
                        </button>
                    </p>
                    <p class="control form-group">
                        <button class="button is-light">
                            Cancelar
                        </button>
                    </p>
                </div>
            </form>
        </section>
    </div>


    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/DatePicker.php";
    include "../resources/Includes/EasyUI.php";
    ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-shim/0.35.3/es6-shim.min.js"></script>

    <script src="../node_modules/formvalidation/dist/js/FormValidation.full.js"></script>
    <script src="../node_modules/formvalidation/dist/js/plugins/Bulma.js"></script>
    <script type="text/javascript" language="javascript" src="../resources/JS/Develop/generar_venta.js"></script>

</body>

</html>