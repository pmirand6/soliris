<?php


require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;

$SQL = "CALL `ST_LIST_PACIENTES_CON_VENTAS`();";
$result = mysqli_query($db, $SQL);

$data = array();

while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

echo "{\"data\": " . json_encode($data) . "}";
mysqli_free_result($result);
