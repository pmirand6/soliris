<?php
if(isset($_GET["id"]) AND !empty($_GET["id"]) AND $_GET["id"] != 0) {
    
    require('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    if (isset($_GET["idMst"])){
        $id = $_GET["id"];
        $idMst = $_GET["idMst"];
        $queryPac = "
        SELECT
        RM.id as ID,
        (SELECT P.Nombre as Paciente FROM pacientes as P WHERE P.id = RM.nombre) as Paciente,
        RM.fecha_venta as Fecha_venta,
        RM.patologia as Patologia,
        /**RM.medico as Medico,*/
        CONCAT(m.Apellido, ', ', m.Nombre) as Medico,
        RM.dosis as Dosis,
        RM.unidades as Unidades,
        RM.institucion as Institucion,
        RM.canal as Canal,
        RM.validacion as Validacion
        FROM
        soliris_maestro as RM
        LEFT JOIN medicos m
        ON m.Id = RM.id_medico
        WHERE
        RM.id = '$idMst' ORDER BY RM.id DESC LIMIT 1;";

        $resultPac = mysqli_query($db, $queryPac);
        while ($rowPac = mysqli_fetch_assoc($resultPac)) {
            $paciente = $rowPac["Paciente"];
            $last_fecha_venta = $rowPac["Fecha_venta"];
            $last_patologia = $rowPac["Patologia"];
            $last_institucion = $rowPac["Institucion"];
            $validacion = $rowPac["Validacion"];
        };
        mysqli_free_result($resultPac);
    } else {
        $id = $_GET["id"];
        $idMst = "";
        
        $queryPac = "
        SELECT nombre_completo FROM paciente WHERE id = '$id';";
        $resultPac = mysqli_query($db, $queryPac);        
        
        $nom_pac = mysqli_fetch_array($resultPac);      
        

        while ($rowPac = mysqli_fetch_assoc($resultPac)) {
            $paciente = $rowPac["nombre_completo"];
            $last_fecha_venta = "";
            $last_patologia = "";
            $last_institucion = "";
            $validacion = "";
        };
        mysqli_free_result($resultPac);
    }

    if (isset($_GET["idMst"])) {

        $antiguedad_rec = 14;                                                               // Antigüedad MAXIMA f_receta
        $diff_rec_vs_test = 3;                                                              // Diferencia MAXIMA entre f_receta y f_test

        $diff_ultimas_ventas = 28;                                                          // Diferencia MAXIMA en días entre la última venta para mujeres con Capacidad de Gestar
        $max_unidad_nocap = 63;                                                             // Cantidad MAXIMA de Unidades para personas sin Capacidad de Gestar
        $max_unidad_concap = 21;

        $SQL = "
        SELECT
         RV.id AS id, (
        SELECT P.nombre
        FROM pacientes AS P
        WHERE P.id = RV.nombre) AS paciente,
        (
        SELECT i.id
        FROM institucion AS i
        WHERE i.nombre = RV.institucion) AS inst_id,
         (
        SELECT P.sexo
        FROM pacientes AS P
        WHERE P.id = RV.nombre) AS sexo, RV.nombre AS id_pac,
         (
        SELECT P.c_gestar
        FROM pacientes AS P
        WHERE P.id = RV.nombre) AS c_gestar,
         /*RV.medico AS medico,*/
         CONCAT(m.Apellido, ' ', m.Nombre) as medico,
         RV.dosis AS dosis,
         RV.unidades AS unidades,
         RV.fecha_venta AS fecha_venta,
         RV.consentimiento AS consentimiento,
         RV.canal AS canal,
         RV.institucion AS institucion,
         RV.apm AS apm,
         RV.autoriza_nota AS autoriza_nota,
        RV.estado as estado, RV.fecha_receta as fecha_receta, RV.fecha_test as fecha_test, RV.notas as Notas
        FROM
        soliris_maestro as RV
         LEFT JOIN medicos m
         ON m.Id = RV.id_medico
        WHERE
        RV.id = '$idMst';";
        
        
        
        $result = mysqli_query($db, $SQL);

        while ($row = mysqli_fetch_assoc($result)) {
            $id = $row["id"];
            $id_pac = $row["id_pac"];
            $paciente = $row["paciente"];
            $sexo = $row["sexo"];
            $c_gestar = $row["c_gestar"];
            $medico = $row["medico"];
            $dosis = $row["dosis"];
            $unidades = $row["unidades"];
            $fecha_venta = $row["fecha_venta"];
            $consentimiento = $row["consentimiento"];
            $canal = $row["canal"];
            $institucion = $row["institucion"];
            $inst_id = $row["inst_id"];
            $apm = $row["apm"];
            $estado = $row["estado"];
            $fecha_receta = $row["fecha_receta"];
            $fecha_test = $row["fecha_test"];
            $notas = $row["Notas"];
            $autoriza_nota = $row["autoriza_nota"];
        };
        mysqli_free_result($result);

        if (strcasecmp($estado, 'Rechazado') != 0) {
            $_ret=f_p_reglas($_GET["idMst"]);
            $_ret_inf=explode("|",$_ret);
            $validado_txt=trim($_ret_inf[0]);
            $estado=trim($_ret_inf[1]);
            $checked=trim($_ret_inf[2]);
          } else {
            $validado_txt = $autoriza_nota;
            $checked = "false";
          }

        } else {
            $paciente = "";
            $sexo = "";
            $c_gestar = "";
            $medico = "";
            $dosis = "";
            $unidades = "";
            $fecha_venta = "";
            $consentimiento = "";
            $canal = "";
            $institucion = "";
            $inst_id = "";
            $apm = "";
            $estado = "";
            $fecha_receta = "";
            $fecha_test = "";
            $notas = "";
        }

        if (empty($paciente)) {
            $paciente = $nom_pac[0];
        }

        $queryCG = "
            SELECT c_gestar FROM pacientes WHERE id = '$id';";
        $resultCG = mysqli_query($db, $queryCG);
        $CG = mysqli_fetch_array($resultCG);
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
                /* Bootstrap Validator */
                @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
                /* Custom CSS */
                @import "../resources/Sprites/file_extension.css";
                /* Custom CSS */
                @import "../resources/CSS/Develop/informes.css";
                /* Iconos de Estados */
                @import "../resources/Sprites/spriteListado.css";

                .deshabilitado{
                    background-color: #EEEEEE;
                }
                .form-horizontal .selectContainer .form-control-feedback {
                    top: 0;
                    right: -15px;
                }
            </style>
        </head>
        <body>

            <form class="form-horizontal col-sm-12 col-xs-12 form">
                <fieldset>
                    <!-- Form Name -->
                    <legend><?php  echo $paciente?></legend>
                    <?php
                        if (isset($CG[0]) AND strcasecmp($CG[0], 'SI') == 0) {
                    ?>    <p id="alerta" style="color: red;"><b>* Este Paciente tiene Capacidad de Gestar</b></p> <?php
                        }
                    ?>

                    <br>
                    <input id="id" name="id" type="text" class="form-control input-md hidden" value="<?php echo $_GET["id"];?>">
                    <input id="idMst" name="idMst" type="text" class="form-control input-md hidden" value="<?php echo $idMst?>">

                    <div class="form-group col-sm-12 col-xs-12">
                        <div class="col-sm-4 col-xs-4">
                            <!-- Fecha Venta -->
                            <div class="form-group">
                                <label class="col-sm-4 col-xs-4 control-label" for="f_venta">Fecha de Venta</label>
                                <div class="col-sm-8 col-xs-8">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                                        <?php
                                        if (isset($_GET["idMst"])) {
                                          $fecha = $last_fecha_venta;
                                      }else{
                                          $fecha = date("Y-m-d");
                                      }
                                      ?>
                                      <input id="f_venta" name="f_venta" type="text" placeholder="YYYY-MM-DD" readonly="true" class="form-control input-md date deshabilitado" value="<?php echo $fecha;?>">
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="col-sm-8 col-xs-8"></div>
                  </div>
                  <div class="form-group col-sm-12 col-xs-12">
                    <div class="col-sm-6 col-xs-6">
                        <!-- Patologia -->
                        <div class="form-group">
                            <label class="col-sm-4 col-xs-4 control-label" for="patologia">Patología </label>
                            <div class="col-sm-6 col-xs-6 selectContainer">
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="fa fa-heartbeat"></span></div>
                                    <?php
                                    $SQL = "SELECT Patologia FROM pacientes WHERE id = '" . $_GET["id"] . "';";
                                    $result = mysqli_query($db, $SQL);

                                    $str_select = '';
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        $opt_patologia = ucwords(strtolower($row["Patologia"]));
                                        $str_select .= "<input id=\"patologia\" name=\"patologia\" type=\"text\" readonly=\"true\" class=\"form-control input-md deshabilitado\" value=\"$opt_patologia\">";
                                    };
                                    echo $str_select;
                                    mysqli_free_result($result);
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                        <!-- Médico -->
                        <div class="form-group">
                            <label class="col-sm-4 col-xs-4 control-label" for="medico">Médico </label>
                            <div class="col-sm-8 col-xs-8 selectContainer">
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="fa fa-user-md"></span></div>
                                    <select id="medico" name="medico" class="form-control selectpicker">
                                        <option></option>
                                        <?php
                                        $SQL_med = "SELECT Id, Apellido, Nombre FROM medicos where estado in ('activo') order by Apellido asc ;";
                                        $result_med = mysqli_query($db, $SQL_med);
                                        $str_select_med = '';
                                        while ($row_med = mysqli_fetch_array($result_med)) {
                                            $id_med = $row_med[0];
                                            $opt_medico = strtoupper($row_med[1] . " " . $row_med[2]);
                                            if (strcasecmp($medico, $opt_medico) == 0) {
                                               $str_select_med .= "<option value=\"$id_med\" selected>$opt_medico</option>";
                                           }else{
                                               $str_select_med .= "<option value=\"$id_med\">$opt_medico</option>";
                                           }
                                       };
                                       echo $str_select_med;
                                       mysqli_free_result($result_med);
                                       ?>
                                   </select>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
               <div class="form-group col-sm-12 col-xs-12">
                <div class="col-sm-6 col-xs-6">
                    <!-- Dosis -->
                    <div class="form-group">
                        <label class="col-sm-4 col-xs-4 control-label" for="dosis">Dosis</label>
                        <div class="col-sm-8 col-xs-8 selectContainer">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="fa fa-stethoscope"></span></div>
                                <select id="dosis" name="dosis" class="form-control selectpicker">
                                  <option></option>
                                  <?php
                                  $SQL = "SELECT * FROM auxiliar WHERE estado = 'Activo' AND tipo = 'dosis' ORDER BY valor ASC;";
                                  $result = mysqli_query($db, $SQL);

                                  $str_select = '';
                                  while ($row = mysqli_fetch_assoc($result)) {
                                    $id = $row["id"];
                                    $opt_dosis = ucwords(strtolower($row["valor"]));
                                    if (strcasecmp($dosis, $opt_dosis) == 0) {
                                       $str_select .= "<option value=\"$id\" selected>$opt_dosis</option>";
                                   }else{
                                       $str_select .= "<option value=\"$id\">$opt_dosis</option>";
                                   }
                               };
                               echo $str_select;
                               mysqli_free_result($result);

                               ?>
                           </select>
                       </div>
                   </div>
               </div>
           </div>
           <div>

           </div>
           <div class="col-sm-6 col-xs-6">
            <!-- Unidades -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="unidades">Unidades</label>
                <div class="col-sm-8 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-stethoscope"></span></div>
                        <select id="unidades" name="unidades" class="form-control selectpicker">
                          <option></option>
                          <?php


                          $query_unidades = "SELECT * FROM auxiliar WHERE estado = 'Activo' AND tipo = 'unidades' ORDER BY valor ASC;";
                          $result = mysqli_query($db, $query_unidades);

                          $str_select = '';
                          while ($row = mysqli_fetch_assoc($result)) {
                            $id = $row["id"];
                            $opt_unidades = ucwords(strtolower($row["valor"]));
                            if (strcasecmp($unidades, $opt_unidades) == 0) {
                               $str_select .= "<option value=\"$id\" selected>$opt_unidades</option>";
                           }else{
                               $str_select .= "<option value=\"$id\">$opt_unidades</option>";
                           }
                       };
                       echo $str_select;
                       mysqli_free_result($result);
                       ?>
                   </select>
               </div>
           </div>
       </div>
   </div>
