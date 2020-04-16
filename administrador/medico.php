<?php
require($_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">


<?php
if (isset($_GET["id"]) and $_GET["id"] != 0 and !empty($_GET["id"])) {
    free_all_results($db);
    
    $id = $_GET["id"];
    $SQL = "CALL `ST_SHOW_MEDICO`('$id')";

    echo $SQL;
    
    $result = mysqli_query($db, $SQL);

    while ($med = mysqli_fetch_assoc($result)) {
        
        $vw_id = $med["id"];
        $id = $med["id"];
        $nombre = strtoupper($med["nombre"]);
        $apellido = strtoupper($med["apellido"]);
        $matricula_tipo = $med["matricula_tipo"];
        $matricula_numero = $med["matricula_numero"];
        $lugar = $med["lugar"];
        $c_atencion = $med["c_atencion"];
        $telefono = $med["telefono"];
        $fax = $med["fax"];
        $email = $med["mail"];
        $domicilio = $med["domicilio"];
        $localidad = $med["localidad"];
        $fecha_cap = $med["fecha_cap"];
        if (!empty($med["especialidad_nombre"])) {
            $especialidad = $med["especialidad_nombre"];
        } else {
            $especialidad = "";
        }

        if (!empty($med["apm_id"])) {
            $apm = $med["apm_id"];
        } else {
            $apm = "";
        }

        if (!empty($med["u_venta"])) {
            $u_venta = $med["u_venta"];
        } else {
            $u_venta = "Sin Ventas";
        }
        
        
        $estado = $med["estado"];
    };
    mysqli_free_result($result);
} else {
    $vw_id = "";
    $id = "";
    $nombre = "";
    $matricula_tipo = "";
    $matricula_numero = "";
    $lugar = "";
    $c_atencion = "";
    $telefono = "";
    $fax = "";
    $email = "";
    $nacimiento = "";
    $domicilio = "";
    $localidad = "";
    $fecha_cap = "";
    $especialidad = "";
    $apm = "";
    $u_venta = "";
    $estado = "";
}

/* Combo de Especialidad */
$SQLesp = "CALL ST_LIST_ESPECIALIDADES()";
free_all_results($db);
$resultEsp = mysqli_query($db, $SQLesp);
$arr_select_esp = "";
$esp_array = explode(',', $especialidad);
while ($rowEsp = mysqli_fetch_assoc($resultEsp)) {
    foreach ($esp_array as $esp) {
        $arr_select_esp .= '<option value="' . $rowEsp["especialidad"] . '" ' . f_p_selected($esp, $rowEsp["especialidad"]) . '>' . $rowEsp["especialidad"] . '</option>;';
    }
};

mysqli_free_result($resultEsp);
/* ------------------ */

/* Combo de APM */
$SQLapm = "CALL `ST_LIST_APM_ACTIVOS`()";
free_all_results($db);
$resultAPM = mysqli_query($db, $SQLapm);
$arr_select_apm = "";

while ($rowAPM = mysqli_fetch_assoc($resultAPM)) {
    $arr_select_apm .= '<option value="' . $rowAPM["id"] . '" ' . f_p_selected($apm, $rowAPM["id"]) . '>' . $rowAPM["nombre_completo"] . '</option>;';
};

mysqli_free_result($resultAPM);
/* ------------------ */

/** Combo Tipo Matriculas */

$SQLmat_tipo = "CALL `ST_LIST_MEDICO_TIPO_MATRICULA`()";
free_all_results($db);
$resultMat_Tipo = mysqli_query($db, $SQLmat_tipo);
$arr_select_mat = "";

while ($rowMat = mysqli_fetch_assoc($resultMat_Tipo)) {
    
    if ($rowMat["id"] == 24) {
        $arr_select_mat .= '<optgroup label="'. $rowMat["tipo"] .'">';
        $arr_select_mat .= '<option value="' . $rowMat["id"] . '" ' . f_p_selected($matricula_tipo, $rowMat["id"]) . '>' . $rowMat["valor"] . '</option>;';
        $arr_select_mat .= '</optgroup>';
    } else {
        $arr_select_mat .= '<optgroup label="'. $rowMat["tipo"] .'">';
        $arr_select_mat .= '<option value="' . $rowMat["id"] . '" ' . f_p_selected($matricula_tipo, $rowMat["id"]) . '>' . $rowMat["valor"] . '</option>;';
        $arr_select_mat .= '</optgroup>';
    
    }
    
};

mysqli_free_result($resultMat_Tipo);

?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Editor de Médicos</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Include Bootstrap Datepicker */
        @import "../resources/Bootstrap-DatePicker/min/datepicker.min.css";
        /* Bootstrap Validator */
        @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Bootstrap-select */
        @import "../resources/Bootstrap-Select/css/bootstrap-select.min.css";
        /* Custom CSS */
        @import "../resources/Sprites/file_extension.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";

        #editDocs:hover {
            color: #e35919;
        }

        #histDocs:hover {
            color: #5cb811;
        }

        li {
            list-style-type: none;
            height: 48px;
            vertical-align: top;
        }

        li:hover {
            color: #e35919;
        }

        .form-horizontal .selectContainer .form-control-feedback {
            top: 0;
            right: -15px;
        }
    </style>



