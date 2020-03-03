<?php
if(isset($_GET["id"]) AND !empty($_GET["id"]) AND $_GET["id"] != 0) {

    
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    
    $id = $_GET["id"];

    $var = array();

    $query = "
    SELECT
    RM.id as id,
    date_format(RM.fecha_venta, '%d/%m%/%Y') as fecha_venta,
    date_format(RM.consentimiento, '%d/%m%/%Y') as consentimiento,
    RM.dosis as dosis,
    RM.unidades as unidades,
    (IFNULL((SELECT CONCAT(UCASE(m.Apellido), ' ', UCASE(m.Nombre)) FROM medicos AS m where m.id = RM.id_medico), '<b>Sin Medico Asociado en Meditec</b>')) as medico,
    RM.institucion as institucion,
    RM.canal as canal,
    RM.apm as APM,
    RM.Estado as estado,
    RM.nombre as ID_Pac,
    date_format(RM.fecha_receta, '%d/%m%/%Y') as fecha_receta,
     (SELECT `FU_GET_DOCUMENTS`(RM.id,'soliris_maestro')) AS `documentos`  
    FROM
    soliris_maestro as RM
    WHERE
    RM.nombre = '$id'
    ORDER BY
    RM.fecha_venta DESC;";



    $result = mysqli_query($db, $query);

    while($row = mysqli_fetch_assoc($result)) {
      //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $var[] = $row;
    }
    
    //SALIDA DE JSON
    if (isset($var)&&(!empty($var))) {
        echo "{\"data\": " . json_encode($var) . "}";
    } else {
        echo "{\"data\": []}";
    }

    
    mysqli_free_result($result);
    mysqli_close($db);


}

if(isset($_POST["id"]) AND !empty($_POST["id"]) AND $_POST["id"] != 0) {

    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    
    $id = $_POST["id"];

    $var = array();

    $query = "
    SELECT
    RM.id as id,
    date_format(RM.fecha_venta, '%d/%m%/%Y') as fecha_venta,
    date_format(RM.consentimiento, '%d/%m%/%Y') as consentimiento,
    RM.dosis as dosis,
    RM.unidades as unidades,
    RM.medico as medico,
    RM.institucion as institucion,
    RM.canal as canal,
    RM.apm as APM,
    RM.Estado as estado,
    RM.nombre as ID_Pac,
    date_format(RM.fecha_receta, '%d/%m%/%Y') as fecha_receta,
     (SELECT `FU_GET_DOCUMENTS`(RM.id,'soliris_maestro')) AS `documentos`  
    FROM
    soliris_maestro as RM
    WHERE
    RM.nombre = '$id'
    AND
    RM.Estado IN ('NP', 'Documentacion', 'FV')
    ORDER BY
    RM.fecha_venta DESC;";

    $result = mysqli_query($db, $query);

    while($row = mysqli_fetch_assoc($result)) {
      //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $var[] = $row;
    }
    
    //SALIDA DE JSON
    if (isset($var)&&(!empty($var))) {
        echo "{\"data\": " . json_encode($var) . "}";
    } else {
        echo "{\"data\": []}";
    }

    
    mysqli_free_result($result);
    mysqli_close($db);
}

if(isset($_POST["oper"]) AND !empty($_POST["oper"]) AND strcasecmp($_POST["oper"], 'get_ventas') == 0) {

    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    $id_Mst = $_POST["id_Mst"];
    $f_rec = $_POST["f_rec"];
    $id_Pac = $_POST["id_Pac"];

    $var = array();

    $query = "
    SELECT
    RM.id as id,
    date_format(RM.fecha_venta, '%d/%m%/%Y') as fecha_venta,
    date_format(RM.consentimiento, '%d/%m%/%Y') as consentimiento,
    RM.dosis as dosis,
    RM.unidades as unidades,
    RM.medico as medico,
    RM.institucion as institucion,
    RM.canal as canal,
    RM.apm as APM,
    RM.Estado as estado,
    RM.nombre as ID_Pac,
    date_format(RM.fecha_receta, '%d/%m%/%Y') as fecha_receta,
     (SELECT `FU_GET_DOCUMENTS`(RM.id,'soliris_maestro')) AS `documentos`  
    FROM
    soliris_maestro as RM
    WHERE
    RM.nombre = '$id_Pac'
    AND
    RM.Estado IN ('NP', 'Documentacion', 'FV')
    AND 
    RM.id <> '$id_Mst'
    AND
    RM.fecha_receta = '$f_rec'
    ORDER BY
    RM.fecha_venta DESC;";

   

    $result = mysqli_query($db, $query);

    while($row = mysqli_fetch_assoc($result)) {
      //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $var[] = $row;
    }

    //SALIDA DE JSON
    if (isset($var)&&(!empty($var))) {
        echo "{\"data\": " . json_encode($var) . "}";
    } else {
        echo "{\"data\": []}";
    }

    
    mysqli_free_result($result);
    mysqli_close($db);
}

?>
