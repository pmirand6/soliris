<?php
if(isset($_POST["oper"]) AND $_POST["oper"] == "Reasignar"){
      
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];

        $SQL = "UPDATE soliris_maestro SET estado = 'A Reasignar' WHERE id = $id";

        if (isset($SQL) AND $SQL != ""){
                // echo $SQL;
            $response = MySQL_sendQuery($SQL);
            if (isset($_SESSION["soliris_usuario"]) AND $_SESSION["soliris_usuario"] != ""){
                MySQL_sendQuery("INSERT INTO soliris_log SET usuario='" . $_SESSION["soliris_usuario"] . "', fecha = now(), accion = '" . mysqli_real_escape_string($db, "$SQL") . "', registro = 'reasignar.php', notas = 'Se pone en disponible un registro de venta para ser reasignado';");
            } else {
                MySQL_sendQuery("INSERT INTO soliris_log SET usuario='" . $_SERVER['REMOTE_ADDR'] . "', fecha = now(), accion = '" . mysqli_real_escape_string($db, "$SQL") . "', registro = 'reasignar.php', notas = 'Se pone en disponible un registro de venta para ser reasignado';");
            }
            echo("$response");
        }

        mysqli_close($db);
    };
}
?>
