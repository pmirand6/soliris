<?php
    require($_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    if (isset($_GET['aoIni']) AND isset($_GET['aoFin'])){
        $aoIni = (isset($_GET['aoIni'])) ? $_GET["aoIni"] : '';
        $aoFin = (isset($_GET['aoFin'])) ? $_GET["aoFin"] : '';
        $condicion = "WHERE RM.fecha_venta BETWEEN '$aoIni' AND '$aoFin' and RM.Estado not in ('Cancelado','Rechazado','Cancelada','Cancela', 'eliminado','Error', 'Operacion Cancelada', 'Operacion-Cancelada', 'Postergado', 'Documentacion')";
	}else{
		$condicion=" WHERE year(RM.fecha_venta)=year(now()) and RM.Estado not in ('Cancelado','Rechazado','Cancelada','Cancela', 'eliminado','Error', 'Operacion Cancelada', 'Operacion-Cancelada', 'Postergado', 'Documentacion')"; 
	}
	if (isset($condicion)){

        $SQL = "SELECT
        RM.id as Registro,
        (select p.Nombre from pacientes as p where p.id=RM.Nombre) as Paciente,
        (select p.sexo from pacientes as p where p.id=RM.Nombre) as Sexo,
        date_format(RM.fecha_nac, '%d/%m/%Y') as Fecha_Nacimiento,
        (select p.c_gestar from pacientes as p where p.id=RM.Nombre) as C_Gestar,
        RM.edad as Edad,
        /*PGM 29/01/2019 UPPER(RM.medico) as Medico, */
        (select upper(m.Nombre) from medicos m where m.id = RM.id_medico) as Medico,
        date_format(RM.fecha_venta, '%d/%m/%Y') as Fecha_Venta,
        date_format(RM.consentimiento, '%d/%m/%Y') as Fecha_Cons,
        (select p.patologia from pacientes as p where p.id=RM.Nombre) as Patologia,
        RM.institucion as Institucion, 
        RM.canal as Canal,
        RM.APM as APM,
        (select c_atencion from medicos where nombre=RM.medico and estado='Activo') as C_Atencion,
        RM.tipo as tipo,
        RM.estado as Estado,
                  RM.Dosis as Dosis,
        RM.Unidades as Unidades
        FROM
            soliris_maestro as RM
            $condicion
        ORDER BY RM.id DESC;
        ";
        
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
            $Edad = $row["Edad"];
            $Medico = $row["Medico"];
			$Dosis = $row["Dosis"];
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
    }else{
        echo "{\"aaData\": []}";
    };

function l_abrev($nombre){
  $respuesta = "";
  $valor = explode(" ", $nombre);
  foreach ($valor as $name){
    $respuesta .= substr($name, 0, 1);
  }
  return $respuesta;
}
?>
