<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;

if(isset($_POST["id"]) AND $_POST["id"]!=0 AND !empty($_POST["id"])){
    $id = $_POST["id"];
    $SQL = "CALL `ST_SHOW_PACIENTE`('$id');";
    $result = mysqli_query($db, $SQL);

    $data = array();

    while ($row = mysqli_fetch_assoc($result)){
        $data[] = $row;
    }
    
    echo json_encode($data);
    mysqli_free_result($result);

    

}