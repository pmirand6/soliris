<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 
 *DC001 error al no pasar a estado NP una mujer sin capacidad de gestar
 * PGM002 se modifica la fecha de receta a 2 años de antiguedad - Linea 21
 * PGM003 se crea la variable $antiguedad_rec_c_g para los pacientes con C_gestar - Linea 22
 * PGM004 se crea la funcion para validar duplicidad de receta - Linea 215
 * DC002 se amplia el registro de log
 */

/*
VARIABLES POR POST:
oper
id_Mst
f_rec
id_Pac
 */


    require_once("../config/config.php");
 include_once $_SERVER['DOCUMENT_ROOT'] . _MAIL;
 
 if (session_status() == PHP_SESSION_NONE) {
  session_start();
  }
  
$v_error = true;
$fr_error = "";

if(isset($_POST["oper"]) AND $_POST["oper"] == "ValidaEstado" AND !empty($_POST["id_Pac"]) AND !empty($_POST["id_Mst"])){
     
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    /* Variables de Validación (Reglas de Negocio) */
      $antiguedad_rec = 730;                                                               // Antigüedad MAXIMA f_receta pacientes sin c_gestar
      $antiguedad_rec_c_g = 14; // Antiguedad de receta para pacientes con c_gestar             

      $diff_rec_vs_test = 3;                                                              // Diferencia MAXIMA entre f_receta y f_test
      $estados_control="'np','Aprobado','Postergado','Documentacion','Pendiente'";      // Solo con estos estados se realizan los controles historicos
      $diff_ultimas_ventas = 28;                                                          // Diferencia MAXIMA en días entre la última venta para mujeres con Capacidad de Gestar
      $max_unidad_nocap = 63;                                                             // Cantidad MAXIMA de Unidades para personas sin Capacidad de Gestar
      $max_unidad_concap = 21;                                                            // Cantidad MAXIMA de Unidades para mujeres con Capacidad de Gestar

    /* Seteo de variables */
      $id_Mst = mysqli_real_escape_string($db, $_POST["id_Mst"]);
      $id_Pac = mysqli_real_escape_string($db, $_POST["id_Pac"]);

    /* Datos para validar */
    $SQL = "SELECT P.sexo as sexo, P.c_gestar as c_gestar, RM.fecha_venta as fecha_venta, RM.fecha_receta as fecha_receta, RM.fecha_test as fecha_test, RM.nombre as paciente,P.Nombre as nombre FROM soliris_maestro as RM LEFT JOIN pacientes as P ON (RM.nombre = P.id) WHERE RM.id = '$id_Mst';";
    $result = mysqli_query($db, $SQL);
    while ($row = mysqli_fetch_assoc($result)) {
        $sexo = $row["sexo"];
        $c_gestar = $row["c_gestar"];
        $f_venta = $row["fecha_venta"];
        $f_receta = $row["fecha_receta"];
        $f_test = $row["fecha_test"];
        $paciente = $row["paciente"];
        $nombre = $row["nombre"];
    }
    ;
    mysqli_free_result($result);

    /* Ultima fecha de receta */
    $lst_fecha_receta = '';
    $SQL_lst_rec = "SELECT RM.fecha_receta as fecha_receta FROM soliris_maestro as RM WHERE RM.nombre = '$id_Pac' and RM.estado IN ('NP') ORDER BY RM.id DESC LIMIT 1, 1;";
    $result_lst_rec = mysqli_query($db, $SQL_lst_rec);
    while ($rowlst = mysqli_fetch_assoc($result_lst_rec)) {
        $lst_fecha_receta = $rowlst["fecha_receta"];
    }
    ;
    mysqli_free_result($result_lst_rec);

    /* Cantidad de Unidades en el mes */
    /*$SQLuni = "SELECT SUM(unidades) as CANT_uni FROM soliris_maestro as RM WHERE RM.nombre = '$id_Pac' AND DATE(RM.fecha_venta) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL $diff_ultimas_ventas DAY) AND DATE(NOW());";*/

    //SE AGREGA LA CONDICION QUE LA VENTA HAYA ESTADO EN NP
    /*$SQLuni = "SELECT SUM(unidades) as CANT_uni FROM soliris_maestro as RM WHERE RM.nombre = '$id_Pac' AND DATE(RM.fecha_venta) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL $diff_ultimas_ventas DAY) AND DATE(NOW())and RM.estado IN('NP', 'FV');";*/

    //SE
    $SQLuni = "SELECT FU_VAL_UNI($id_Pac, $diff_ultimas_ventas, '$id_Mst')";

    $resultuni = mysqli_query($db, $SQLuni);
    while ($rowuni = mysqli_fetch_array($resultuni)) {
        $CANT_uni_periodo = $rowuni[0];
    }
    ;
    mysqli_free_result($resultuni);

    $checked = "false";                                                                                             // Validación "Checked"
    $validado_txt = "";                                                                                             // Resultado validación
    /*$estado = "Falla en el Sistema";                                                                                // Estado*/

    $estado="FV";                                                   //Por defecto siempre a FarmacoVigilancia
    $validacion = "";                                                                                               // Validación completada con Éxito
    switch ($sexo) {
        case "M":
            if ($CANT_uni_periodo <= $max_unidad_nocap) {                                                           // Cantidad de Ventas dentro del periodo $CANT_uni_periodo
                if (!empty($f_receta) and strcmp($f_receta, '0000-00-00') !== 0 and strcmp($lst_fecha_receta, $f_receta) !== 0 and $fr_error == 0) { // Que tenga fecha de receta y no haya sido usada anteriormente
                    if ( dateDifference($f_venta, $f_receta) <= $antiguedad_rec ) {                                 // Fecha de Receta menor a la antiguedad MAXIMA
                        $checked = "true";
                        $estado = "NP";
                        $validacion = "N/";
                    } else {
                        $validado_txt = "La diferencia de días entre la Fecha de Venta y Fecha de Receta (" . dateDifference($f_venta, $f_receta) . " días) es mayor a lo permitido ($antiguedad_rec días Máximo)";
                        $estado = "Documentacion";
                    }
                } else {
                    $validado_txt = "No posee Fecha de Receta ($f_receta) o la misma ya fue registrada anteriormente";
                    $estado = "Documentacion";}
            } else { $validado_txt = "Cantidad de Unidades ($CANT_uni_periodo) mayores al máximo ($max_unidad_nocap) permitido en un periodo de $diff_ultimas_ventas días";
                $estado = "Postergado";}
            ;
        break;
        case "F":
            if (strcasecmp($c_gestar, "SI") !== 0){                                                                 // Valido que no tenga capacidad de gestar
                if ($CANT_uni_periodo <= $max_unidad_nocap){                                                        // Cantidad de Ventas dentro del periodo $CANT_uni_periodo
                    if (!empty($f_receta) and strcmp($f_receta, '0000-00-00') !== 0 and strcmp($lst_fecha_receta, $f_receta) !== 0 and $fr_error == 0) { // Que tenga fecha de receta
                        if ( dateDifference($f_venta, $f_receta) <= $antiguedad_rec ){                              // Fecha de Receta menor a la antiguedad MAXIMA
                            $checked = "true";
                            $estado = "NP";
                            $validacion = "N/";
                        } else { $validado_txt = "Fecha de Receta con antigüedad (" . dateDifference($f_venta, $f_receta) . " días) mayor  a lo permitido ($antiguedad_rec días Máximo)";
                            $estado = "Documentacion";}
                    } else { $validado_txt = "No posee Fecha de Receta o la misma ya fue registrada anteriormente";
                        $estado = "Documentacion";}
                } else { $validado_txt = "Cantidad de Unidades ($CANT_uni_periodo) mayores al máximo ($max_unidad_nocap) permitido en un periodo de $diff_ultimas_ventas días";
                    $estado = "Postergado";}

            } else {        // Con Capacidad de Gestar
                if ($CANT_uni_periodo <= $max_unidad_concap){                                                       // Cantidad de Ventas dentro del periodo $CANT_uni_periodo
                    if (!empty($f_receta) and strcmp($f_receta, '0000-00-00') !== 0 and strcmp($lst_fecha_receta, $f_receta) !== 0 and $fr_error == 0) { // Que tenga fecha de receta // * PGM - VALIDACION MENOR DE 14 DIAS
                        if ( dateDifference($f_venta, $f_receta) <= $antiguedad_rec_c_g ) {                              // Fecha de Receta menor a la antiguedad MAXIMA
                            if (!empty($f_test) AND dateDifference($f_receta, $f_test) <= $diff_rec_vs_test) {     // Diferencia entre Fecha Receta y Test menor a $diff_rec_vs_test
                                $checked = "true";
                                $estado = "FV";     //dc001 se cambia estado a FV
                                $validacion = "";   
                            } else {
                                if (empty($f_test)) {
                                    $validado_txt = "El campo fecha test esta vacío.";
                                } else {
                                    $validado_txt = "La diferencia de fechas entre la Receta y el Test de Embarazo (" . dateDifference($f_receta, $f_test) . " días) es  mayor  a lo permitido ($diff_rec_vs_test días Máximo)";
                                }
                                $estado = "Documentacion";
                            }
                        } else { $validado_txt = "Fecha de Receta con antigüedad (" . dateDifference($f_venta, $f_receta) . " días) mayor  a lo permitido ($antiguedad_rec_c_g días Máximo)";
                            $estado = "Documentacion";}
                    } else { $validado_txt = "No posee Fecha de Receta o la misma ya fue registrada anteriormente";
                        $estado = "Documentacion";}
                } else { $validado_txt = "Cantidad de Unidades ($CANT_uni_periodo) mayores al máximo ($max_unidad_concap) permitido en un periodo de $diff_ultimas_ventas días";
                    $estado = "Postergado";}
            }
            ;
        break;
    }

    $SQLval = "UPDATE soliris_maestro SET estado = '$estado', validacion = '$validacion', notas='$validado_txt' WHERE id = '$id_Mst';";
      /* Realizo la consulta */
      //if (isset($SQLval) AND $estado != "" AND $id_Mst != ""){ //DC002
		    if (isset($SQLval)){ //DC002
          // echo $SQL;
          $response = MySQL_sendFunctionAudit($SQLval, "informe_doc_nue_pres_form.php", "0");
      
    // echo "Resultado Validación: $validado_txt | Estado:  $estado | Validación Completada: $validacion";

    if ($checked == "true"){
        if ($sexo == "M"){
          echo "
            <div class=\"col-sm-12 col-xs-12\">
                <p class=\"validation_check_success\" onclick=\"window.location.href = getCurrentHostname() +'/" . _NAME . "/main/panel.php'\">Registro OK - #$id_Mst <br> <small>Presione aquí para cerrar.</small></p>
            </div>";
        } else {
          if (strcasecmp($c_gestar, "SI") !== 0){
            echo "
              <div class=\"col-sm-12 col-xs-12\">
                  <p class=\"validation_check_success\" onclick=\"window.location.href = getCurrentHostname() +'/" . _NAME . "/main/panel.php'\">Registro OK - $id_Mst <br> <small>Presione aquí para cerrar.</small></p>
              </div>";
          }else {
            echo "
              <div class=\"col-sm-12 col-xs-12\">
                  <p class=\"validation_check_success\" onclick=\"window.location.href = getCurrentHostname() + '/" . _NAME . "/main/panel.php'\">Registro OK - Se envía a FV <br> <small>Presione aquí para cerrar.</small></p>
              </div>";
            }
        }
    } else {
        echo "
        <div class=\"col-sm-12 col-xs-12\">
            <p class=\"validation_check_alert\" onclick=\"window.location.href = getCurrentHostname() + '/" . _NAME . "/main/panel.php'\">Registro en estado: \"$estado\" <br><br> <i><strong>Motivo: </strong> $validado_txt</i> <br> <small>Presione aquí para cerrar.</small></p>
        </div>";
        sendMailPM($estado, $nombre, '', $validado_txt);
      }
        ;
      
      }
    
    /*si la venta no quedo en estado NP envio la notificacion*/
    if ($estado=="FV"){
                                
      sendMailPM('Pendiente', $nombre, '', '');
    }
    
      $v_error = false;
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "DeleteRegistro" AND !empty($_POST["id_Mst"])){

    
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
  /* Seteo de variables */
  $id_Mst = mysqli_real_escape_string($db, $_POST["id_Mst"]);

  $SQLval = "UPDATE soliris_maestro SET estado = 'Cancelado' WHERE id = '$id_Mst';";
  /* Realizo la consulta */
  if (isset($SQLval) AND $SQLval != ""){
      // echo $SQL;
      $response = MySQL_sendFunctionAudit($SQLval, "informe_doc_nue_pres_form.php", "0");
      echo "
        <div class=\"col-sm-12 col-xs-12\">
            <p class=\"validation_check_danger\" onclick=\"window.location.href = getCurrentHostname() + '/" . _NAME . "'/main/panel.php'\"> Registro Cancelado - #$id_Mst ! <br/><em>Presione aquí para cerrar.</em></p>
        </div>";
    }

  $v_error = false;
}

if (isset($_POST["oper"]) AND strcasecmp($_POST["oper"], 'val_fec_rec') == 0) {
    
    require_once("../config/config.php");
  include $_SERVER['DOCUMENT_ROOT'] . _BD;
  include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

      $fec_rec = $_POST["f_rec"];
      $id_Mst = $_POST["id_Mst"];
      $id_Pac = $_POST["id_Pac"];

  $query = "SELECT IFNULL ((SELECT 
              im.fecha_receta
            FROM 
              soliris_maestro im 
            WHERE 
              im.id <> $id_Mst
            AND 
              im.nombre = $id_Pac 
            AND 
              im.fecha_receta = '$fec_rec' 
            AND 
              im.estado IN('FV', 'Documentacion', 'NP')
            LIMIT 1), 0)";

  $result = mysqli_query($db, $query);
  $row = mysqli_fetch_array($result, MYSQLI_NUM);
  
  if (strcasecmp($row[0], '0') !== 0) {
        $fr_error = 1;
    echo "<b style=\"color: red;\">" . "* La fecha de receta fue informada anteriormente" . "</b>";
    } else {
        $fr_error = 0;
  }
$v_error = false;

}

if ($v_error){
    echo "ERROR: La operación ingresada no es válida $response";
}
;
