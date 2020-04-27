<?php
    
    require("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    
if(!empty($_GET["ini"])) {
    $ini = $_GET["ini"];
    $query = "CALL `ST_SHOW_VENTAS_PACIENTE`($ini);";

  
  
    $result = mysqli_query($db, $query);

    while($obj = mysqli_fetch_assoc($result)) {
        
        $var[] = $obj;
    }



    //SALIDA DE JSON
    if (isset($var)&&(!empty($var))) {
        echo "{\"data\": " . json_encode($var) . "}";
    } else {
        echo "{\"data\": []}";
    }

    mysqli_free_result($result);
    mysqli_close($db);


}
