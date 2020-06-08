<!DOCTYPE html>
<?php
require '../config/config.php';
    include $_SERVER['DOCUMENT_ROOT']._SG;
    include $_SERVER['DOCUMENT_ROOT']._FN;
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* EasyUI */
        @import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/TBL-icons.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/canales.css";
        /*Select2 */
        @import "../resources/select2/dist/css/select2.css";
        @import "../resources/select2/dist/css/select2-bootstrap.css";
    </style>
</head>
<body>

<section id="titulo">
        <div class="text-center">
          <h3>Habilitar Cliente</h3>
          <hr>
      </div>
  </section>
  
  <br>
    <div class="container">
        <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Cliente</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <select id="select-clientes" name="select-clientes" type="text" placeholder="Nombre..." class="form-control" ></select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">zcust_addr</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <input class="form-control" type="text" name="zcust_addr" id="zcust_addr" disabled>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">zcust_city</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <input class="form-control" type="text" name="zcust_city" id="zcust_city" disabled>
                    </div>
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">zcust_line1</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <input class="form-control" type="text" name="zcust_line1" id="zcust_line1" disabled>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Convenio</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <select class="form-control" name="selConvenio" id="selConvenio">
                           <option style="display:none">Seleccione una Opción</option>
                            <option value="0">SI</option>
                            <option value="1">NO</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>
    </div>

   

<?php
    include '../resources/Includes/BootstrapHTML5.php';
    include '../resources/Includes/FormValidation.php';
    include '../resources/Includes/select2.php';
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="../resources/JS/Develop/cliente.js"></script>
    
</body>
</html>