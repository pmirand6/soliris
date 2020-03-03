<?php 
	 
    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    
$cons='';
    if (isset($_GET["centro"]) AND !empty($_GET["centro"])){
        $centro = $_GET["centro"];
	}else{
		$centro='';
    }
	
	if (isset($_GET["medico"]) AND !empty($_GET["medico"])){
		$medico = $_GET["medico"];
	}else{
		$medico='';
	}
	if ($centro<>''){
			$cons = " and c_atencion='$centro' ";
		}
	if ($medico<>''){
			$cons = " and medico='$medico' ";
			}
	if ($cons<>''){
		$query = "
			SELECT
				nombre, 
				fecha_venta, 
				dosis, 
				unidades, 
				tipo, 
				medico, 
				patologia, 
				institucion, 
				c_atencion, 
				canal , 
				apm 
			FROM 
				v_extranet 
			WHERE 
				estado NOT IN ('eliminado', 'Operacion Cancelada', 'Reasignado Drogueria', 'Cancela Paciente', 'Error de Sistema', 'Cancelado', 'Historico') 
				 $cons ";
		
		
		$result = mysqli_query($db, $query);

		$arr_tbody = array();
		while ($row = mysqli_fetch_assoc($result)) {
			$arr_row = array(
				"paciente" => $row["nombre"],
				"venta" => $row["fecha_venta"],
				"dosis" => $row["dosis"],
				"unidad" => $row["unidades"],
				"tipo" => $row["tipo"],
				"medico" => $row["medico"],
				"patologia" => $row["patologia"],
				"institucion" => $row["institucion"],
				"ca" => $row["c_atencion"],
				"canal" => $row["canal"]
			);
			array_push($arr_tbody, $arr_row);
		};

		mysqli_free_result($result);
		mysqli_close($db);

		echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
	}
?>