</div>
<div class="form-group col-sm-12 col-xs-12">
    <div class="col-sm-6 col-xs-6">
        <!-- Institución -->
        <div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label" for="institucion">Institución</label>
            <div class="col-sm-6 col-xs-6 selectContainer">
                <div class="input-group">
                    <div class="input-group-addon"><span class="fa fa-hospital-o"></span></div>
                     <input id="inst" name="institucion" type="text" autocomplete="off" placeholder="Tipee el Nombre Institución" class="form-control input-md" maxlength="100" required="" i_id="" value="<?php if(isset($last_institucion) AND !empty($last_institucion)){echo $last_institucion;}?>">
                    <!--<select id="institucion" name="institucion" class="form-control selectpicker">

                       <option></option>
                       <?php
                       $SQL = "SELECT nombre, id FROM institucion WHERE estado = 'Activo' ORDER BY nombre ASC";

                       $result = mysqli_query($db, $SQL);
                       $str_select = '';
                       while ($row = mysqli_fetch_assoc($result)) {
                        $id = $row["id"];
                        $opt_instituciones = ucwords(strtolower($row["nombre"]));

                        if (strcmp($last_institucion, $opt_instituciones) == 0){
                            $str_select .= "<option value=\"$id\" selected>$opt_instituciones</option>";
                        }else{
                            $str_select .= "<option value=\"$id\">$opt_instituciones</option>";
                        }
                    };
                    echo $str_select;
                    mysqli_free_result($result);
                                        //LIMITE DE 200 RESULTADOS
                    ?>
                </select>-->

            </div>
            <div id="result_instituciones"></div>
            <input type="" id="id_institucion" name="id_institucion" style="display: none;" value="<?php if(isset($inst_id) AND !empty($inst_id)){echo $inst_id;}?>">
        </div>
    </div>
