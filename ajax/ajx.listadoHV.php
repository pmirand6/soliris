<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;

if (!empty($_GET["ini"])) {
  $ini = $_GET["ini"];
} else {
  $ini = "A";
}

//$SQL = "SELECT MAX(RV.id) as ID FROM soliris_maestro RV WHERE LEFT((SELECT P.Nombre FROM pacientes as P WHERE P.id = RV.Nombre),1) = '$ini' GROUP BY RV.nombre ORDER BY ID;";
//$SQL = "SELECT MAX(RV.id) as ID FROM pacientes RV WHERE LEFT(RV.Nombre,1) = '$ini' /*GROUP BY RV.nombre*/ ORDER BY ID;";
$SQL = "SELECT id AS ID
FROM paciente
WHERE
LEFT(nombre_completo, 1) = '$ini' /*GROUP BY RV.nombre*/
ORDER BY ID;";

//echo $SQL . "</ br>";

$arr_ids = mysqli_query($db, $SQL);
$ids = "";

while ($row_arr_ids = mysqli_fetch_assoc($arr_ids)) {
  $ids .= "" . $row_arr_ids["ID"] . ",";
}

$ids = trim($ids, ",");

$query = "SELECT 
id,
nombre_completo AS Nombre, 
(SELECT me.valor FROM maestro_estado me where me.id = estado_id) AS estado,  
sexo AS sexo, 
DATE_FORMAT(fecha_nac, '%d/%m/%Y') AS fnac, 
(SELECT `FU_GET_PACIENTE_EDAD`(id)) AS edad,
(SELECT p.patologia_nombre FROM patologia p WHERE p.id = patologia_id) AS patologia
FROM paciente
WHERE id IN (1,4,5,6)
ORDER BY id DESC;";

//echo $query;


$result = mysqli_query($db, $query);

if ($result) {
  $arr_tbody = array();
  while ($row = mysqli_fetch_assoc($result)) {
    /*  $id = $row["id"];*/
    //$name = ucwords(strtolower($row["name"]));
    $name = ucwords(strtolower($row["Nombre"]));
    $sexo = $row["sexo"];
    $estado = $row["estado"];

    $arr_row = array(
      "paciente" => "<div class=\"TBL TBL-zoom_in details\" style=\"cursor: pointer\" title=\"Ver Detalle " . $name . " \" onclick=\"viewDetails('" . $row["id"] . "')\"><p style=\"padding-left: 18px; width:200px \">" . $name . "</p></div>",
      "sexo" => "<div class=\"TBL TBL-$sexo\" title=\"" . l_stringSexo($row["sexo"]) . "\"><p class=\"hidden\">$sexo</p></div>",
      "edad" => $row["edad"],
      "fnac" => $row["fnac"],
      "patologia" => $row["patologia"],
      "estado" => "<div class=\"TBL TBL-" . str_replace(" ", "-", $estado) . "\" title=\"$estado\"><p class=\"hidden\">$estado</p></div>",
    );
    array_push($arr_tbody, $arr_row);
  };

  mysqli_free_result($result);
  mysqli_close($db);

  echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
} else {
  echo "{\"aaData\": []}";
}



function l_stringSexo($sex)
{
  switch ($sex) {
    case 'M':
      return  "Masculino";
      break;
    case 'F':
      return  "Femenino";
      break;



    default:
      return  "N/A";
      break;
  }
}
function l_str_docus($docs)
{
  // Consentimiento;Consentimiento_1231_29_9_2011_1424_martin irene consent.JPG ,Tarjeta; Tarjeta_1231_29_9_2011_1424_martin irene tarjeta.JPG
  //    $salida = "";

  $salida = "";

  if (isset($docs) || (!empty($docs))) {

    if (strpos($docs, ',')) {
      $splitDocs = explode(',', $docs);
      foreach ($splitDocs as $docus) {
        if (strpos($docus, ';')) {
          $splitDocus = explode(';', $docus);
          $type = $splitDocus[0];
          $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
          $file = urlencode($splitDocus[1]);

          $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\"></span></li>";
        }
      }
    } else if (strpos($docs, ';')) {
      $splitDocus = explode(';', $docs);
      $type = $splitDocus[0];
      $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
      $file = urlencode($splitDocus[1]);

      $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\" onclick = \"openfile('$file')\"></span></li>";
    }
    return $salida;
  } else {
  }
  return "<b>" . "Sin Documentación" . "</b>";

  /*if (strpos($docs, ',')){
        $splitDocs = explode(',', $docs);
        foreach($splitDocs as $docus){
            if (strpos($docus, ';')) {
                $splitDocus = explode(';', $docus);
                $type = $splitDocus[0];
                $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
                $file = urlencode($splitDocus[1]);

                $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\"></span></li>";
            }
        }
    } else if (strpos($docs, ';')) {
        $splitDocus = explode(';', $docs);
        $type = $splitDocus[0];
        $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
        $file = urlencode($splitDocus[1]);

        $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\" onclick = \"openfile('$file')\"></span></li>";
    }
    return $salida;*/
}
