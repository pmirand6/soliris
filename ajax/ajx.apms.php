<?php

require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;



$SQL = "CALL `ST_LIST_APM`();";
$result = mysqli_query($db, $SQL);

while ($row = mysqli_fetch_assoc($result)) {
    //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
    $var[] = $row;
}

//SALIDA DE JSON
if (isset($var) && (!empty($var))) {
    echo "{\"data\": " . json_encode($var) . "}";
} else {
    echo "{\"data\": []}";
}

mysqli_free_result($result);
mysqli_close($db);
