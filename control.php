<?php
/**
 * User: dcilveti
 * Date: 23/11/2016
 * programa que por medio de una recarga cada 60 segundos mantiene el objeto de session
 */

 header("Refresh:60");
 require_once 'config/config.php';

 include $_SERVER['DOCUMENT_ROOT'] . _BD;

 
 
  $SQL = "SELECT max(id), now() as fecha from pacientes ";
    $result = mysqli_query($db, $SQL);
    while ($row = mysqli_fetch_assoc($result)) {
       // echo $row["fecha"];
    };
	
	?>