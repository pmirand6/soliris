<?php

require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

if($_GET['oper'] && $_GET['oper'] == 'list_patologias'){
    $query = "CALL `ST_GET_PATOLOGIAS`()";

    $result = mysqli_query($db, $query);

    $data = array();
    
    while ($row = mysqli_fetch_assoc($result)){
        $data[] = $row;
    }

    echo json_encode($data);

    mysqli_free_result($result);
}

