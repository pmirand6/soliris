<?php 
    //require_once($_SERVER['DOCUMENT_ROOT'] . '/soliris_pq/config/config.php');   
require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    if(isset($_GET["ini"]) AND $_GET["ini"] != "TODOS"){
        $ini = $_GET["ini"];
        $condicion =  "WHERE LEFT(M.Nombre,1) = '$ini'";
    } else {
        $condicion = "";
    }

    // $query = "SELECT P.id AS id, P.Nombre AS name, P.sexo AS sexo, P.c_gestar AS cgestar, P.fecha_nac AS fnac, P.Patologia AS patologia, P.Fecha_Con AS fconsen, P.mail AS email, P.telefono AS telefono, P.notas AS notas, P.estado AS estado, vRM.fventa AS uventa FROM pacientes AS P LEFT JOIN (SELECT RM.nombre as nombre, RM.fecha_venta as fventa FROM soliris_maestro AS RM WHERE RM.estado <> 'eliminado' GROUP BY RM.Nombre  ORDER BY RM.id DESC) as vRM ON (P.id = vRM.nombre) $condicion ORDER BY P.id ASC" ;
    $query = "SELECT id, Apellido, Nombre, especialidad, matricula_tipo, matricula_numero, estado, Lugar, C_Atencion, telefono,
    Fax, Mail, date_format(nacimiento, '%d/%m/%Y') as nacimiento, date_format(fecha_cap, '%d/%m/%Y') as fecha_cap,
        (SELECT nombre FROM apm A WHERE A.id = M.apm) as APM_name FROM medicos as M $condicion order by M.Nombre asc;";

    $result = mysqli_query($db, $query);

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
    $id = $row["id"];
    $name = strtoupper($row["Nombre"]);
    $matricula_tipo = strtolower($row["matricula_tipo"]);
    $matricula_numero = $row["matricula_numero"];
    $c_atencion = $row["C_Atencion"];
    $estado = $row["estado"];

    $arr_row = array(
        "id" => $row["id"],
        //"catencion" => "<i title=\"$c_atencion\">" . $c_atencion. "...</i>",
        "medico" => "<b class=\"pointer\" onclick=\"callMed('$id')\">$name</b>",
        "matricula" => "<div class=\"TBL TBL-$matricula_tipo\" title=\"$matricula_tipo\"><p style=\"margin-left:20px\">$matricula_numero</p></div>",
        "especialidad" => $row["especialidad"],
        //"catencion" => "<i title=\"$c_atencion\">" . substr($c_atencion, 0, 16) . "...</i>",
        "catencion" => $c_atencion,
        "tel" => "<b class=\"pointer\">Tel.</b> " . $row["telefono"] . "</br><b class=\"pointer\">Fax</b> " . $row["Fax"],
        "email" => $row["Mail"],
        "estado" => "<div class=\"TBL TBL-" . str_replace(" ", "_", $estado) . "\" title=\"$estado\"><p class=\"hidden\">$estado</p></div>",
        "f_cap" => $row["fecha_cap"],
        "apm" => l_apm($row["APM_name"]),
    );

    array_push($arr_tbody, $arr_row);

}
;

    
    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";

function l_apm($valor){
  if (strlen($valor) > 0){
    return substr($valor,0,17);
  }else{
    return "<b class=\"text-danger\">$valor Sin APM</b>";
  }
}
?>
