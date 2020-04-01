<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;


$SQL = "CALL `ST_LIST_PACIENTES_CON_VENTAS`();";

//echo $query;


$result = mysqli_query($db, $SQL);

if ($result) {
  $arr_tbody = array();
  while ($row = mysqli_fetch_assoc($result)) {
    $name = ucwords(strtolower($row["name"]));
    $sexo = $row["sexo"];
    $estado = $row["estadoPac"];

    $arr_row = array(
      "paciente" => "<div class=\"TBL TBL-zoom_in details\" style=\"cursor: pointer\" title=\"Ver Detalle " . $name . " \" onclick=\"viewDetails('" . $row["idPac"] . "')\"><p style=\"padding-left: 18px; width:200px \">" . $name . "</p></div>",
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


