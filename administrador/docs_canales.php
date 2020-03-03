<?php
    
    require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Documentos del Canal</title>

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
    if(isset($_GET["id"]) AND !empty($_GET["id"])) {
        $id = $_GET["id"];
?>
    <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form" action="ajx.file-upload.php" method="post" enctype="multipart/form-data">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>
<?php
        if(isset($_GET["id"]) AND !empty($_GET["id"])) {
?>
            <i id="Docs" class="fa fa-step-backward btn btn-xs btn-default" title="Volver"
               style="cursor:pointer;margin-right: 50pxs;"></i>
<?php
        }
?>
                Documentos del Canal
                <p style="font-size: x-small;text-align: right;">
                    <i>(*) En caso de existir documentos anteriores, los subidos en este módulo los reemplazarán.</i>
                </p>
            </legend>

            <!-- ID -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="vw_id">ID</label>
                <div class="col-sm-3 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                        <input id="vw_id" name="vw_id" type="text" placeholder="ID" class="form-control input-md disabled" disabled value="<?php echo $id?>">
                        <input id="id" name="id" type="hidden" class="form-control input-md hidden" value="<?php echo $id?>">
                    </div>
                </div>
            </div>

            <!-- File Consentimiento -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="file_canal">ROT</label>
                <div class="col-sm-4 col-xs-6">
                    <div id="file_canal">Subir</div>
                </div>
            </div>


<?php
    if(isset($_GET["id"]) AND !empty($_GET["id"])) {
?>

            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-sm-12">
                    <a id="save" name="save" class="btn btn-success" data-loading-text="Loading...">
                        <span class="fa fa-save"></span>
                        Guardar
                    </a>
                </div>
            </div>
<?php
    }
?>
        </fieldset>
    </form>
<?php
    }else{
        echo "No seleccionó un canal al cuál adjuntar documentación.";
    }
?>

<?php
    include "../resources/Includes/BootstrapHTML5.php";
?>

    <!-- JQuery FileUpload-->
        <script type="text/javascript" src="../resources/JQuery-FileUpload/JS/jquery.uploadfile.min.js"></script>

    <!-- Custom JS -->
         <script type="text/javascript" src="../resources/JS/Develop/docs_canales.js"></script> 
        <!--<script type="text/javascript" src="../resources/JS/docs_canales.min.js"></script>-->
</body>
</html>
