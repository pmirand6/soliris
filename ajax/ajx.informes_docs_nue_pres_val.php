<?php
// The code bellow demonstrates a simple back-end written in PHP
// Determine which field you want to check its existence
  
require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once '../resources/Includes/master.php';


    $isAvailable = false;

    $fecha_receta = $_POST['f_rec'];
    $id_Pac = $_POST['id_pac'];

    $SQL = "
		SELECT 
			id 
		FROM 
			soliris_maestro 
		WHERE 
			nombre = '$id_Pac' AND 
            fecha_receta = '$fecha_receta' AND 
            estado NOT IN('Cancelado', 'Operacion Cancelada', 'Eliminado', 'Cancela Paciente', 'Rechazado', 'Operacion', 'Operacion-Cancelada');
        ";
    $result = mysqli_query($db, $SQL);

    while ($row = mysqli_fetch_assoc($result)) {
      if (strlen($row["id"]) > 0){
        $isAvailable = true;
      }
    };

    mysqli_free_result($result);
    mysqli_close($db);

// Finally, return a JSON
    echo json_encode(array(
        'valid' => $isAvailable
    ));
?>
