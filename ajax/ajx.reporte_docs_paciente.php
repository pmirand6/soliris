<?php
    
        require_once('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    

    if(isset($_GET["ini"]) AND !empty($_GET["ini"]) AND isset($_GET["fin"]) AND !empty($_GET["fin"])){
        $ini = $_GET["ini"];
        $fin = $_GET["fin"];
        $condicion =  "YEAR(RM.fecha_venta) BETWEEN $ini AND $fin";
    } else {
        $condicion = " YEAR(RM.fecha_venta) = year(now()) ";
    }

    $query = "
    SELECT
        MAX(RM.id) as ID,
        P.nombre as Nombre,
        COUNT(RM.id) as CANT,
        MAX(RM.fecha_venta) as U_Venta,
        (SELECT RD.documento FROM soliris_documentacion as RD WHERE RD.referencia = 'pacientes' AND RD.tipo = 'Tarjeta' AND RD.id_maestro = RM.nombre ORDER BY RD.id DESC LIMIT 1 ) as Tarjeta,
        (SELECT RD.documento FROM soliris_documentacion as RD WHERE RD.referencia = 'pacientes' AND RD.tipo = 'Consentimiento' AND RD.id_maestro = RM.nombre ORDER BY RD.id DESC LIMIT 1) as Consentimiento
    FROM
        soliris_maestro as RM INNER JOIN pacientes as P ON (RM.nombre = P.id)
    WHERE
        $condicion
    AND 
        RM.estado = 'NP'
    GROUP BY RM.nombre;";


    $result = mysqli_query($db, $query);

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $ID = $row["ID"];
        $Nombre = ucwords(strtolower($row["Nombre"]));
        $CANT = $row["CANT"];
        $U_Venta = $row["U_Venta"];
        $Tarjeta = $row["Tarjeta"];
        $extensionTar = strtolower(pathinfo($row["Tarjeta"], PATHINFO_EXTENSION));
        $Consentimiento = $row["Consentimiento"];
        $extensionCon = strtolower(pathinfo($row["Consentimiento"], PATHINFO_EXTENSION));

        $arr_row = array(
            "ID" => $ID,
            "Nombre" => $Nombre,
            "CANT" => $CANT,
            "U_Venta" => $U_Venta,
            "Tarjeta" => "<span class=\"file_extension _$extensionTar\" title=\"Consentimiento\" onclick = \"openfile('$Tarjeta')\"  style='cursor:pointer;'>",
            "Consentimiento" => "<span class=\"file_extension _$extensionCon\" title=\"Consentimiento\" onclick = \"openfile('$Consentimiento')\"  style='cursor:pointer;'>"
        );
        array_push($arr_tbody, $arr_row);
    };

    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
?>
