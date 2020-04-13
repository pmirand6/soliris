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
    $SQL = "CALL `ST_SHOW_APM`('$id');";
    free_all_results($db);
    $result = mysqli_query($db, $SQL);

    while ($apm = mysqli_fetch_assoc($result)) {
        echo $apm['id'];
        $id = $apm["id"];
        $vw_id = $apm["id"];
        $nombre = $apm["nombre_completo"];
        $estado = $apm["estado"];
    };
    mysqli_free_result($result);
    mysqli_close($db);

} else {
    $id = "";
    $vw_id = "";
    $nombre = "";
    $estado = "";
}
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <?php if (isset($_GET["id"]) AND !empty($_GET["id"])) {
        echo "<title>Editor de APMs</title>";
    } else {
        echo "<title>Nuevo APM</title>";
    }?>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Bootstrap Validator */
        @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Custom CSS */
        @import "../resources/Sprites/file_extension.css";
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
            <legend>Datos del APM</legend>
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
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Apellido, Nombre</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <input id="nombre" name="nombre" type="text" placeholder="Nombre..." class="form-control input-md" maxlength="100" required="" value="<?php echo $nombre?>">
                    </div>
                    <div id="result_usuarios"></div>
                </div>
            </div>

            <!-- Estado -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="estado">Estado</label>
                <div class="col-sm-5 col-xs-5 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span id="icon_estado" class="fa fa-check-circle-o"></span></div>
                        <?php if (isset($id) AND $id != "") {?>
                        <select id="estado" name="estado" class="form-control selectpicker">
                            <option value="Activo" <?php  echo f_p_selected('Activo', $estado) ?>>Activo</option>
                            <option value="Inactivo" <?php echo f_p_selected('Inactivo', $estado) ?>>Inactivo</option>
                        </select><?php } else {?>
                            <input id="estado" name="estado" type="text" placeholder="Estado" class="form-control input-md" maxlength="100" value="Activo" disabled="true">
                        <?php }?>
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
    <script type="text/javascript" src="../resources/JS/Develop/apm.js"></script>
    <!--    <script type="text/javascript" src="../resources/JS/apm.min.js"></script>-->
</body>
</html>