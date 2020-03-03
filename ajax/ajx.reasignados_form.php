<?php
if(isset($_POST["oper"]) AND $_POST["oper"] == "Reasignado"){
  
  require_once("../config/config.php");
  include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
  include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

  if (isset($_POST["idnew"]) AND isset($_POST["idold"]) AND $_POST["idnew"] != "" AND $_POST["idold"] != ""){
    $idnew = $_POST["idnew"];
    $idold = $_POST["idold"];

    $exist = false;
    $query = "SELECT id FROM soliris_maestro WHERE id = '$idnew';";
    $result = mysqli_query($db, $query);
    while ($row = mysqli_fetch_assoc($result)) {
      if (is_numeric($row["id"])){
        $exist = true;
      }
    }

    if ($exist){
      $SQL = "UPDATE soliris_maestro SET estado = 'Reasignado' WHERE id = $idold";

      if (isset($SQL) AND $SQL != ""){
              // echo $SQL;
        $response = MySQL_sendQuery($SQL);
        if (isset($_SESSION["soliris_usuario"]) AND $_SESSION["soliris_usuario"] != ""){
          MySQL_sendQuery("INSERT INTO soliris_log SET usuario='" . $_SESSION["soliris_usuario"] . "', fecha = now(), accion = '" . mysqli_real_escape_string($db, "$SQL") . "', registro = 'reasignado.php', notas = 'Se reasigno la venta $idold a la venta $idnew';");
        } else {
          MySQL_sendQuery("INSERT INTO soliris_log SET usuario='" . $_SERVER['REMOTE_ADDR'] . "', fecha = now(), accion = '" . mysqli_real_escape_string($db, "$SQL") . "', registro = 'reasignado.php', notas = 'Se reasigno la venta $idold a la venta $idnew';");
        }

        echo "$response";
      }
    } else {
      echo "ERROR: El ID de nueva venta no existe";
    }

    mysqli_close($db);
  };
}
?>
