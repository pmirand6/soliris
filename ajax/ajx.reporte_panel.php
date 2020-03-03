<?php 
    
require_once('../config/config.php');
        include $_SERVER['DOCUMENT_ROOT'] . _BD;
    

    if(isset($_GET["fecha"]) AND !empty($_GET["fecha"])){
        $fecha = $_GET["fecha"];
	}
	else
	{
		$fecha = date('Y-m');
	}
		
        // $query = "SELECT P.id AS id, P.Nombre AS name, P.sexo AS sexo, P.c_gestar AS cgestar, P.fecha_nac AS fnac, P.Patologia AS patologia, P.Fecha_Con AS fconsen, P.mail AS email, P.telefono AS telefono, P.notas AS notas, P.estado AS estado, vRM.fventa AS uventa FROM pacientes AS P LEFT JOIN (SELECT RM.nombre as nombre, RM.fecha_venta as fventa FROM soliris_maestro AS RM WHERE RM.estado <> 'eliminado' GROUP BY RM.Nombre  ORDER BY RM.id DESC) as vRM ON (P.id = vRM.nombre) $condicion ORDER BY P.id ASC" ;
        $query = "SELECT m.id as m_id, p.nombre AS Paciente, p.id as PID, m.nombre as MNombre
                  FROM soliris_maestro as m INNER JOIN pacientes as p ON(m.nombre = p.id)
                  WHERE DATE_FORMAT(m.fecha_venta, '%Y-%m') = '$fecha' AND m.estado in ('NP','Historico')
                  GROUP BY m.nombre
                  ORDER BY p.nombre ASC;";
        $result = mysqli_query($db, $query);
        

        $arr_tbody = array();
        $tot_ven_pac = 0;

        while ($row = mysqli_fetch_assoc($result)) {
            $idPaciente = $row["PID"];
            $Paciente = $row["Paciente"];
            $subQuery = "
                    SELECT count(unidades) as cantUni, unidades
                    FROM soliris_maestro
                    WHERE DATE_FORMAT(fecha_venta, '%Y-%m') = '$fecha' AND estado in ('NP','Historico') AND nombre='$idPaciente'
                    GROUP BY unidades;";
            $subResult = mysqli_query($db, $subQuery);
            while ($subRow = mysqli_fetch_assoc($subResult)) {
                $cantUni = $subRow["cantUni"];
                $unidades = $subRow["unidades"];

                $unid_u = 0;
                $unid_d = 0;
                $unid_t = 0;

                if($subRow["unidades"] == '21'){$unid_u = $subRow["cantUni"] * 1;};
                if($subRow["unidades"] == '42'){$unid_d = $subRow["cantUni"] * 2;};
                if($subRow["unidades"] == '63'){$unid_t = $subRow["cantUni"] * 3;};

                $cont_v_pac = $unid_d + $unid_t + $unid_u;
                $tot_ven_pac = $tot_ven_pac + $cont_v_pac;

                $anio = substr($fecha, 0, 4);
                $subQuery2 = "
                    SELECT count(id) as CANT
                    FROM soliris_maestro
                    WHERE YEAR(fecha_venta)='$anio' AND nombre='$idPaciente' AND estado in ('NP','Historico');";
                $subResult2 = mysqli_query($db, $subQuery2);
                while ($subRow2 = mysqli_fetch_assoc($subResult2)) {
                    $UAnio = $subRow2["CANT"];
                    $Esperado = $subRow2["CANT"] * 100 / date("m");
                }
                mysqli_free_result($subResult2);

                $arr_row = array(
                    "Paciente" => ucwords(strtolower($Paciente)),
                    "UMes" => color($cont_v_pac),
                    "UAnio" => colorp(number_format($UAnio, 0, '.', ''), $Esperado),
                    "Esperado"  => colorp(number_format($Esperado, 2, '.', '') . "%", $Esperado)
                );
                array_push($arr_tbody, $arr_row);
            };
            mysqli_free_result($subResult);
        };

//        $arr_tTail = array(
//            "Paciente" => '',
//            "UMes" => '',
//            "UAnio" => '',
//            "Esperado"  => $tot_ven_pac
//        );
//        array_push($arr_tbody, $arr_tTail);

        mysqli_free_result($result);
        mysqli_close($db);

        echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
  /* }else{
        echo "{\"aaData\": []}";
    }*/


    function color($valor){
        if($valor == 1) {
            return "<span class=\"text-default\">$valor</span>";
        }elseif($valor == 2) {
            return "<b class=\"text-success\">$valor</b>";
        }elseif($valor == 3) {
            return "<b class=\"text-warning\">$valor</b>";
        }else{
            return "<b class=\"text-danger\">$valor</b>";
        }

    }
    function colorp($valor, $valColor){
        if($valColor >= 80){
            return "<b class=\"text-success\">$valor</b>";
        }
        if($valColor < 80 AND $valColor >= 40){
            return "<b class=\"text-warning\">$valor</b>";
        }
        if($valColor <= 40){
            return "<b class=\"text-danger\">$valor</b>";
        }
    }
?>
