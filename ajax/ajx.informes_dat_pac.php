<?php
if(isset($_GET["id"]) AND !empty($_GET["id"]) AND $_GET["id"] != 0) {
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
    
    $id = $_GET["id"];

    $query = "
    SELECT
    P.id AS id,
    P.Nombre AS Nombre,
    P.sexo AS sexo,
    P.c_gestar AS c_gestar,
    DATE_FORMAT(P.fecha_nac, '%d/%m/%Y') as f_nac, /*PMIRANDA*/
    TIMESTAMPDIFF(YEAR,
        STR_TO_DATE(P.fecha_nac, '%Y-%c-%e'),
        CURDATE()) AS edad,
    P.Patologia AS patologia,
    P.estado AS estado,
    (SELECT FU_GET_DOCUMENTS(P.id, 'pacientes')) AS documentos
    FROM
    soliris_maestro AS RM
    RIGHT JOIN pacientes AS P ON (RM.nombre = P.id)
    WHERE
    P.id = '$id'
    ORDER BY P.id DESC
    LIMIT 1;
    ";

    //echo $query;
    
    $result = mysqli_query($db, $query);

    while($row = mysqli_fetch_assoc($result)) {
      //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $var[] = $row;
    }
    
    //SALIDA DE JSON
    if (isset($var)&&(!empty($var))) {
        echo "{\"data\": " . json_encode($var) . "}";
    } else {
        echo "{\"data\": []}";
    }

    
    mysqli_free_result($result);
    mysqli_close($db);


}

?>
