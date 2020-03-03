<?php
$grupo_usuario = $_GET["grupo"];

if($_GET["oper"] == "DataDPG" AND isset($grupo_usuario)){
    
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    $var = array();

    if (strtoupper($grupo_usuario) == "FV" OR strtoupper($grupo_usuario) == "ADMIN"){
        $query = "SELECT * FROM v_DataDPG_Admin;";       
    } else {
        $query = "SELECT * FROM v_DataDPG_User;";       
    }
    

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


if($_GET["oper"] == "DataGDP" AND isset($grupo_usuario)) {
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    

    //QUERY A LA VISTA "v_DataGDP"
    $var = array();

    $query = "SELECT * FROM v_DataGDP;";
    $result = mysqli_query($db, $query);

    
    while($row = mysqli_fetch_assoc($result)) {
      //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $var[] = $row;
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

if($_GET["oper"] == "DataPPA" AND isset($grupo_usuario)) {
    
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
   # include $_SERVER['DOCUMENT_ROOT'] . _FN;

    $var = array();
    $query = "SELECT * FROM v_DataPPA";

    $result = mysqli_query($db, $query);

    while($row = mysqli_fetch_assoc($result)) {
        //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $var[] = $row;
        
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
?>
