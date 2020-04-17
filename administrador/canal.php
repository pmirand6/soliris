<?php

require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<?php
if(isset($_GET["id"]) AND $_GET["id"]!=0 AND !empty($_GET["id"])){
    $id = $_GET["id"];
    $SQL = "SELECT * FROM canales WHERE id = '$id' ORDER BY canal DESC;";
    $result = mysqli_query($db, $SQL);

    while ($can = mysqli_fetch_assoc($result)) {
        $id = $can["id"];
        $vw_id = $can["id"];
        $nombre = $can["canal"];
        $familia = $can["familia"];
        $direccion = $can["direccion"];
        $mail = $can["mail"];
        $dir_tec = $can["dir_tec"];
        $cont_venta = $can["cont_venta"];
        $cont_otro = $can["cont_otro"];
        
        $estado = $can["estado"];
    };
    mysqli_free_result($result);

} else {
    $id = "";
    $vw_id = "";
    $nombre = "";
    $familia = "";
    $direccion = "";
    $mail = "";
    $dir_tec = "";
    $cont_venta = "";
    $cont_otro = "";
    
    $estado = "";
}
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Editor de Canales</title>

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
        li{
            list-style-type: none;
            height: 48px;
            vertical-align: top;
        }
            li:hover{
                color: #e35919;
            }
       
            #editDocsCanal:hover{
                color: #e35919;
            }
    </style>


</head>
<body>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Datos del Canal</legend>
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
                        <input id="nombre" name="nombre" type="text" placeholder="Nombre..." class="form-control input-md" maxlength="100" required="" value="<?php echo $nombre?>">
                    </div>
                </div>
            </div>

            <!-- Direccion -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="direccion">Dirección</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-building"></span></div>
                        <input id="direccion" name="direccion" type="text" placeholder="Dirección..." class="form-control input-md" value="<?php echo $direccion?>">
                    </div>
                </div>
            </div>

            <!-- Mail -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="mail">Mail</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-envelope"></span></div>
                        <input id="mail" name="mail" type="text" placeholder="Mail..." class="form-control input-md" maxlength="200" value="<?php echo $mail?>">
                    </div>
                </div>
            </div>

            <!-- Director Tecnico -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="dir_tec">Director Técnico</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-md"></span></div>
                        <input id="dir_tec" name="dir_tec" type="text" placeholder="Director Técnico..." class="form-control input-md" maxlength="200" value="<?php echo $dir_tec?>">
                    </div>
                </div>
            </div>

            <!-- Contacto Venta -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="cont_venta">Contacto de Venta</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-suitcase"></span></div>
                        <input id="cont_venta" name="cont_venta" type="text" placeholder="Contacto de Venta..." maxlength="200" class="form-control input-md" value="<?php echo $cont_venta?>">
                    </div>
                </div>
            </div>

            <!-- Contacto Otro -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="cont_otro">Otro Contacto</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-suitcase"></span></div>
                        <input id="cont_otro" name="cont_otro" type="text" placeholder="Otro Contacto..." maxlength="200" class="form-control input-md" value="<?php echo $cont_otro?>">
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
                            <option value="Activo" <?php  echo f_p_selected('Activo', $estado) ?>>Activo</option>
                            <option value="Inactivo" <?php  echo f_p_selected('Inactivo', $estado) ?>>Inactivo</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Documentacion -->
<?php
    if(isset($id) AND $id != "") {

        echo "<div class='form-group'>
                <fieldset>
                    <legend>Documentación <i id=\"editDocsCanal\" class='fa fa-edit' title='Editar Documentación' style='cursor:pointer;'></i></legend>
                    ";

        $SQLdoc = " SELECT *
                    FROM soliris_documentacion a
                    WHERE a.id_maestro = '$id' AND a.tipo IN ('Canal') AND a.id = (
                      SELECT MAX(b.id)
                      FROM soliris_documentacion b
                      WHERE b.id_maestro = a.id_maestro AND b.tipo = a.tipo
                    );";

        $resultdoc = mysqli_query($db, $SQLdoc);

        while ($doc = mysqli_fetch_assoc($resultdoc)) {
            $extension = "";
            $tipo = "";
            $documento = "";

            $documento = urlencode($doc["documento"]);
            $extension = strtolower(pathinfo($doc["documento"], PATHINFO_EXTENSION));
            $tipo = $doc["tipo"];


            echo "
            <div class=\"col-sm-4 col-xs-4\" onclick = \"openfile('$documento')\"  style='cursor:pointer;'>
                <ul>
                    <li class=\"li\">
                        <span class=\"file_extension _$extension\" title=\"$tipo\"></span>
                        <b>$tipo</b>
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
    include "../resources/Includes/FormValidation.php";
?>
    <!-- Custom JS -->
         <script type="text/javascript" src="../resources/JS/Develop/canal.js"></script>
        <!--<script type="text/javascript" src="../resources/JS/canal.min.js"></script>-->
</body>
</html>
