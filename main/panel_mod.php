<?php

require('../config/config.php');
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
include_once $_SERVER['DOCUMENT_ROOT'] . _SG;

?>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<?php
if (isset($_GET["id"])) {

    $antiguedad_rec_s_cg = 730;

    $antiguedad_rec = 14;                                                               // Antigüedad MAXIMA f_receta
    $diff_rec_vs_test = 3;                                                              // Diferencia MAXIMA entre f_receta y f_test

    $diff_ultimas_ventas = 28;                                                          // Diferencia MAXIMA en días entre la última venta para mujeres con Capacidad de Gestar
    $max_unidad_nocap = 63;                                                             // Cantidad MAXIMA de Unidades para personas sin Capacidad de Gestar
    $max_unidad_concap = 21;
    $lst_fecha_receta="";

    $id = $_GET["id"];
    // $SQL = "SELECT * FROM auxiliar WHERE tipo = 'canal' AND id = '$id'";
    $SQL = "
    SELECT
        RV.id as id,
        (SELECT P.nombre FROM pacientes as P WHERE P.id = RV.nombre) as paciente,
        (SELECT P.sexo FROM pacientes as P WHERE P.id = RV.nombre) as sexo, 
        RV.nombre as id_pac,
    (SELECT P.c_gestar FROM pacientes as P WHERE P.id = RV.nombre) as c_gestar,
        RV.medico as medico,
        RV.dosis as dosis,
        RV.unidades as unidades, 
        RV.fecha_venta as fecha_venta,
        RV.consentimiento as consentimiento, 
        RV.canal as canal, 
        RV.institucion as institucion, 
        RV.apm as apm,
        RV.estado as estado, 
        RV.fecha_receta as fecha_receta, 
        RV.fecha_test as fecha_test, 
        RV.notas as Notas, 
        RV.autoriza_nota as notaFv
    FROM
    soliris_maestro as RV
    WHERE
    RV.id = '$id';";
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
        $apm = $row["apm"];
        $estado = $row["estado"];
        $fecha_receta = $row["fecha_receta"];
        $fecha_test = $row["fecha_test"];
        $notas = $row["Notas"];
        $notaFv = $row["notaFv"];

    };
    mysqli_free_result($result);



    /* Datos para validar */
    $SQLs = "SELECT P.sexo as sexo, P.c_gestar as c_gestar, RM.fecha_venta as fecha_venta, RM.fecha_receta as fecha_receta, RM.fecha_test as fecha_test FROM soliris_maestro as RM LEFT JOIN pacientes as P ON (RM.nombre = P.id) WHERE RM.id = '$id';";
    $results = mysqli_query($db, $SQLs);
    while ($rows = mysqli_fetch_assoc($results)) {
        $sexo = $rows["sexo"];
        $c_gestar = $rows["c_gestar"];
        $f_venta = $rows["fecha_venta"];
        $f_receta = $rows["fecha_receta"];
        $f_test = $rows["fecha_test"];
    };
    mysqli_free_result($results);

    /* Ultima fecha de receta */
    $SQL_lst_rec = "SELECT RM.fecha_receta as fecha_receta FROM soliris_maestro as RM WHERE RM.nombre = '$id_pac' ORDER BY RM.id DESC LIMIT 1, 1;";
    $result_lst_rec = mysqli_query($db, $SQL_lst_rec);
    while ($rowlst = mysqli_fetch_assoc($result_lst_rec)) {
        $lst_fecha_receta = $rowlst["fecha_receta"];
    };
    mysqli_free_result($result_lst_rec);

    /* Cantidad de Unidades en el mes */
    /*$SQLuni = "SELECT SUM(unidades) as CANT_uni FROM soliris_maestro as RM WHERE RM.nombre = '$id_pac' AND DATE(RM.fecha_venta) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL $diff_ultimas_ventas DAY) AND DATE(NOW()) AND RM.estado IN ('NP', 'FV')";*/

    /* SE REALIZA EL REEMPLAZO POR LA FUNCION QUE VALIDAD LA CANTIDAD DE UNIDADES*/

    $SQLuni = "SELECT FU_VAL_UNI($id_pac, $diff_ultimas_ventas, $id)";
    $resultuni = mysqli_query($db, $SQLuni);
    while ($rowuni = mysqli_fetch_array($resultuni)) {
        $CANT_uni_periodo = $rowuni[0];
    };
    mysqli_free_result($resultuni);

    mysqli_close($db);
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
    $puntos_entrega = "";
    $estado = "";
};


$validado_txt = "";
$checked = "false";

