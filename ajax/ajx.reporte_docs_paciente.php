<?php

        require_once('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;


    if(isset($_GET["ini"]) AND !empty($_GET["ini"]) AND isset($_GET["fin"]) AND !empty($_GET["fin"])){
        /**
         *  Formateo de fechas recibidas
         */
        $ini = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_GET["ini"]))), 'Y-m-d');
        $fin = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_GET["fin"]))), 'Y-m-d');

        $condicion =  "YEAR(RM.fecha_venta) BETWEEN $ini AND $fin";
    } else {
        $condicion = " YEAR(RM.fecha_venta) = year(now()) ";
    }

    $query = "
    SELECT
  P.id, 
  P.nombre_completo AS Nombre,
  COUNT(RM.id) AS CANT,
  MAX(RM.fecha_venta) AS U_Venta,
  (SELECT d.valor
FROM rel_paciente_documentos r
INNER JOIN documentos d ON r.documento_id = d.id
INNER JOIN documentos_tipo dt ON dt.id = d.documentos_tipo_id
WHERE r.paciente_id = RM.paciente_id
AND dt.tipo = 'Vacunacion'
AND d.estado_id = 15) AS Vacunacion,
  (SELECT d.valor
FROM rel_paciente_documentos r
INNER JOIN documentos d ON r.documento_id = d.id
INNER JOIN documentos_tipo dt ON dt.id = d.documentos_tipo_id
WHERE r.paciente_id = RM.paciente_id
AND dt.tipo = 'Consentimiento'
AND d.estado_id = 15) AS Consentimiento
FROM maestro_ventas AS RM
  INNER JOIN paciente AS P
    ON (RM.paciente_id = P.id)
WHERE $condicion
AND RM.estado_id = 23
GROUP BY P.id;";




    $result = mysqli_query($db, $query);

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $ID = $row["id"];
        $Nombre = ucwords(strtolower($row["Nombre"]));
        $CANT = $row["CANT"];
        $U_Venta = $row["U_Venta"];
        $vacunacion = $row["Vacunacion"];
        $extensionTar = strtolower(pathinfo($row["Vacunacion"], PATHINFO_EXTENSION));
        $Consentimiento = $row["Consentimiento"];
        $extensionCon = strtolower(pathinfo($row["Consentimiento"], PATHINFO_EXTENSION));

        $arr_row = array(
            "ID" => $ID,
            "Nombre" => $Nombre,
            "CANT" => $CANT,
            "U_Venta" => $U_Venta,
            "vacunacion" => "<span class=\"file_extension _$extensionTar\" title=\"Consentimiento\" onclick = \"openfile('$vacunacion')\"  style='cursor:pointer;'>",
            "Consentimiento" => "<span class=\"file_extension _$extensionCon\" title=\"Consentimiento\" onclick = \"openfile('$Consentimiento')\"  style='cursor:pointer;'>"
        );
        array_push($arr_tbody, $arr_row);
    };

    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
?>
