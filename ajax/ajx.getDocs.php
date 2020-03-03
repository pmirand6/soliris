<?php
/** Script para obtener los documentos de la venta  */
if (isset($_POST["oper"]) AND strcasecmp($_POST["oper"], 'getDocs') == 0) {
  
    require_once("../config/config.php");
  include $_SERVER['DOCUMENT_ROOT'] . _BD;
  include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

  $json  = array();
  $idMst = $_POST["idMst"];
  $ref = $_POST["ref"];
  $queryDocs = "SELECT documento, tipo
            FROM soliris_documentacion 
            WHERE id IN (SELECT MAX(id) AS id
            FROM soliris_documentacion WHERE id_maestro = '$idMst' 
            and referencia = '$ref'
            GROUP BY tipo ) 
            ORDER BY id";
}

$resp = mysqli_query($db, $queryDocs);

while ($row = mysqli_fetch_array($resp)) {
    $json[] = $row;
}
echo json_encode($json);

?>