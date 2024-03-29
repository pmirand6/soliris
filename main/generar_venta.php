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
        /** Bulma Modal */
        @import "../resources/bulma-modal-fx/dist/css/modal-fx.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/generar_venta.css";
        /* Include Bootstrap Datepicker */
        @import "../resources/Bootstrap-DatePicker/min/datepicker.min.css";
        /* Bootstrap Validator */
        @import "../resources/formvalidation/dist/css/formValidation.css";
        /**Sweetalert2 */
        @import "../resources/sweetalert2/dist/sweetalert2.min.css";
    </style>
</head>

<body>



    <section class="hero is-info">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Generación de Venta
                </h1>
                <h2 class="subtitle" id="nombrePaciente"></h2>
            </div>
        </div>
    </section>

    <section class=" box">
        <div class=" card">
            <div class="card-content">
                <form action="" id="frmVenta" enctype="multipart/form-data" autocomplete="off">
                    <input id="producto" name="producto" value="" type="text" class="input" style="display: none">
                    <p class="heading">Producto</p>
                    <p class="subtitle" id="productoTitle"></p>
                    <div class="columns">
                        <div class="column">
                            <div class="notification is-success">
                                <p class="heading">Datos de la Venta</p>
                            </div>
                            <div class="field is-horizontal">
                                <div class="field-label"><label class="label is-normal">Medico</label></div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control has-icons-right form-group">
                                            <input type="hidden" name="medicoSelected" id="medicoSelected">
                                            <input id="medico" name="medico" type="text" placeholder="Seleccione Médico" class="form-control input" maxlength="45" data-id="" required>
                                        </p>
                                        <p id="helpMedico" class="help"></p>
                                        <div id="result_medicos"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="field is-horizontal">
                                <div class="field-label"><label class="label is-normal">Presentación</label></div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control select has-icons-right form-group">
                                            <select id="presentacion" name="presentacion" class="form-control">
                                                <option value="">Selecionar presentacion</option>
                                            </select>
                                        </p>
                                    </div>
                                    <div class="field">
                                        <p class="control has-icons-right form-group">
                                            <input class="input form-control" type="number" name="cantDosis" id="cantDosis" min="1">
                                            <p id="helpCantDosis" class="help is-success">* Cantidad</p>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="field is-horizontal">
                                <div class="field-label"><label class="label is-normal">Canal / Cliente</label></div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control has-icons-right form-group">
                                            <input type="hidden" name="canalSelected" id="canalSelected">
                                            <input id="canal" name="canal" type="text" placeholder="Seleccione Canal" class="form-control input" maxlength="45" data-id="" required>
                                            <p id="helpCanal" class="help"></p>
                                            <div id="result_canal"></div>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="field is-horizontal">
                                <div class="field-label"><label class="label is-normal">Institución</label></div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control has-icons-right form-group">
                                            <input type="hidden" name="institucionSelected" id="institucionSelected">
                                            <input id="institucion" name="institucion" type="text" placeholder="Seleccione Institución" class="form-control input" maxlength="45" data-id="" required>
                                            <p id="helpInstitucion" class="help"></p>
                                            <div id="result_institucion"></div>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="field is-horizontal">
                                <div class="field-label"><label class="label is-normal">Orden Compra</label></div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control has-icons-right form-group">
                                            <input id="oc" name="oc" type="text" placeholder="Orden de Compra" class="form-control input" required>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="notification is-success">
                                <p class="heading">Documentación</p>
                            </div>
                            <div class="field is-horizontal">
                                <div class="field-label is-normal">
                                    <label class="label">Receta</label>
                                </div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control is-expanded has-icons-left has-icons-right">
                                            <input id="f_receta" name="f_receta" type="text" placeholder="Fecha de Documento" class="form-control input date">
                                            <span class="icon is-small is-left">
                                                <i class="fa fa-calendar"></i>
                                            </span>
                                            <span class="icon is-small is-right">
                                                <i data-field="f_receta" class=""></i>
                                            </span>
                                            <span class="fv-plugins-message-container"></span>
                                        </p>
                                    </div>
                                    <div class="field">
                                        <p class="control file is-expanded is-small is-info is-boxed has-icons-left has-icons-right" id="divFileReceta">
                                            <label class="file-label">
                                                <input class="file-input" type="file" name="file_receta" id="file_receta">
                                                <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i id="iconReceta" class="fa fa-upload"></i>
                                                    </span>
                                                    <span class="file-label">
                                                        Receta
                                                    </span>
                                                </span>
                                                <span class="file-name">
                                                    Seleccione Documento
                                                </span>
                                                <span class="fv-plugins-message-container"></span>
                                            </label>
                                        </p>
                                        <span class="buttons" style="display: none" id="btnRecetaActions">
                                            <a class="button is-link is-light" title="Ver Documento" id="fileRecetaPreviewShow"><i class="fa fa-search-plus"></i></a>
                                            <a class="button is-danger is-light" title="Borrar Documento"><i id="fileRecetaPreviewDelete" class="fa fa-trash"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>


                            <!-- Agregar Otro Documento -->
                            <div class="field is-grouped is-grouped-centered has-icon-left" id="divAddDoc">
                                <p class="control">
                                    <button class="button is-info is-small" id="btnAddDoc" type="button">
                                        <span class="icon">
                                            <i class="fa fa-plus"></i>
                                        </span>
                                        <span>Agregar Documento</span>
                                    </button>
                                </p>
                            </div>
                            <!-- Fields Otro Documento -->
                            <div class="field is-horizontal" id="divOtroDocumento" style="display:none;">
                                <div class="field-label is-normal">
                                    <label class="label">Otro</label>
                                </div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control is-expanded has-icons-left has-icons-right">
                                            <input id="f_otro" name="f_otro" type="text" placeholder="Fecha de Documento" class="input date">
                                            <span class="icon is-small is-left">
                                                <i class="fa fa-calendar"></i>
                                            </span>
                                            <span class="icon is-small is-right">
                                                <i data-field="f_otro" class=""></i>
                                            </span>
                                            <span class="fv-plugins-message-container"></span>
                                        </p>
                                    </div>
                                    <div class="field">
                                        <p class="control file is-expanded is-small is-info is-boxed has-icons-left has-icons-right" id="divFileOtro">
                                            <label class="file-label">
                                                <input class="file-input" type="file" name="file_otro" id="file_otro">
                                                <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i id="iconFileOtro" class="fa fa-upload"></i>
                                                    </span>
                                                    <span class="file-label">
                                                        Otro
                                                    </span>
                                                </span>
                                                <span class="file-name">
                                                    Seleccione Documento
                                                </span>
                                                <span class="buttons is-centered" style="display: none" id="btnOtroActions">
                                                    <span class="button is-link is-light" title="Ver Documento" id="fileOtroPreviewShow"><i class="fa fa-search-plus"></i></span>
                                                    <span class="button is-danger is-light" title="Borrar Documento" id="fileOtroDelete"><i class="fa fa-trash"></i></span>
                                                </span>
                                                <span class="fv-plugins-message-container"></span>
                                            </label>
                                        </p>
                                    </div>
                                    <div class="field">
                                        <p class="control is-expanded">
                                            <button class="button is-danger is-small" id="btnRemDoc" type="button">
                                                <span class="icon is-small">
                                                    <i class="fa fa-times"></i>
                                                </span>
                                                <span>Borrar</span>
                                            </button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="field is-grouped is-grouped-centered">
                        <p class="control form-group">
                            <button class="form-control button is-primary" id="btn-generar" type="submit">
                                Generar
                            </button>
                        </p>
                        <p class="control form-group">
                            <button class="button is-light" id="canVenta">
                                Cancelar
                            </button>
                        </p>
                    </div>
                </form>
            </div>
        </div>

    </section>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/DatePicker.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/formvalidation-bulma.php";
    include "../resources/Includes/sweetalert2.php";
    include "../resources/Includes/BulmaModal.php";
    ?>


    <script type="text/javascript" language="javascript" src="../resources/JS/Develop/generar_venta.js"></script>

</body>

</html>