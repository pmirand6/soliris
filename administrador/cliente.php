<!DOCTYPE html>
<?php
require '../config/config.php';
    include $_SERVER['DOCUMENT_ROOT']._SG;
    include $_SERVER['DOCUMENT_ROOT']._FN;

    if(isset($_GET["id"]) AND $_GET["id"]!=0 AND !empty($_GET["id"])){
        $id = $_GET["id"];
        free_all_results($db);
        $SQL = "CALL ST_SHOW_CANAL('$id');";
        $result = mysqli_query($db, $SQL);
    
        while ($can = mysqli_fetch_assoc($result)) {
            $id = $can["id"];
            $nombre = $can["nombre"];
            $codigo = $can["codigo"];
            $ciudad = $can["ciudad"];
            $direccion = $can["direccion"];
            $convenio = $can["convenio"];
            $estado = $can["estado"];
        };
        mysqli_free_result($result);
    
    } else {
        $id = "";
        $nombre = "";
        $codigo = "";
        $ciudad = "";
        $direccion = "";
        $convenio = "";
        $estado = "";
        
    }
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
        /** SweetAlert2 */
        @import "../resources/sweetalert2/dist/sweetalert2.css";
    </style>
</head>
<body>

<section id="titulo">
        <div class="text-center">
        <?php if (isset($id) AND $id != "") {?>
            <h3>Editar Cliente</h3>
        <?php } else {?>
            <h3>Habilitar Cliente</h3>
         <?php }?>
          
          <hr>
      </div>
  </section>
  
  <br>
    <div class="container">
        <form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
        <?php
            if (isset($id) AND $id != "") {
                ?>
                <!-- ID -->
                <div class="form-group">
                    <label class="col-sm-4 col-xs-4 control-label" for="id">ID</label>
                    <div class="col-sm-3 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                            <input id="id" name="id" type="text" placeholder="id" class="form-control input-md disabled" disabled value="<?php echo $id?>">
                        </div>
                    </div>
                </div>
            <?php
            }
            ?>

            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Nombre</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <?php if (isset($id) AND $id != "") { ?>
                            <input class="form-control" type="text" name="nombre" id="nombre" value="<?=$nombre?>" disabled>
                        <?php } else {?>
                            <select id="selectClientes" name="selectClientes" type="text" placeholder="Nombre..." class="form-control" ></select>
                        <?php } ?>
                        
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Código</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <input class="form-control" type="text" name="zcust_addr" id="zcust_addr" value="<?php echo $codigo;?>" disabled>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Ciudad</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <input class="form-control" type="text" name="zcust_city" id="zcust_city" value="<?php echo $ciudad;?>" disabled>
                    </div>
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Dirección</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <input class="form-control" type="text" name="zcust_line1" id="zcust_line1" value="<?php echo $direccion;?>" disabled>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Convenio</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user-secret"></span></div>
                        <select class="form-control" name="selConvenio" id="selConvenio">
                           <option style="display:none" value="">Seleccione una Opción</option>
                            <option value="1" <?php  echo f_p_selected('SI', $convenio) ?>>SI</option>
                            <option value="0" <?php  echo f_p_selected('NO', $convenio) ?>>NO</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- Estado -->
            <?php
            if (isset($id) AND $id != "") {
                ?>
        
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
            <?php } ?>
            <div class="form-group text-center">
                <div class="col-sm-12">
                    <button type="submit" id="bot_guardar" name="bot_guardar" class="btn btn-success disabled">
                        <span class="fa fa-save"></span>
                        Guardar
                    </button>
                </div>
            </div>
        </form>
    </div>

   

<?php
    include '../resources/Includes/BootstrapHTML5.php';
    include '../resources/Includes/FormValidation.php';
    include '../resources/Includes/select2.php';
    include '../resources/Includes/sweetalert2.php';
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="../resources/JS/Develop/cliente.js"></script>
        <script></script>
    
</body>
</html>