/*switch ($sexo) {
    case "M":
        if ($CANT_uni_periodo <= $max_unidad_nocap) {                                 // Cantidad de Ventas dentro del periodo $CANT_uni_periodo
            if ( !empty($f_receta) AND strcmp($f_receta, '0000-00-00') !== 0 AND strcmp($lst_fecha_receta, $f_receta) !== 0) {      // Que tenga fecha de receta y no haya sido usada anteriormente
                if ( dateDifference($f_venta, $f_receta) <= $antiguedad_rec_s_cg ) {       // Fecha de Receta menor a la antiguedad MAXIMA
                    $checked = "true";
                    $validacion = "N/";
                } else { $validado_txt = "Fecha de Receta con antigüedad (" . dateDifference($f_venta, $f_receta) . " días) mayor  a lo permitido ($antiguedad_rec días Máximo)"; $estado = "Documentacion";}
            } else { $validado_txt = "No posee Fecha de Receta ($f_receta) o la misma ya fue registrada anteriormente"; $estado = "Documentacion"; }
        } else { $validado_txt = "Cantidad de Unidades ($CANT_uni_periodo) mayores al máximo ($max_unidad_nocap) permitido en un periodo de $diff_ultimas_ventas días"; $estado = "Postergado"; };
        break;
        case "F":
        if (strcasecmp($c_gestar, "SI") !== 0){                                     // Valido que no tenga capacidad de gestar
            if ($CANT_uni_periodo <= $max_unidad_nocap){                                 // Cantidad de Ventas dentro del periodo $CANT_uni_periodo
                if (!empty($f_receta) AND strcmp($f_receta, '0000-00-00') !== 0 AND strcmp($lst_fecha_receta, $f_receta) !== 0){                                                 // Que tenga fecha de receta
                    if ( dateDifference($f_venta, $f_receta) <= $antiguedad_rec_s_cg ){       // Fecha de Receta menor a la antiguedad MAXIMA
                        $checked = "true";
                        //$estado = "FV"; /* Estado OK en el panel mod
                        $validacion = "";
                    } else { $validado_txt = "Fecha de Receta con antigüedad (" . dateDifference($f_venta, $f_receta) . " días) mayor  a lo permitido ($antiguedad_rec días Máximo)"; $estado = "Documentacion";}
                } else { $validado_txt = "No posee Fecha de Receta ($f_receta) o la misma ya fue registrada anteriormente"; $estado = "Documentacion"; }
            } else { $validado_txt = "Cantidad de Unidades ($CANT_uni_periodo) mayores al máximo ($max_unidad_nocap) permitido en un periodo de $diff_ultimas_ventas días"; $estado = "Postergado";}

        } else {        // Con Capacidad de Gestar
            if ($CANT_uni_periodo <= $max_unidad_concap){
                // Cantidad de Ventas dentro del periodo $CANT_uni_periodo
                if (!empty($f_receta) AND strcmp($f_receta, '0000-00-00') !== 0 AND strcmp($lst_fecha_receta, $f_receta) !== 0){                                                                         // Que tenga fecha de receta
                    if ( dateDifference($f_venta, $f_receta) <= $antiguedad_rec ){                              // Fecha de Receta menor a la antiguedad MAXIMA
                        if ( !empty($f_test) AND dateDifference($f_receta, $f_test) <= $diff_rec_vs_test ){     // Diferencia entre Fecha Receta y Test menor a $diff_rec_vs_test
                            $checked = "true";
                            $estado = "Pendiente";
                            $validacion = "";
                        } else { $validado_txt = "La diferencia de fechas entre la Receta y el Test de Embarazo (" . dateDifference($f_receta, $f_test) . " días) es  mayor  a lo permitido ($diff_rec_vs_test días Máximo)"; $estado = "Documentacion";}
                    } else { $validado_txt = "Fecha de Receta con antigüedad (" . dateDifference($f_venta, $f_receta) . " días) mayor  a lo permitido ($antiguedad_rec días Máximo)"; $estado = "Documentacion";}
                } else { $validado_txt = "No posee Fecha de Receta"; $estado = "Documentacion";}
            } else { $validado_txt = "Cantidad de Unidades ($CANT_uni_periodo) mayores al máximo ($max_unidad_concap) permitido en un periodo de $diff_ultimas_ventas días"; $estado = "Postergado";}
        };
        break;
    }*/

