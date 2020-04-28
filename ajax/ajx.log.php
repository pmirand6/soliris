<?php 

require_once("../config/config.php");
    include $_SERVER['DOCUMENT_ROOT'] . _BD;

    if (isset($_GET["id"]) AND !empty($_GET["id"])){
        $id = $_GET["id"];
        $where_filter = "soliris_log AS L WHERE L.id_registro='$id' and L.tabla='". $_GET["tbl"] ."' order by L.fecha desc";
    }else{
        $id = "1";
        $where_filter = "soliris_log AS L where date(fecha)=date(now()) order by L.fecha DESC";
    }

    $query = "
    SELECT 
        L.id, 
        L.registro,
        L.fecha, 
        L.valor_anterior,
        L.valor_nuevo,
        L.usuario, 
        L.accion
    FROM
        $where_filter";

   

    $result = mysqli_query($db, $query);

    $arr_tbody = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $arr_row = array(
            "id" => $row["id"],
            "campo" => $row["registro"],
            "fecha" => $row["fecha"],
            "vAnt" => $row["valor_anterior"],
            "vNuev" => $row["valor_nuevo"],
            "usuario" => $row["usuario"],
            "accion" => $row["accion"]
        );
        array_push($arr_tbody, $arr_row);
    };

    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";

?>
