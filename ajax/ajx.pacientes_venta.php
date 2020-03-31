<?php

    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    if(isset($_GET["ini"]) AND $_GET["ini"] != "TODOS"){
        $ini = $_GET["ini"];
        $query =  "CALL `ST_LIST_PACIENTES_HABILITADOS`('1', '$ini')";
    } else {
        $query =  "CALL `ST_LIST_PACIENTES_HABILITADOS`('0', '')";
    }


			
    $result = mysqli_query($db, $query);
    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $id = $row["idPac"];
        $name = strtoupper($row["name"]);
        $sexo = $row["sexo"];
        $estado = $row["estadoPac"];
		
		if (isset($row["u_fecha_venta"])){
			$u_fecha_venta=$row["u_fecha_venta"];
		}else{
			$u_fecha_venta="Sin Ventas";
		}
		
        $arr_row = array(
            "id" => $row["idPac"],
            "u_idVenta" => $row["u_idVenta"],
            "paciente" => $name,
            "sexo" => $sexo,
            "fnac" => $row["fnac"],
            "patologia" => $row["patologia"],
            "subPatologia" => $row["subPatologia"],
            "fconsen" => $row["fecha_con"],
            "email" => $row["email"],
            "telefono" => $row["telefono"],
            "notas" => $row["notas"],
            "estado" => $estado,
            "sub-estado" => $row["sub_estado"],
            "u_fecha_venta" => $u_fecha_venta,
            "u_venta_estado" => $row["u_venta_estado"],
            "u_venta_estado_id"=> $row["u_venta_estado_id"]
        );
        array_push($arr_tbody, $arr_row);
    };
    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";

    