//		$_ret=f_p_reglas($_GET["id"]);
//		$_ret_inf=explode("|",$_ret);
//		$validado_txt=trim($_ret_inf[0]);
//		$estado=trim($_ret_inf[1]);
//		$checked=trim($_ret_inf[2]);

    ?>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

        <title>Editor de Datos</title>
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
            /* Custom CSS */
            @import "../resources/CSS/Develop/panel_mod.css";

            .form-horizontal .selectContainer .form-control-feedback {
                top: 0;
                right: -15px;
            }
            .row-bottom-bordered{
                border-bottom: thin solid #DCDCDC;
                margin-top: 2px;
            }
        </style>
    </head>
    <body>
        <form class="form">
            <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
                <!-- Form Name -->
                <legend>Administrador de Registros</legend>

                <input class="hidden" type="text" name="id" id="id" value="<?php echo $_GET["id"];?>">
                <input class="hidden" type="text" name="acc" id="acc" value="<?php echo $_GET["acc"];?>">
                <input class="hidden" type="text" name="paciente" id="paciente" value="<?php echo $paciente;?>">

                <div class="well">
                    <div class="row text-center row-bottom-bordered">
                        <div class="col-sm-2 col-xs-2">
                            <b>Paciente:</b>
                        </div>
                        <div class="col-sm-4 col-xs-4">
                            <i><?php echo $paciente;?></i>
                        </div>
                        <div class="col-sm-2 col-xs-2">
                            <b>Médico:</b>
                        </div>
                        <div class="col-sm-4 col-xs-4">
                            <i><?php echo $medico;?></i>
                        </div>
                    </div>
                    <div class="row text-center row-bottom-bordered">

                        <div class="col-sm-2 col-xs-2">
                            <b>Dosis:</b>
                        </div>
                        <div class="col-sm-4 col-xs-4">
                            <i><?php echo $dosis;?></i>
                        </div>
                        <div class="col-sm-2 col-xs-2">
                            <b>Unidades:</b>
                        </div>
                        <div class="col-sm-4 col-xs-4">
                            <i><?php echo $unidades;?></i>
                        </div>
                    </div>
                    <div class="row text-center row-bottom-bordered">
                      <div class="col-sm-2 col-xs-2">
                        <b>Capacidad de Gestar:</b>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                      <i><?php echo $c_gestar;?></i>
                  </div>
              </div>
              <div class="row text-center row-bottom-bordered">
                <div class="col-sm-2 col-xs-2">
                    <b>Fecha de Venta:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $fecha_venta;?></i>
                </div>
                <div class="col-sm-2 col-xs-2">
                    <b>Fecha de Consentimiento:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $consentimiento;?></i>
                </div>
            </div>
            <div class="row text-center row-bottom-bordered">
                <div class="col-sm-2 col-xs-2">
                    <b>Canal:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $canal;?></i>
                </div>
                <div class="col-sm-2 col-xs-2">
                    <b>Institución:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $institucion;?></i>
                </div>
            </div>
            <div class="row text-center row-bottom-bordered">
                <div class="col-sm-2 col-xs-2">
                    <b>APM:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $apm;?></i>
                </div>
                <div class="col-sm-2 col-xs-2">
                    <b>Estado:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $estado;?></i>
                </div>
            </div>
            <div class="row text-center row-bottom-bordered">
                <div class="col-sm-2 col-xs-2">
                    <b>Fecha de Receta:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $fecha_receta;?></i>
                </div>
                <div class="col-sm-2 col-xs-2">
                    <b>Fecha de Test Embarazo:</b>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <i><?php echo $fecha_test;?></i>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-sm-2 col-xs-2">
                    <b>Notas:</b>
                </div>
                <div class="col-sm-8 col-xs-8">
                    <i><?php echo $notas;?></i>
                </div>
            </div>
        </div>
        <div class="row col-sm-12 col-xs-12">
            <div>

                <?php
                if ($checked == "true"){
                    echo $estado;
                    echo "
                    <div class=\"col-sm-12 col-xs-12\">
                        <p class=\"validation_check_success\" onclick=\"window.location.href = getCurrentHostname() + '/" . _NAME . "/main/panel.php'\">Registro OK - #$id</p>
                    </div>";
                } else {
                    if ((strcasecmp($estado, 'Rechazado') == 0)) {
                        $validado_txt = $notaFv;
                    } else {
                        $validado_txt = $notas;
                    }
                    echo "
                    <div class=\"col-sm-12 col-xs-12\">
                        <p class=\"validation_check_alert\" onclick=\"window.location.href = getCurrentHostname() + '/" . _NAME . "/main/panel.php'\">Registro en estado: \"$estado\" <br> <i>Motivo: $validado_txt</i></p>
                    </div>";
                };
                ;?>
            </div>
        </div>
        <br>
        <br>
        <br>
        <hr>
        <?php
        if ($_GET["acc"] == "nu"){
            ?>
            <!-- Comentarios -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="comentario">Comentarios</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-sticky-note-o"></span></div>
                        <input id="comentario" name="comentario" type="text" placeholder="Comentarios..." class="form-control input-md">
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
                            <option value="" selected>Seleccione un estado</option>
                            <option value="NP" <?php echo f_p_selected('Autorizado', $estado) ?>>Autorizado</option>
                            <option value="Rechazado" <?php echo f_p_selected('Rechazado', $estado) ?>>Rechazado</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-xs-12 col-sm-12">
                    <div id="confirmar_venta" name="confirmar_venta" class="btn btn-success boton">
                        <span class="fa fa-check-square"></span>
                        Procesar Operación
                    </div>
                </div>
            </div>
            <?php
        } else {
            ?>
            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-xs-12 col-sm-12">
                    <div id="bot_guardar" name="bot_guardar" class="btn btn-success boton">
                        <span class="fa fa-save"></span>
                        Guardar
                    </div>
                </div>
            </div>
            <?php
        }
        ?>
    </fieldset>
</form>
<?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/FormValidation.php";
?>
<!-- Custom JS -->
<script src="../resources/JS/Develop/panel_mod.js"></script>
<!--      <script src="../resources/JS/panel_mod.min.js"></script>-->
</body>
</html>
