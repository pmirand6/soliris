<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 04:25 PM
 */



//error_reporting(E_ALL | E_STRICT);

function f_l_edad_pac($e_val, $s_pac){
    include dirname(__FILE__) . '/db.php';

    $q_e_pac = "SELECT `FU_VAL_PAC_EDAD`($e_val, '$s_pac')";

    $r_q_pac = mysqli_query($db, $q_e_pac);
    $row_res = mysqli_fetch_array($r_q_pac);

    $row_notas = explode(',',$row_res[0]);

    if (!empty($row_res)) {
        $row_notas = explode(',',$row_res[0]);
    } else {
        $row_notas = "";
    }

    return json_encode(
        array(
            "message1" => $row_notas[0], 
            "message2" => strip_tags($row_notas[0]))
    ); 

}

function get_month(){

    $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
    return $meses[date('n')-1];
}

function fl_act($campo, $valor){
    include dirname(__FILE__) . '/db.php';

    $query_med = "select count(id) from soliris_maestro where $campo = '$valor'";
    $result_med = mysqli_query($db, $query_med);
    
    while ($row_med = mysqli_fetch_array($result_med)) {

        if ($row_med[0] > 0) {
            $fl_act = "<b>". $valor . "</b>";
        } else {
            $fl_act = $valor;
        }
    }

    return $fl_act;
    mysqli_free_result($result_med);
    mysqli_close($db);
}

function fl_tipo_rep($valor){

    if (strcasecmp($valor, 'RI') == 0) {
        $fl_tipo = "<span class='tipo_ri'>RI</span>";       
    } elseif (strcasecmp($valor, 'FU') == 0){
        $fl_tipo="<span class='tipo_fu'>FU</span>";
    }

    return $fl_tipo;
}


function disable_campo($value, $id){
    #Disable de Campos cargados, aplicado en medico.php - PGM
    if (!empty($id)) {
        if ((strcasecmp($value, 'FV') != 0) AND (strcasecmp($value, 'ADMIN') != 0)) {
            echo "disabled";
        }
    }
}


function f_p_selected($value, $selectValue){
    if (strcasecmp($value, $selectValue) == 0){
        return "selected";
    }
}
function f_p_checked($value, $selectValue){
    if (strcasecmp($value, $selectValue) == 0){
       return "checked";
   }
}
function f_p_date($value){
    if (strcasecmp($value, '0000-00-00') != 0){
        return $value;
    }
}

function include_adjuntos($idPac, $numero, $referencia, $tipo, $fecha, $filepath){
    $SQL = "SELECT FU_ADJ_FILES('$idPac', '$numero', '$referencia', '$tipo', '$fecha', '$filepath') as response";
    MySQL_sendFunctionAudit($SQL, "Documentación: $tipo "-" $referencia _ Pac/Med: $idPac", 0);
}

function SQL_auditoria($origen, $registro){

    include dirname(__FILE__) . '/db.php';

    $v_origen = mysqli_real_escape_string($db, $origen);
    $v_registro = mysqli_real_escape_string($db, $registro);

    if (isset($_SESSION["soliris_usuario"]) AND $_SESSION["soliris_usuario"] != ""){
        $usuario = $_SESSION["soliris_usuario"];
        MySQL_sendQuery("INSERT INTO soliris_log SET usuario='$usuario', fecha = now(), accion = '$v_origen', registro = '$v_registro';");
    } else {
        MySQL_sendQuery("INSERT INTO soliris_log SET usuario='" . $_SERVER['REMOTE_ADDR'] . "', fecha = now(), accion = '$v_origen', registro = '$v_registro';");
    }
}