</div>
<div class="col-sm-6 col-xs-6">
    <!-- Canal -->
    <div class="form-group">
        <label class="col-sm-4 col-xs-4 control-label" for="canal">Canal</label>
        <div class="col-sm-8 col-xs-8 selectContainer">
            <div class="input-group">
                <div class="input-group-addon"><span class="fa fa-hospital-o"></span></div>
                <select id="canal" name="canal" class="form-control selectpicker">
                  <option></option>
                  <?php
                  $SQL = "SELECT * FROM canales WHERE estado = 'Activo' ORDER BY canal ASC;";
                  $result = mysqli_query($db, $SQL);

                  $str_select = '';
                  while ($row = mysqli_fetch_assoc($result)) {
                    $id = $row["id"];
                    $opt_canales = ucwords(strtolower($row["canal"]));
                    if (strcasecmp($canal, $opt_canales) == 0) {
                       $str_select .= "<option value=\"$id\" selected>$opt_canales</option>";
                   }else{
                       $str_select .= "<option value=\"$id\">$opt_canales</option>";
                   }
               };
               echo $str_select;
               mysqli_free_result($result);
               ?>
           </select>
       </div>
   </div>
</div>
</div>
</div>
<div class="form-group col-sm-12 col-xs-12">
  <div>

      <?php

      if (isset($_GET["idMst"])) {
          if ($checked == "true" AND strcasecmp($estado, "NP")==0 ){
              echo "
              <div class=\"col-sm-12 col-xs-12\">
                  <p class=\"validation_check_success\">Registro OK </p>
              </div>";
          } else {
              echo "
              <div class=\"col-sm-12 col-xs-12\">
                  <p class=\"validation_check_alert\">Registro en estado: \"$estado\" <br> <i>Motivo: $validado_txt</i></p>
              </div>";
          };
      }
      ;?>
  </div>
  <hr>
