
<?php

    require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    if(isset($_GET["ini"]) AND $_GET["ini"] != "TODOS"){
        $ini = $_GET["ini"];
        $query =  "CALL `ST_LIST_PACIENTES`('1', '$ini')";
    } else {
        $query =  "CALL `ST_LIST_PACIENTES`('0', '')";
    }



    $result = mysqli_query($db, $query);
    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $id = $row["id"];
        $name = strtoupper($row["name"]);
        $sexo = $row["sexo"];
        $estado = $row["estado"];

		if (isset($row["uventa"])){
			$u_venta=$row["uventa"];
		}else{
			$u_venta="Sin Ventas";
		}



        $arr_row = array(
            "id" => $row["id"],
            "paciente" => "<b class=\"pointer\" onclick=\"callPac('$id', '{$_SESSION["grupo"]}')\">$name</b>",
            "sexo" => "<div class=\"TBL TBL-$sexo\" title=\"" . l_stringSexo($row["sexo"]) . "\"><p class=\"hidden\">$sexo</p></div>",
            "edad" => $row["edad"],
            "fnac" => $row["fnac"],
            "patologia" => $row["patologia"],
            "subPatologia" => $row["subPatologia"],
            "fconsen" => $row["fecha_con"],
            "fvac" => $row["fecha_vac"],
            "email" => $row["email"],
            "telefono" => $row["telefono"],
            "notas" => $row["notas"],
            "estado" => "<div class=\"TBL TBL-" . str_replace(' ', '_', $estado) . "\" title=\"$estado\"><p class=\"hidden\">$estado</p></div>",
            "sub-estado" => $row["sub_estado"],
			"uventa" => $u_venta
        );
        array_push($arr_tbody, $arr_row);
    };
    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";

    function l_stringSexo($sex){
        switch ($sex) {
            case 'M':
                return  "Masculino";
                break;
            case 'F':
                return  "Femenino";
                break;

            default:
                return  "N/A";
                break;
        }
    }
?>