function MySQL_sendQuery($query){
    if (isset($query) AND $query != "") {
            
        include dirname(__FILE__) . '/db.php';

        $SQL = $query;
        $response = mysqli_query($db, $SQL);
        if (mysqli_error($db)) {
            return "ERROR: " . mysqli_error($db);
        } else {
            return "OK";
        }
    }else{
        return "ERROR: NO_Query";
    }
}
function MySQL_sendQueryAudit($query, $accion){
    if (isset($query) AND $query != "") {
            
        include dirname(__FILE__) . '/db.php';

        SQL_auditoria($query, $accion);

        $SQL = $query;
        $response = mysqli_query($db, $SQL);
        if (mysqli_error($db)) {
            return "ERROR: " . mysqli_error($db);
            exit();
        } else {
            mysqli_close($db);
            return "OK";
        }
    }else{
        return "ERROR: NO_Query";
    }
}
function MySQL_sendFunctionAudit($query, $accion, $typeResponse){

    if (isset($query) AND $query != "") {

            
        include dirname(__FILE__) . '/db.php';

        SQL_auditoria($query, $accion);

        $result = mysqli_query($db, $query);


        if (mysqli_error($db)) {
            return "ERROR: " . mysqli_error($db);
            exit();
        } else {

            if ($typeResponse == "1"){
                //$response = "";
                $response = array();
                while ($row = mysqli_fetch_array($result)) {
                    $response[] = $row;
                };
                mysqli_free_result($result);
                return $response;
            }else{
                //return "OK";
            }
        }
        mysqli_close($db);
    }else{
        return "ERROR: NO_Query";
    }
}

