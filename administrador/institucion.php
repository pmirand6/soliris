<?php 

require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<?php 

if(isset($_GET["id"])){
    $id = $_GET["id"];
    $SQL = "CALL ST_SHOW_INSTITUCION('$id')";
    free_all_results($db);
    $result = mysqli_query($db, $SQL);

    while ($inst = mysqli_fetch_assoc($result)) {
        $id = $inst["id"];
        $vw_id = $inst["id"];
        $nombre = $inst["nombre"];
        $direccion = $inst["direccion"];
        $altura = $inst["altura"];
        $localidad = $inst["localidad"];
        $provincia = $inst["provincia"];
        $contacto = $inst["contacto"];
        $mail = $inst["mail"];
        $telefono = $inst["telefono"];
        $notas = $inst["notas"];
        $tipo = $inst["tipo"];
        $estado = $inst["estado"];
        $familia = $inst["familia"];
    };
    mysqli_free_result($result);
    mysqli_close($db);

} else {
    $id = "";
    $vw_id = "";
    $nombre = "";
    $direccion = "";
    $altura = "";
    $localidad = "";
    $provincia = "";
    $contacto = "";
    $mail = "";
    $telefono = "";
    $notas = "";
    $tipo = "";
    $estado = "";
    $familia = "";
}
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Editor de Instituciones</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Bootstrap Validator */
            @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";

        .form-horizontal .selectContainer .form-control-feedback {
            top: 0;
            right: -15px;
        }
    </style>



</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Datos de la Institución</legend>
            <?php 
            if (isset($id) AND $id != "") {
                ?>
                <!-- ID -->
                <div class="form-group">
                    <label class="col-sm-4 col-xs-4 control-label" for="vw_id">ID</label>
                    <div class="col-sm-3 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                            <input id="vw_id" name="vw_id" type="text" placeholder="ID" class="form-control input-md disabled" disabled value="<?php echo $id?>">
                            <input id="id" name="id" type="hidden" class="form-control input-md hidden" value="<?php echo $vw_id?>">
                        </div>
                    </div>
                </div>
            <?php 
            }
            ?>
            <!-- Nombre -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Nombre</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-institution"></span></div>
                        <input id="nombre" name="nombre" type="text" placeholder="Nombre..." class="form-control input-md" maxlength="250" required="" value="<?php echo $nombre?>">
                    </div>
                </div>
            </div>

            <!-- Dirección -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="direccion">Dirección</label>
                <div class="col-sm-5 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-map-marker"></span></div>
                        <input id="direccion" name="direccion" type="text" placeholder="Direccion..." class="form-control input-md" maxlength="250" value="<?php echo $direccion?>">
                    </div>
                </div>
                <!-- Altura -->
                <div class="col-sm-3 col-xs-2">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                        <input id="altura" name="altura" type="text" placeholder="Altura..." class="form-control input-md" maxlength="10" value="<?php echo $altura?>">
                    </div>
                </div>
            </div>

            <!-- Localidad -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="localidad">Localidad</label>
                <div class="col-sm-4 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-map-marker"></span></div>
                        <input id="localidad" name="localidad" type="text" placeholder="Localidad..." class="form-control input-md" maxlength="100" value="<?php echo $localidad?>">
                    </div>
                </div>
            </div>

            <!-- Provincia -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="provincia">Provincia</label>
                <div class="col-sm-4 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-map-marker"></span></div>
                        <input id="provincia" name="provincia" type="text" placeholder="Provincia..." class="form-control input-md" maxlength="100" value="<?php echo $provincia?>">
                    </div>
                </div>
            </div>

            <!-- Contacto -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="contacto">Contacto</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user"></span></div>
                        <input id="contacto" name="contacto" type="text" placeholder="Contacto..." class="form-control input-md" maxlength="100" value="<?php echo $contacto?>">
                    </div>
                </div>
            </div>

            <!-- Mail -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="mail">e-Mail</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-envelope"></span></div>
                        <input id="mail" name="mail" type="text" placeholder="e-Mail..." class="form-control input-md" maxlength="100" value="<?php echo $mail?>">
                    </div>
                </div>
            </div>

            <!-- Telefono -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="telefono">Telefono</label>
                <div class="col-sm-4 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-phone"></span></div>
                        <input id="telefono" name="telefono" type="text" placeholder="Telefono..." class="form-control input-md" maxlength="45" value="<?php echo $telefono?>">
                    </div>
                </div>
            </div>

            <!-- Notas -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="notas">Notas</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-paper-plane"></span></div>
                        <textarea id="notas" name="notas" placeholder="Notas..." class="form-control"><?php echo $notas?></textarea>
                    </div>
                </div>
            </div>

            <!-- Tipo -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="tipo">Tipo</label>
                <div class="col-sm-4 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-tag"></span></div>
                        <input id="tipo" name="tipo" type="text" placeholder="Tipo..." class="form-control input-md" maxlength="10" value="<?php echo $tipo?>">
                    </div>
                </div>
            </div>

            <!-- Familia -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="familia">Familia</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-heartbeat"></span></div>
                        <input id="familia" name="familia" type="text" placeholder="Familia..." class="form-control input-md" readonly="readonly" maxlength="3" value="<?php echo "SOL"?>">
                    </div>
                </div>
            </div>

            <!-- Estado -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="estado">Estado</label>
                <div class="col-sm-5 col-xs-5 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span id="icon_estado" class="fa fa-check-circle-o"></span></div>
                        <select id="estado" name="estado" class="form-control selectpicker">
							<option value="" selected >Seleccione un Estado</option>
                            <option value="Activo" <?php  echo f_p_selected('Activo', $estado) ?> selected>Activo</option>
                            <option value="Inactivo" <?php  echo f_p_selected('Inactivo', $estado) ?>>Inactivo</option>
                        </select>
                    </div>
                </div>
            </div>

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
    include "../resources/Includes/FormValidation.php";
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="../resources/JS/Develop/institucion.js"></script>
<!--        <script type="text/javascript" src="../resources/JS/institucion.min.js"></script>-->

</body>
</html>