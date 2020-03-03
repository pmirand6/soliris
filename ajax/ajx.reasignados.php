<?php
    
require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    $query = "
            SELECT
                RM.id as ID, P.Nombre as Paciente, RM.fecha_venta as fecha_venta, RM.canal as Canal
            FROM
                soliris_maestro AS RM RIGHT JOIN pacientes AS P ON (RM.nombre = P.id)
            WHERE
                RM.estado IN ('A Reasignar')
            ORDER BY P.id ASC;";
    $result = mysqli_query($db, $query);
    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $arr_row = array(
            "id" => $row["ID"],
            "fecha_venta" => $row["fecha_venta"],
            "paciente" => $row["Paciente"],
            "canal" => $row["Canal"],
            "accion" => "<div class=\"inner-addon right-addon\"> <i class=\"btn btn-xs btn-success addon\" title=\"Vincular Reasignado\" onclick=\"reasignado('" . $row["ID"] . "', $('#" . $row["ID"] . "').val())\"><span class=\"fa fa-share\"></span></i><input class=\"input-sm\" placeholder=\"Venta a asignar\" title=\"Re asignar a la venta:...\" id=\"" . $row["ID"] . "\"/></div>"
        );
        array_push($arr_tbody, $arr_row);
    };
    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
?>