</head>

<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form" autocomplete="off">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Datos del Medico</legend>
            <?php
            if (isset($id) and $id != "") {
            ?>
                <!-- ID -->
                <div class="form-group">
                    <label class="col-sm-4 col-xs-4 control-label" for="vw_id">ID</label>
                    <div class="col-sm-3 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                            <input id="vw_id" name="vw_id" type="text" placeholder="ID" class="form-control input-md disabled" disabled value="<?php echo $id ?>">
                            <input id="id" name="id" type="hidden" class="form-control input-md hidden" value="<?php echo $vw_id ?>">
                        </div>
                    </div>
                </div>
            <?php
            }
            ?>
            <!-- Apellido -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Apellido</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-md"></span></div>
                        <input id="apellido" name="apellido" type="text" placeholder="Apellido" class="form-control input-md" maxlength="200" required="" value="<?php echo $apellido ?>" <?= disable_campo($_SESSION["grupo"], $id); ?>>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Nombre</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-md"></span></div>
                        <input id="nombre" name="nombre" type="text" placeholder="Nombre" class="form-control input-md" maxlength="200" required="" value="<?php echo $nombre ?>" <?= disable_campo($_SESSION["grupo"], $id); ?>>
                    </div>
                </div>
            </div>

            <!-- Tipo Matricula -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="lugar">Tipo Matricula</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                    <div class="input-group-addon"><span class="fa fa-id-card"></span></div>
                        <select class="selectpicker form-control" id="matricula_tipo" name="matricula_tipo" data-live-search="true" title="Seleccione el tipo de Matricula">
                            <?=$arr_select_mat;?>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Matricula Numero -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="matricula_numero">Matricula Nro</label>
                <div class="col-sm-4 col-xs-5">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-graduation-cap"></span></div>
                        <input id="matricula_numero" name="matricula_numero" type="text" placeholder="Nro Matricula..." class="form-control input-md" maxlength="45" required="" value="<?php echo $matricula_numero ?>" <?= disable_campo($_SESSION["grupo"], $id); ?>>
                    </div>
                </div>
            </div>

            <!-- Lugar -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="lugar">Lugar</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span id="icon_lugar" class="fa fa-hospital-o"></span></div>
                        <select id="lugar" name="lugar" class="form-control selectpicker">
                            <option value="HOSPITAL" <?php echo f_p_selected('HOSPITAL', $lugar) ?>>Hospital</option>
                            <option value="INSTITUCION" <?php echo f_p_selected('INSTITUCION', $lugar) ?>>Institución</option>
                            <option value="CONSULTORIO" <?php echo f_p_selected('CONSULTORIO', $lugar) ?>>Consultorio</option>
                            <option value="SANATORIO" <?php echo f_p_selected('SANATORIO', $lugar) ?>>Sanatorio</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Centro Atención -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="c_atencion">Centro Atención</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-medkit"></span></div>
                        <input id="c_atencion" name="c_atencion" type="text" placeholder="Centro de Atención..." class="form-control input-md" maxlength="255" value="<?php echo $c_atencion ?>">
                    </div>
                </div>
            </div>

            <!-- Telefono -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="telefono">Teléfono</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-phone"></span></div>
                        <input id="telefono" name="telefono" type="text" placeholder="45097100..." class="form-control input-md" maxlength="45" value="<?php echo $telefono ?>">
                    </div>
                </div>
            </div>

            <!-- Fax -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="fax">Fax</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-fax"></span></div>
                        <input id="fax" name="fax" type="text" placeholder="45097100..." class="form-control input-md" maxlength="45" value="<?php echo $fax ?>">
                    </div>
                </div>
            </div>

            <!-- Email -->
            <div class="form-group">

                <label class="col-sm-4 col-xs-4 control-label" for="mail">e-Mail</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-envelope"></span></div>
                        <input id="email" name="email" type="text" placeholder="e-Mail..." class="form-control input-md" maxlength="100" value="<?php echo $email ?>">
                    </div>
                </div>
            </div>

            <!-- Domicilio -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="domicilio">Domicilio</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-building"></span></div>
                        <input id="domicilio" name="domicilio" type="text" placeholder="Domicilio..." class="form-control input-md" maxlength="255" value="<?php echo $domicilio ?>">
                    </div>
                </div>
            </div>

            <!-- Localidad -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="localidad">Localidad</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-building"></span></div>
                        <input id="localidad" name="localidad" type="text" placeholder="Localidad..." class="form-control input-md" maxlength="255" value="<?php echo $localidad ?>">
                    </div>
                </div>
            </div>

            <!-- Especialidad -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="especialidad">Especialidad</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-heartbeat"></span></div>
                        <select id="especialidad" name="especialidad" class="form-control selectpicker" title="Seleccione la/s especialidad/es" multiple>
                            <?php echo $arr_select_esp; ?>
                        </select>
                    </div>
                </div>
            </div>

            <!-- APM -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="apm">APM</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user"></span></div>
                        <select id="apm" name="apm" class="form-control selectpicker">
                            <option value="" selected>Seleccione un APM</option>
                            <?php echo $arr_select_apm; ?>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Última Venta -->
            <?php if (isset($_GET['id'])) { ?>
                <div class="form-group">
                    <label class="col-sm-4 col-xs-4 control-label" for="u_venta">Última Venta</label>
                    <div class="col-sm-4 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-shopping-cart"></span></div>
                            <input id="u_venta" name="u_venta" type="text" placeholder="Última Venta..." class="form-control input-md disabled" disabled maxlength="255" value="<?php echo $u_venta ?>">
                        </div>
                    </div>
                </div>

                <!-- Estado -->

                <div class="form-group">
                    <label class="col-sm-4 col-xs-4 control-label" for="estado">Estado</label>
                    <div class="col-sm-5 col-xs-8 selectContainer">
                        <div class="input-group">
                            <div class="input-group-addon"><span id="icon_estado" class="fa fa-check-circle-o"></span></div>
                            <select id="estado" name="estado" class="form-control selectpicker" <?= disable_campo($_SESSION["grupo"], $id); ?>>
                                <option> Seleccione Estado</option>
                                <option value="Activo" <?php echo f_p_selected('Activo', $estado) ?>>Activo</option>
                                <option value="Inactivo" <?php echo f_p_selected('Inactivo', $estado) ?>>Inactivo</option>
                            </select>
                        </div>
                    </div>
                </div>
            <?php
            }
            ?>

            <?php
            if (isset($id) and $id != "") {

                echo "<div class='form-group'>
                <fieldset>
                    <legend>
                        Documentación
                        <i id=\"editDocs\" class='fa fa-edit' title='Editar Documentación' style='cursor:pointer;'></i>
                        <i id=\"histDocs\" class='fa fa-history' title='Historial de Documentación' style='cursor:pointer;'></i>
                    </legend>
                    ";

                $SQLdoc = "CALL `ST_LIST_DOCS_MED`($id)";
                free_all_results($db);
                $resultdoc = mysqli_query($db, $SQLdoc);

                while ($doc = mysqli_fetch_assoc($resultdoc)) {
                    $extension = "";
                    $tipo = "";
                    $documento = "";

                    $documento = urlencode($doc["documento"]);
                    $extension = strtolower(pathinfo($doc["documento"], PATHINFO_EXTENSION));
                    $tipo = $doc["tipo"];
                    $estado = $doc["estado"];
                    $fecha = $doc["fecha_documento"];


                    echo "
            <div class=\"col-sm-4 col-xs-4\" onclick = \"f_openfileMed('$id', '$documento')\"  style='cursor:pointer;'>
                <ul>
                    <li class=\"li\">
                        <span class=\"file_extension _$extension\" title=\"$tipo\"></span>
                        <b>$tipo - $fecha</b>
                    </li>
                </ul>
            </div>
            ";
                };
                mysqli_free_result($resultdoc);

                echo "
            </fieldset>
        </div>
        ";
            }
            ?>

            <hr>

            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-sm-12">
                    <button type="submit" id="bot_guardar" name="bot_guardar" class="btn btn-success disabled">
                        <span class="fa fa-save"></span>
                        Guardar
                    </button>
                </div>
            </div>
        </fieldset>
    </form>
    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/DatePicker.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/BootstrapSelect.php";
    ?>

    <!-- Custom JS -->
    <script type="text/javascript" src="../resources/JS/Develop/medico.js"></script>
</body>

</html>