function UserAccess($usr){
    if (!empty($usr)){
            
        include dirname(__FILE__) . '/db.php';

        //$SQL = "SELECT * FROM soliris_usuarios WHERE usuario = '$usr' AND estado_id = (SELECT id from maestro_estado where tipo = 'Estado' and referencia = 'usuario and valor = 'Activo');";
        $SQL = "CALL `ST_UserAccess`('$usr')";
        $result = mysqli_query($db, $SQL);
        while ($row = mysqli_fetch_assoc($result)) {
            $_SESSION["soliris_usuario"] = $row["username"];
            /*$_SESSION["nivel"] = $row["nivel"];*/
            $_SESSION["grupo"] = $row["grupo"];
            
            //$_SESSION["familia"] = $row["familia"];
            $_SESSION["familia"] = 'SOL';


            //MySQL_sendQuery("INSERT INTO soliris_log set fecha = now(), usuario='$usr', accion='Ingreso al sistema', notas = 'Desde el Equipo: " . getIP() . "';");
            // analizar envío de mensajes
            return true;
        }
        if (empty($_SESSION["soliris_usuario"])){
          //MySQL_sendQuery("INSERT INTO soliris_log set fecha = now(), usuario='$usr', accion='Intento Fallido de Login', notas = 'Desde el Equipo: " . getIP() . " - El usuario no existe'';");
          // analizar envío de mensajes
          return false;
      }
      mysqli_close($db);

  }else{
    return false;
}
}
function getIP(){
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}
function dateDifference($date_1, $date_2, $differenceFormat = '%a'){
    $datetime1 = date_create($date_1);
    $datetime2 = date_create($date_2);

    $interval = date_diff($datetime1, $datetime2);

    return $interval->format($differenceFormat);

}
function f_p_reglas($registro){ //control de reglas del registro
    include dirname(__FILE__) . '/db.php';

        $antiguedad_rec = 14;                                                               // Antigüedad MAXIMA f_receta
        $diff_rec_vs_test = 3;                                                              // Diferencia MAXIMA entre f_receta y f_test

        $diff_ultimas_ventas = 28;                                                          // Diferencia MAXIMA en días entre la última venta para mujeres con Capacidad de Gestar
        $max_unidad_nocap = 63;                                                             // Cantidad MAXIMA de Unidades para personas sin Capacidad de Gestar
        $max_unidad_concap = 21;


        $SQL = "SELECT m.estado as es ,p.sexo as se, m.fecha_receta as fr, m.fecha_test as ft, p.c_gestar as cg, p.id as pac, m.fecha_venta as fv FROM soliris_maestro as m inner join pacientes as p on m.nombre=p.id where m.id='$registro';";
        
        $result = mysqli_query($db, $SQL);

        while ($row = mysqli_fetch_assoc($result)) {
           $estado=$row["es"];
           $sexo=$row["se"];
           $f_receta=$row["fr"];
           $f_test=$row["ft"];
           $c_gestar=$row["cg"];
           $id_pac=$row["pac"];
           $f_venta=$row["fv"];

       }

     $SQLuni = "SELECT FU_VAL_UNI($id_pac, $diff_ultimas_ventas, $registro) as CANT_uni";

     $resultuni = mysqli_query($db, $SQLuni);

       while ($rowuni = mysqli_fetch_assoc($resultuni)) {
        $CANT_uni_periodo = $rowuni["CANT_uni"];
    };      

    $SQLdoc = "SELECT documento FROM soliris_documentacion where id_maestro='$registro' and tipo='Receta' ";
    $s_receta = mysqli_query($db, $SQLdoc);
    while ($rowdoc = mysqli_fetch_assoc($s_receta)) {
        $receta = $rowdoc["documento"];
    };      

    $SQLdoc = "SELECT documento FROM soliris_documentacion where id_maestro='$registro' and tipo='Test Embarazo' ";
    $s_receta = mysqli_query($db, $SQLdoc);
    while ($rowdoc = mysqli_fetch_assoc($s_receta)) {
        $test = $rowdoc["documento"];
    };  
    /* Ultima fecha de receta */
    $SQL_lst_rec = "SELECT RM.fecha_receta as fecha_receta FROM soliris_maestro as RM WHERE RM.nombre = '$id_pac' /*AND RM.estado IN ('NP', 'Documentacion', 'FV') */ORDER BY RM.id DESC LIMIT 1, 1;";
    $result_lst_rec = mysqli_query($db, $SQL_lst_rec);
    $lst_fecha_receta = "";
    while ($rowlst = mysqli_fetch_assoc($result_lst_rec)) {
        $lst_fecha_receta = $rowlst["fecha_receta"];
    };
    $validado_txt="";
    $validacion="";
    $checked="false"; 
    $estado="FV";

    if (strcasecmp($c_gestar, "SI") == 0) {
        $max_unidades = $max_unidad_concap; 
    } else {
        $max_unidades = $max_unidad_nocap;
    }

     //reglas generales a ambos sexos
        if ($CANT_uni_periodo <= $max_unidades) {// Cantidad de Ventas dentro del periodo $CANT_uni_periodo
            $checked="true"; 
            $estado="FV";
            $validacion = "N/";
            $validado_txt="";
        } else{
            $checked="false"; 
            $estado="Pendiente";
            $validacion="Pendiente";
            $validado_txt="La cantidad total vendida en el periodo ($CANT_uni_periodo) excede el permitido ($max_unidades)";
            return  $validado_txt .'|'.$estado.'|'.$checked;
        }
        if ((strcasecmp($checked, "true") == 0) and !empty($f_receta) AND strcmp($f_receta, '0000-00-00') !== 0 AND strcmp($lst_fecha_receta, $f_receta) !== 0) {  // Que tenga fecha de receta y no haya sido usada anteriormente
            $checked="true"; 
            $estado="FV";
            $validacion = "N/";
            $validado_txt="";
        }else{
            $checked="false"; 
            $estado="Documentacion";
            $validacion="Documentación";
            $validado_txt="No se encuentra informada la fecha de receta.";
            return  $validado_txt .'|'.$estado.'|'.$checked;
        }

        // SOLO SI TIENE CAPACIDAD DE GESTAR SIGUE ESTA REGLA

        if (strcmp($c_gestar, 'SI') == 0) {

            if ((strcasecmp($checked, "true") == 0) and (dateDifference($f_venta, $f_receta) <= $antiguedad_rec) ) {// Fecha de Receta menor a la antiguedad MAXIMA
                $checked="true"; 
                $estado="FV";
                $validacion = "N/";
                $validado_txt="";
            }else{
                $_t_fecha=dateDifference($f_venta, $f_receta);
                $checked="false"; 
                $estado="Documentación";
                $validacion="Documentación";
                $validado_txt="La fecha de la receta es mas antigua ($f_receta  [$_t_fecha])  que lo permitida ($antiguedad_rec)."; 
                return  $validado_txt .'|'.$estado.'|'.$checked;
            }

        } else {
            
            $checked="true"; 
            $estado="FV";
            $validacion = "N/";
            $validado_txt="";
        }
        
//Si el control general devuelve true (checked=true) continuo con el particular por sexo

        if ((strcasecmp($checked, "true") == 0)) {
            switch ($sexo) {
                case "M":
            if (!empty($receta)){ //valido si ha subido la receta
                $checked="true"; 
                $estado="NP";
                $validacion = "N/";
                $validado_txt="Registro en condiciones.";
            }else{
                $checked="false";
                $estado="Documentacion";
                $validado_txt="No se encuentra adjunta la receta."; 
                $validacion="Documentación"; 
                return  $validado_txt .'|'.$estado.'|'.$checked;
            }
            
            break;
            case "F":
            if (!empty($receta) or !empty($test)){ //valido si ha subido la receta y el test de embarazo
                $checked="true"; 
                $estado="NP";
                $validacion = "N/";
                $validado_txt="Registro en condiciones.";
            }else{
                $checked="false";
                $estado="Documentacion";
                $validado_txt="No se ha encontrado la Receta o el Test de Embarazo adjuntos al pedido."; 
                $validacion="Documentación"; 
                return  $validado_txt .'|'.$estado.'|'.$checked;
            }

            if (strcasecmp($c_gestar, "SI") == 0 and (!empty($f_test) AND dateDifference($f_receta, $f_test) <= $diff_rec_vs_test) ){     // Diferencia entre Fecha Receta y Test menor a $diff_rec_vs_test
                $checked = "true";
                $estado = "FV";
                $validacion = "N/";
                $validado_txt="Registro en condiciones.";
            } else { 
                $checked="false";
                $estado="Documentacion";
                $validado_txt="La fecha de test de embarazo esta vacia o la diferencia entre la fecha de receta y la fecha del test es superior a la permitida ($diff_rec_vs_test)."; 
                $validacion="Pendiente"; 
                return  $validado_txt .'|'.$estado.'|'.$checked;
            };
            break;
        }
    }
    return  $validado_txt .'|'.$estado.'|'.$checked;
}

