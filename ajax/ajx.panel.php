<?php




if($_POST["oper"] == "DataDVP") {
    
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

if($_POST["oper"] == "DataPPA") {
    
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
   # include $_SERVER['DOCUMENT_ROOT'] . _FN;

    $var = array();
    $query = "CALL `ST_LIST_PACIENTES_PENDIENTES`()";

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
