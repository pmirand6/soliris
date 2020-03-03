<?php 

require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    if (isset($_GET["id"]) AND !empty($_GET["id"])){
        $id = $_GET["id"];
        $where_filter = "soliris_log AS L WHERE L.accion LIKE '%$id%' order by L.fecha DESC";
    }else{
        $id = "1";
        $where_filter = "soliris_log AS L order by L.fecha DESC";
    }

    $query = "
    SELECT 
        L.id, 
        L.usuario, 
        L.fecha,
        L.accion, 
        L.registro, 
        L.notas
    FROM
        $where_filter";

    $result = mysqli_query($db, $query);

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $arr_row = array(
            "id" => $row["id"],
            "registro" => $row["registro"],
            "accion" => $row["accion"],
            "fecha" => $row["fecha"],
            "usuario" => $row["usuario"],
            "notas" => $row["notas"]
        );
        array_push($arr_tbody, $arr_row);
    };

    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";
?>