function str_docus($docs){
    // Consentimiento;Consentimiento_1231_29_9_2011_1424_martin irene consent.JPG ,Tarjeta; Tarjeta_1231_29_9_2011_1424_martin irene tarjeta.JPG
    $salida = "";

    if (isset($docs)||(!empty($docs))) {
        if ($docs){
            $file = $docs;
            $ext = strtolower(substr($docs,-3));
            $vt = explode('_',$docs);
            $type = $vt[0];


            $salida .= "<li class=\"btn btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type $file\"><span class=\"TBL TBL-file_extension_$ext\" style='cursor:pointer;' onclick = \"openfile('$file')\"></span></li>";
        }


        return $salida;

    } else{

        return "<strong>"."Sin Documentación"."</strong>";
    }

    
    
}


/**Funcion que chequea si el POST || GET esta vacio devuelve un string vacio
 * Return = varchar
 * Devolucion de string sanitizado o string vacio
 */
function parametroEmptyChceck($value){
    include dirname(__FILE__) . '/db.php';

    return (isset($value) && !empty($value)) ? mysqli_real_escape_string($db, strtoupper($value)) : 'NULL';

}

/* Libera todas las resultantes de las querys
RECOMENDABLE EJECUTAR ANTES DE LAS VISTAS */

function free_all_results($dbCon)
{
    do {
        if ($res = $dbCon->store_result()) {
            $res->fetch_all(MYSQLI_ASSOC);
            $res->free();
        }
    } while ($dbCon->more_results() && $dbCon->next_result());
}


?>
