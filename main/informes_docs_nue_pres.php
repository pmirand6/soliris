<?php

error_reporting(E_ALL | E_STRICT);


require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

if(isset($_GET["id"]) AND !empty($_GET["id"]) AND $_GET["id"] != 0) {

    $id = $_GET["id"];
    
    $document="
    SELECT 
    tipo, documento  
    FROM 
    soliris_documentacion
    WHERE
    id_maestro='$id'
    ";
    
    $test="";
    $receta="";
    $otro="";
    
    $docues = mysqli_query($db, $document);
    while ($rowuni = mysqli_fetch_assoc($docues)) {
        if ($rowuni["tipo"]=='Test Embarazo'){$test = "Test Embarazo;".$rowuni["documento"];}
        if ($rowuni["tipo"]=='Receta'){$receta = "Receta;".$rowuni["documento"];}
        if ($rowuni["tipo"]=='Otro'){$otro = "Otro;".$rowuni["documento"];}
    }
    ;

    $query = "
    SELECT
    (SELECT P.Nombre FROM pacientes as P WHERE P.id = RM.nombre) as Paciente,
    (SELECT P.c_gestar FROM pacientes as P WHERE P.id = RM.nombre) as c_gestar,
    RM.fecha_receta as f_rec,
    RM.fecha_test as f_test,
    RM.nombre as id_Pac
    FROM
    soliris_maestro as RM
    WHERE
    RM.id = '$id'
    ORDER BY
    id DESC
    LIMIT 1;";

    $result = mysqli_query($db, $query);

    while ($row = mysqli_fetch_assoc($result)) {
        $paciente = $row["Paciente"];
        $c_gestar = $row["c_gestar"];
        $id_Pac = $row["id_Pac"];
        $f_rec = $row["f_rec"];
        $f_test = $row["f_test"];
    }
    ;

    mysqli_free_result($result);
    mysqli_close($db);

    ?>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <style type="text/css">
            /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
            /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
            /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
            /* Include Bootstrap Datepicker */
            @import "../resources/Bootstrap-DatePicker/css/datepicker.css";
            /* Bootstrap Validator */
            @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
            /* File Upload */
            @import "../resources/JQuery-FileUpload/CSS/uploadfile.css";
            /* Custom CSS */
            @import "../resources/CSS/Develop/informes.css";
            /* Iconos de Estados */
            @import "../resources/Sprites/spriteListado.css";

            /**.hover_img a { position:relative; }
            .hover_img a span { position:absolute; display:none; z-index:99; }
            .hover_img a:hover span { display:block; }**/
            #imgDoc{
                max-width: 400%;
                /*max-height: 150%;*/
            }

        </style>
    </style>
