<?php 

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _SG;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _BD;

?>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">

<?php 
if(isset($_GET["id"])){
    $id = $_GET["id"];
    $SQL = "SELECT * FROM soliris_usuarios WHERE id = '$id'";
    $result = mysqli_query($db, $SQL);

    while ($usr = mysqli_fetch_assoc($result)) {
        $id = $usr["id"];
        $vw_id = $usr["id"];
        $usuario = $usr["usuario"];
        $grupo = $usr["grupo"];
        $mail = $usr["mail"];
        $familia = $usr["familia"];
        $estado = $usr["estado"];
    };
    mysqli_free_result($result);
    mysqli_close($db);

} else {
    $id = "";
    $vw_id = "";
    $usuario = "";
    $grupo = "";
    $mail = "";
    $familia = "SOL";
    $estado = "";
}
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Editor de Usuarios</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Bootstrap Validator */
        @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";

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
            <legend>Datos del Usuario</legend>
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

            <!-- Usuario -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="usuario">Usuario</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user"></span></div>
                        <input id="usuario" name="usuario" type="text" placeholder="Usuario..." class="form-control input-md" maxlength="45" required="" value="<?php echo $usuario?>">
                    </div>
                    <div id="result_usuarios"></div>
                </div>
            </div>

            <!-- Grupo -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="grupo">Grupo</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span id="icon_lugar" class="fa fa-group"></span></div>
                        <select id="grupo" name="grupo" class="form-control selectpicker">
                            <option value="Admin" <?php  echo f_p_selected('Admin', $grupo) ?>>Admin</option>
                            <option value="FV" <?php  echo f_p_selected('FV', $grupo) ?>>FV</option>
                            <option value="Marketing" <?php  echo f_p_selected('Marketing', $grupo) ?>>Marketing</option>
                            <option value="Ventas" <?php  echo f_p_selected('Ventas', $grupo) ?>>Ventas</option>
                            <option value="AUDITOR" <?php  echo f_p_selected('AUDITOR', $grupo) ?>>Auditor</option>
                            <option value="APM" <?php  echo f_p_selected('APM', $grupo) ?>>APM</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- E-Mail -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="mail">E-Mail</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-envelope"></span></div>
                        <input id="mail" name="mail" type="text" placeholder="john.doe@raffo.com.ar..." class="form-control input-md" maxlength="45" required="" value="<?php echo $mail?>">
                    </div>
                </div>
            </div>

            <!-- Familia -->
          <!--  <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="familia">Familia</label>
                <div class="col-sm-3 col-xs-2">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-heartbeat"></span></div>
                        <input id="familia" name="familia" type="text" placeholder="Familia..." class="form-control input-md" maxlength="3" value="<?php echo $familia?>">
                    </div>
                </div>
            </div>
        -->
        <!-- Estado -->
        <div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label" for="estado">Estado</label>
            <div class="col-sm-5 col-xs-8 selectContainer">
                <div class="input-group">
                    <div class="input-group-addon"><span id="icon_estado" class="fa fa-check-circle-o"></span></div>
                    <select id="estado" name="estado" class="form-control selectpicker">
                        <option value="Activo" <?php  echo f_p_selected('Activo', $estado) ?>>Activo</option>
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
<script type="text/javascript" src="../resources/JS/Develop/usuario.js"></script>
<!--       <script type="text/javascript" src="../resources/JS/usuario.min.js"></script>-->

</body>
</html>