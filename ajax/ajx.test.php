<?php 

$db = mysqli_connect('192.168.0.139','soliris_ap','acceso_app') or die ("Database error"); // conector desarrollo
    mysqli_set_charset($db, 'utf8');
    mysqli_select_db($db, 'soliris');

    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }


    $SQLnom = "INSERT INTO auxiliar
	(valor)
	VALUES ('{$_POST["p"]}')";
    $resultnom = mysqli_query($db, $SQLnom);

    


?>