</head>
<body>


    <form class="form-horizontal col-sm-12 col-xs-12 form" autocomplete="off">
        <fieldset>
            <!-- Form Name -->
            <legend><?php  echo $paciente ?></legend>
            <input id="id" name="id" type="text" class="form-control input-md hidden" value="<?php echo $id;?>">
            <input id="id_Pac" name="id_Pac" type="text" class="form-control input-md hidden" value="<?php echo $id_Pac?>">
            <div class="form-group col-sm-12 col-xs-12">
                <div class="col-sm-4 col-xs-4">
                    <!-- Fecha Receta -->
                    <div class="form-group">
                        <label class="col-sm-4 col-xs-4 control-label" for="f_rec">Fecha de Receta *</label>
                        <div class="col-sm-8 col-xs-8">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                                <input id="f_rec" name="f_rec" type="text" placeholder="YYYY-MM-DD" class="form-control input-md date" value="<?php  echo $f_rec; ?>">
                                
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-4">
                    <!-- Fecha Test -->
                    <div class="form-group">
                        <label class="col-sm-4 col-xs-4 control-label" for="f_test">Fecha de Test
                            <?php if ($c_gestar === 'SI') {
        echo " * ";
    }
    ?>
                        </label>
                        <div class="col-sm-8 col-xs-8">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                                <input id="f_test" name="f_test" type="text" placeholder="YYYY-MM-DD" class="form-control input-md date" value="<?php echo $f_test; ?>"<?php if (strcasecmp($c_gestar, 'NO') == 0) {
        echo "disabled";
    }
    ?>>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <!-- Fecha Otro -->
                    <div class="form-group">
                        <label class="col-sm-4 col-xs-4 control-label" for="f_otro">Otro</label>
                        <div class="col-sm-8 col-xs-8">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                                <input id="f_otro" name="f_otro" type="text" placeholder="YYYY-MM-DD" class="form-control input-md date">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-12 col-xs-12 well">
                <div class="container">
                    <div class="row">
                        <div class="" id="fDocs"></div>
                    </div>
                <div class="row">
                <fieldset>
                    <legend>Documentación Respaldatoria:</legend>
                    <div class="col-sm-12 col-xs-12">
                        <!-- File Receta -->
                        <div class="form-group" id="div_rec" style="display: none;">
                            <label class="col-sm-4 col-xs-4 control-label" for="receta">Receta: *</label>
                            <div class="col-sm-8 col-xs-8">
                                <div id="receta">Subir</div>
                                <button id="sub_rec" class="btn btn-success save">Guardar</button>
                                <button id="can_rec" class="btn btn-danger change">Cambiar Imagen</button>
                                <input type="hidden" id="receta_val">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xs-12">
                        <!-- File Test de Embarazo -->
                        <div class="form-group" id="div_test" style="display: none;">
                            <label class="col-sm-4 col-xs-4 control-label" for="t_embarazo">Test de Embarazo: </label>
                            <div class="col-sm-8 col-xs-8">
                                <div id="t_embarazo">Subir</div>
                                <button id="sub_test" class="btn btn-success save">Guardar</button>
                                <button id="can_test" class="btn btn-danger change">Cambiar Imagen</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xs-12">
                        <!-- File Otro -->
                        <div class="form-group" id="div_otro" style="display: none;">
                            <label class="col-sm-4 col-xs-4 control-label" for="otro">Otro: </label>
                            <div class="col-sm-8 col-xs-8">
                                <div id="otro">Subir</div>
                                <button id="sub_otro" class="btn btn-success save">Guardar</button>
                                <button id="can_otro" class="btn btn-danger change">Cambiar Imagen</button>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <p><b>* Dato Obligatorio </b></p>
            </div>
                </div>
            </div>

            <div class="form-group col-sm-12 col-xs-12">
                <hr>
                <div><p id="alert_fecha"></p></div>
            </div>
            <div class="form-group col-sm-12 col-xs-12">
              <div class="col-sm-6 col-xs-6"></div>
              <div class="form-group text-center">
                <div id="fin_venta" name="fin_venta" class="btn btn-success">
                    <span class="fa fa-save"></span>
                    Finalizar Operación / Derivar a FV
                </div>
                <div id="del_ops" name="del_ops" class="btn btn-danger">
                    <span class="fa fa-eraser"></span>
                    Eliminar Operación
                </div>
            </div>
        </div>
        <div class="form-group col-sm-12 col-xs-12">
            <div class="popUP">
                <div id="response"></div>
            </div>
        </div>
    </fieldset>
</form>

<div id="tbl_ventas" class="container">
    <legend>Registro Venta </legend>
    <caption><b>Verificar Documentación de Venta</b></caption>
    <br><br>
    <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered TBLrows" id="UltVenTB" style="font-size: 13px; width:100%">
      <thead>
        <tr>
          <th>ID</th>
          <th>F.Venta</th>
          <th>F.Receta</th>
          <th>F.Cons</th>
          <th>Dosis</th>
          <th>Uni.</th>
          <th>Médico</th>
          <th>Institución</th>
          <th>Canal</th>
          <th>APM</th>
          <th>Estado</th>
          <th>Documentación</th>
      </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</div>


<?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/FormValidation.php";
include "../resources/Includes/DatePicker.php";
include "../resources/Includes/BootstrapCombobox.php";
include "../resources/Includes/DataTables.php";
?>

<!-- JQuery FileUpload-->
<script type="text/javascript" src="../resources/JQuery-FileUpload/JS/jquery.uploadfile.min.js"></script>


<!-- Custom JS -->
<script type="text/javascript" language="javascript" src="../resources/JS/Develop/informes_docs_nue_pres.js"></script> 
<!--        <script type="text/javascript" language="javascript" src="../resources/JS/informes_docs_nue_pres.min.js"></script>-->
<script type="text/javascript">
    var c_gestar_val = "<?php echo $c_gestar?>";
</script>

</body>
</html>
<?php
}
?>
