<?php
    
    require("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    
if(!empty($_GET["ini"])) {
    $ini = $_GET["ini"];
    $query = "SELECT 
    RV.id AS id,
    (IFNULL((SELECT UCASE(m.Nombre) FROM medicos AS m where m.nombre = RV.medico), '<b>Sin Medico Asociado en Meditec</b>')) as medico,
    RV.edad as edad,
    RV.dosis AS dosis,
    RV.unidades AS unidades,
    RV.fecha_venta AS fecha_venta,
    RV.fecha_receta AS fecha_receta,
    RV.consentimiento AS consentimiento,
    RV.canal AS canal,
    RV.institucion AS institucion,
    RV.estado AS estado,
    RV.APM as apm,
    (SELECT FU_GET_DOCUMENTS(RV.id,'soliris_maestro')) AS documentos
    FROM
     soliris_maestro AS RV
    WHERE
     RV.nombre = '$ini'
    ORDER BY
     RV.id DESC;";

  
  
    $result = mysqli_query($db, $query);

    while($obj = mysqli_fetch_assoc($result)) {
        
        if (strcasecmp($obj["estado"], "NP") !== 0) {
            $obj["id"] = "-";
        }

        $var[] = $obj;
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
/*function str_docus($docs){
    // Consentimiento;Consentimiento_1231_29_9_2011_1424_martin irene consent.JPG ,Tarjeta; Tarjeta_1231_29_9_2011_1424_martin irene tarjeta.JPG
    $salida = "";

    if (strpos($docs, ',')) {
        $splitDocs = explode(',', $docs);
        foreach ($splitDocs as $docus) {
            if (strpos($docus, ';')) {
                $splitDocus = explode(';', $docus);
                $type = $splitDocus[0];
                $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
                $file = urlencode($splitDocus[1]);

                $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\"><span class=\"TBL TBL-file_extension_$ext\" title=\"$type\"></span></li>";
            }
        }
    } else if (strpos($docs, ';')) {
        $splitDocus = explode(';', $docs);
        $type = $splitDocus[0];
        $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
        $file = urlencode($splitDocus[1]);

        $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\"><span class=\"TBL TBL-file_extension_$ext\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"></span></li>";
    }
    return $salida;
}*/
?>
