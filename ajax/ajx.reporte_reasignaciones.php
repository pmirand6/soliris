<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;


if(isset($_GET["fecha"]) AND !empty($_GET["fecha"])){
  $condiciones = "";
  if (strrpos($_GET["fecha"], "/") > 0){
    $aoi = substr($_GET["fecha"], 0, 4);
    $mesi = substr($_GET["fecha"], 5, 2);
    $dayi = substr($_GET["fecha"], 8, 2);
    $aof = substr($_GET["fecha"], 13, 4);
    $mesf = substr($_GET["fecha"], 18, 2);
    $dayf = substr($_GET["fecha"], 21, 2);
    $condiciones .= " AND DATE(L.fecha) BETWEEN '" . $aoi . "-" . $mesi . "-" . $dayi ."' AND '" . $aof . "-" . $mesf . "-" . $dayf . "'";
  } else {
    $ao = substr($_GET["fecha"], 0, 4);
    $mes = substr($_GET["fecha"], 5, 2);
    $day = substr($_GET["fecha"], 8, 2);
    $condiciones .=  " AND DATE(L.fecha) = '" . $ao . "-" . $mes . "-" . $day . "'";
  }

  $SQL = "SELECT
                    *
  FROM
  soliris_log AS L
  WHERE
  L.registro = 'reasignado.php'
  $condiciones
  ORDER BY Registro DESC;";

  $result = mysqli_query($db, $SQL);

  $arr_tbody = array();
  while ($row = mysqli_fetch_assoc($result)) {
    $fecha = $row["fecha"];
    $notas = $row["notas"];

    $arr_row = array(
      "Fecha" => $fecha,
      "Nota" => $notas
      );
    array_push($arr_tbody, $arr_row);
  }

  mysqli_free_result($result);
  mysqli_close($db);

  echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
}else{
  echo "{\"aaData\": []}";
};
?>
