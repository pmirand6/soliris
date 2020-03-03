<?php
	//ini_set('session.cookie_lifetime', 7200);
	//include $_SERVER['DOCUMENT_ROOT'] . 'base.php';

require_once 'config/config.php';

include $_SERVER['DOCUMENT_ROOT'] . _BD;

?>
<!DOCTYPE html>
<?php
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate"); // HTTP/1.1
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache"); // HTTP/1.0
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); // Date in the past
?>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">
    <meta http-equiv="Pragma" content="no-cache">
    <script type="text/javascript" src="resources/JQuery/jquery-2.1.3.js"></script>

    <link rel="shortcut icon" href="resources/IMG/soliris.ico" type="image/x-icon" />

    <title><?php echo _NAME;?></title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
    @import "resources/CSS/Font-Awesome-4.5.0/css/font-awesome.css";
        /* Google Font */
        @import url('resources/CSS/GoogleFont/font.css?family=PT+Sans+Narrow');
        /* EasyUI */
        @import "resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";

        /* Custom CSS */
        @import "resources/CSS/Develop/defa.css";

    </style>

    <?php
    include "resources/Includes/BootstrapHTML5.php";
    include "resources/Includes/EasyUI.php";


    ?>

    <!-- Custom JS -->
    <script type="text/javascript" src="resources/JS/Develop/defa.js"></script>
    <!-- <script type="text/javascript" src="resources/JS/defa.min.js"></script> -->

</head>
<body>
    <?php 

    if (strtoupper($_SESSION["grupo"]) == "APM") { 
            //esta parte muestra unicamente el cliente para los apm si el grupo es 3, caso contrario muestra la pantalla de gestion interna
     header('Location: cliente/panel.php');
 }
 else
 {

    if (isset($_POST["grupo"])) {
        $_SESSION["grupo"] = $_POST["grupo"];
    }
   ?>
   <div class="easyui-layout" data-options="fit:true" style="width:100%;height:100%;">
        <div data-options="region:'north'" style="height:8%" class="head_barra col-sm-12 col-xs-12">
        <div class="col-sm-1 col-xs-1">
            <img src="resources/IMG/soliris.svg" class="logo img-rounded">
        </div>
        <div class="col-sm-9 col-xs-8">
            <p id="info" style="text-align:right;vertical-align: middle;"></p>
        </div>

        <!--      Botones de usuario y LogOut      -->
        <div class="col-sm-2 col-xs-3 text-right" id="botonesHeader">
            <div class="btn-group" role="group">
                    <button type="button" id="user" class="btn btn-info pointer fa fa-user" data-container="body" data-toggle="popover">
                    <b style="margin-left: 10px"><?php  echo strtoupper($_SESSION["soliris_usuario"]) ?></b>
                </button>
            </div>
            <div id="popoverUser" class="hidden">
                <div>
            <?php if (strcasecmp($_SESSION["grupo"], 'Admin') == 0) {?>            
                        <form id="frm_grupo">
                            <span>Cambiar Grupo: </span>
                            <div class="form-check">
                              <label class="form-check-label">
                                <input class="form-check-input" type="radio" value="Ventas" onclick="change_location(this.value);" <?=selected("Ventas");?>>
                                Ventas 
                            </label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label">
                            <input class="form-check-input" type="radio" value="FV" onclick="change_location(this.value);" <?=selected("FV");?>>
                            FV
                        </label>
                    </div>
                    <div class="form-check disabled">
                      <label class="form-check-label">
                        <input class="form-check-input" type="radio" value="Marketing" onclick="change_location(this.value);" <?=selected("Marketing");?>>
                        MKT
                    </label>
                </div>
            </form>
            <?php

        }

        ?>
                    <p><b>Usuario: <?php echo $_SESSION["soliris_usuario"];?></b></p>
                    <p><b>Grupo: <?php echo $_SESSION["grupo"];?></b></p>
                    <p class="text-right">
                        <a class="btn btn-default pointer fa fa-history" title="Historial" id="history" onclick="viewHistory();"></a>
                        <a class="btn btn-danger pointer fa fa-power-off" title="Desloguearse" id="logoff" onclick="deleteProfile();"></a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!--    Navegador   -->
    <div class=" head_barra col-sm-1 col-xs-2" data-options="region:'west',split:true,title:'Navegador'" href="nav.php" id="nav"></div>

    <!--    Principal   -->
    <div class="col-sm-11 col-xs-10" data-options="region:'center'" id="main" style="width: 100%; height: 100% ; overflow: hidden">
        <iframe id="if_main" src="" marginheight="0" marginwidth="0" noresize frameborder="0"></iframe>
    </div>
</div>

<div id="modal_session" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Confirmación de Actividad</h4>
            </div>
            <div class="modal-body">
                <div style="text-align: center;">
                    <h1>Tu sesión expirará pronto</h1>
                    <p><b>¿Deseas continuar con la sesión activa?</b></p>
                    <button style="text-align: center" class="btn btn-lg btn-primary" onclick="window.location.reload();">Continuar</button>    
                </div>
                
            </div>
        </div>
    </div>
</div>

<?php 
//Cierro la condicion que divide entre APM y el resto
}

function selected($val){
    if (strcasecmp($_SESSION["grupo"], $val) == 0) {
        echo "checked=\"checked\"";
    }
}

echo $_SESSION["grupo"];
?>

<script type="text/javascript">
    function change_location(value){
        $.ajax({
            type: 'POST',
            data: {
                grupo: value
            },
            url: 'defa.php',
            success:function(data) {
                window.location.reload();
            }
        });
    }
</script>
</body>
</html>
