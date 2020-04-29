<?php
//require_once($_SERVER['DOCUMENT_ROOT'] . '/soliris_pq/config/config.php');   
require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;



/*if (isset($_POST["oper"]) == 'getMedicos') {*/

    if (isset($_GET["ini"]) and $_GET["ini"] != "TODOS") {
        $ini = $_GET["ini"];
        $query = "CALL ST_LIST_MEDICOS('$ini')";
    } else {
        $query = "CALL ST_LIST_MEDICOS('')";
    }
    
    

    $result = mysqli_query($db, $query);

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $id = $row["id"];
        $name = strtoupper($row["nombre"]);
        $matricula_tipo = strtolower($row["matricula_tipo"]);
        $matricula_numero = $row["matricula_numero"];
        $c_atencion = $row["c_atencion"];
        $estado = $row["estado"];

        $arr_row = array(
            "id" => $row["id"],
            "medico" => "<b class=\"pointer\" onclick=\"callMed('$id')\">$name</b>",
            "matricula" => "<div class=\"TBL TBL-$matricula_tipo\" title=\"$matricula_tipo\"><p style=\"margin-left:20px\">$matricula_numero</p></div>",
            "especialidad" => $row["especialidad"],
            "catencion" => $c_atencion,
            "tel" => "<b class=\"pointer\">Tel.</b> " . $row["telefono"] . "</br><b class=\"pointer\">Fax</b> " . $row["fax"],
            "email" => $row["mail"],
            "estado" => "<div class=\"TBL TBL-" . str_replace(" ", "_", $estado) . "\" title=\"$estado\"><p class=\"hidden\">$estado</p></div>",
            "f_cap" => $row["fecha_cap"],
            "apm" => l_apm($row["apm_nombre"]),
        );
        array_push($arr_tbody, $arr_row);
    };
    


    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
/*}*/

// Busqueda de médicos desde la venta
if (isset($_GET['q'])) {


    //select de pacientes 
    $filtro = mysqli_real_escape_string($db, $_GET['q']);

    $SQL = "CALL `ST_LIST_MEDICOS_ACTIVOS`('$filtro');";
    $result = mysqli_query($db, $SQL);



    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'text' => $row['nombre']];
    }

    echo json_encode($json);

    mysqli_free_result($result);
}


function l_apm($valor)
{
    if (strlen($valor) > 0) {
        return substr($valor, 0, 17);
    } else {
        return "<b class=\"text-danger\">$valor Sin APM</b>";
    }
}
