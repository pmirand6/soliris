<?php


        require_once('../config/config.php');
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;


//$key=$_GET['search_keyword'];
$array = array();

//$SQL = "SELECT nombre FROM helpdesk.usuarios where nombre like '%$key%' ORDER BY nombre DESC;";
$SQL = "SELECT nombre FROM helpdesk.usuarios ORDER BY nombre DESC;";

$result = mysqli_query($db, $SQL);

    while($row = mysqli_fetch_assoc($result)) {
      //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $array[] = $row["nombre"];
    }
    
  echo json_encode($array);
  mysqli_free_result($result);
  mysqli_close($db);
