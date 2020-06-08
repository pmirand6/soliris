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
        /** Select2 Style */
        @import "../resources/select2/dist/css/select2.css";
        /** Select2 Bootstrap */
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
        <form action="" method="get">
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Apellido, Nombre</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <select id="select-clientes" name="select-clientes" type="text" placeholder="Nombre..." class="form-control" ></select>
                    </div>
                </div>
            </div>
        </form>
    </div>

   

<?php
    include '../resources/Includes/BootstrapHTML5.php';
    include '../resources/Includes/FormValidation.php';
    include '../resources/Includes/EasyUI.php';
    include '../resources/Includes/select2.php';
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="../resources/JS/Develop/cliente.js"></script>
    
</body>
</html>