<?php
    require($_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    if (isset($_GET['aoIni']) AND isset($_GET['aoFin'])){
        $aoIni = (isset($_GET['aoIni'])) ? date_format(date_create_from_format('d-m-Y', $_GET["aoIni"]), 'Y-m-d') : '';
        $aoFin = (isset($_GET['aoFin'])) ? date_format(date_create_from_format('d-m-Y', $_GET["aoFin"]), 'Y-m-d') : '';

        $SQL = "CALL `ST_REPORTE_FILTROS`('$aoIni', '$aoFin')";
	}else{
		$SQL = "CALL `ST_REPORTE_FILTROS`('', '')";
	}
	    
        $result = mysqli_query($db, $SQL);

        $arr_tbody = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $Registro = $row["Registro"];
			//$Estado= $row["Estado"];
            $Paciente = $row["Paciente"];
            $Abreviado = l_abrev($row["Paciente"]);
            $Sexo = strtoupper($row["Sexo"]);
            $Fecha_Nacimiento = $row["Fecha_Nacimiento"];
            $C_Gestar = $row["C_Gestar"];
            $Edad = $row["edad"];
            $Medico = $row["Medico"];
			$Dosis = $row["Presentacion"];
			$Unidades = $row["Unidades"];
            $Fecha_Venta = $row["Fecha_Venta"];
            $Fecha_Cons = $row["Fecha_Cons"];
            $Patologia = $row["Patologia"];
            $Institucion = $row["Institucion"];
            $Canal = $row["Canal"];
            $APM = $row["APM"];
            $C_Atencion = $row["C_Atencion"];
			$Tipo = $row["tipo"];


            $arr_row = array(
                "Registro" => $Registro,
			//	"Estado" => $Estado,
                "Paciente" => $Paciente,
                "Abreviado" => $Abreviado,
                "Sexo" => $Sexo,
                "Fecha_Nacimiento" => $Fecha_Nacimiento,
                "C_Gestar" => $C_Gestar,
                "Edad" => $Edad,
                "Medico" => $Medico,
				"Dosis" => $Dosis,
				"Unidades" => $Unidades,
                "Fecha_Venta" => $Fecha_Venta,
                "Fecha_Cons" => $Fecha_Cons,
                "Patologia" => $Patologia,
                "Institucion" => $Institucion,
                "Canal" => $Canal,
                "APM" => $APM,
                "C_Atencion" => $C_Atencion,
				"Tipo" => $Tipo
                
            );
            array_push($arr_tbody, $arr_row);
        }

        mysqli_free_result($result);
        mysqli_close($db);

        echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
    

function l_abrev($nombre){
  $respuesta = "";
  $valor = explode(" ", $nombre);
  foreach ($valor as $name){
    $respuesta .= substr($name, 0, 1);
  }
  return $respuesta;
}
