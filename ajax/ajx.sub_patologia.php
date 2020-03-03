<?php

require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

if($_GET['oper'] == 'list_sub_patologia'){
    $query = "CALL `ST_GET_SUB_PATOLOGIA`({$_GET['patologia_id']})";

    $result = mysqli_query($db, $query);

    $data = array();

    $rowcount=mysqli_num_rows($result);

    if($rowcount > 0) {
        while ($row = mysqli_fetch_assoc($result)){
            $data[] = $row;
        }
    
        echo json_encode($data);
    
    } else {
        $rowcount=mysqli_num_rows($result);
    }
    
    
    mysqli_free_result($result);
}

