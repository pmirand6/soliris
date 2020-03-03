<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;

if(isset($_GET["oper"]) AND $_GET["oper"] == "getEstado" AND !empty($_GET["oper"])){
    
    $SQL = "CALL `ST_LIST_ESTADOS_PACIENTE`()";
    $result = mysqli_query($db, $SQL);
    
    $data = array();

    while ($row = mysqli_fetch_assoc($result)){
        $data[] = $row;
    }
    
    echo json_encode($data);
    mysqli_free_result($result);

}