</div>
<div class="form-group col-sm-12 col-xs-12">
    <div class="col-sm-offset-8 col-xs-offset-8 col-sm-4 col-xs-4">
        <!-- Button -->
        <?php
        if (isset($_GET["idMst"])){
            if (strcasecmp($estado, "NP") != 0){
                echo "
                <div class=\"form-group text-center\">
                    <div class=\"col-xs-12 col-sm-12\">
                        <div class=\"btn-group\" role=\"group\">
                            <button id=\"mod_venta\" name=\"mod_venta\" class=\"btn btn-warning\">
                                <span class=\"fa fa-cart-plus\"></span>
                                Modificar Operación
                            </button>
                            <button type=\"button\" class=\"btn btn-danger\" onclick=\"window.location.href = getCurrentHostname() + '/" . _NAME . "/main/panel.php'\">
                                <span class=\"fa fa-times\"></span>
                                Salir
                            </button>
                        </div>
                    </div>
                </div>
                ";
            } else {
                echo "
                <div class=\"form-group text-center\">
                    <div class=\"col-xs-12 col-sm-12\">
                        <p class=\"text-danger text-uppercase bg-danger modal_box_txt danger\"> <span class=\"fa fa-lock\"></span> Operación Cerrada. ". strcasecmp($estado, "NP")."</p>
                    </div>
                </div>
                ";
            }
        } else {
            echo "
            <div class=\"form-group text-center\">
                <div class=\"col-xs-12 col-sm-12\">
                    <div class=\"btn-group\" role=\"group\">
                        <button id=\"cargar_venta\" name=\"cargar_venta\" class=\"btn btn-success\">
                            <span class=\"fa fa-cart-plus\"></span>
                            Agregar Operación
                        </button>
                        <button type=\"button\" class=\"btn btn-danger\" onclick=\"window.location.href = getCurrentHostname() + '/" . _NAME . "/main/panel.php'\">
                            <span class=\"fa fa-times\"></span>
                            Salir
                        </button>
                    </div>
                </div>
            </div>
            ";
        }
        ?>


    </div>
</div>
</fieldset>
</form>

<?php if (!isset($_GET["idMst"])){
?>
  <div class="container">
    <h4>Últimas Ventas al paciente <?php echo $paciente?></h4>
    <caption><b>* Ventas en estado NP, Documentación y FV.</b></caption>
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
    
    }
?>


<?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/FormValidation.php";
include "../resources/Includes/DatePicker.php";
include "../resources/Includes/BootstrapCombobox.php";
include "../resources/Includes/DataTables.php";
?>
<!-- Custom JS -->
<script type="text/javascript" language="javascript" src="../resources/JS/Develop/informes_nue_pres.js"></script>
<!--<script type="text/javascript" language="javascript" src="../resources/JS/informes_nue_pres.min.js"></script>-->

</body>
</html>
<?php
mysqli_close($db);
}
?>
