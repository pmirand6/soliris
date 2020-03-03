<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */


if(isset($_POST["oper"]) AND $_POST["oper"] == "Guardar"){
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    /* Seteo de variables */
        $motivo = mysqli_real_escape_string($db, $_POST["motivo"]);

        $id = mysqli_real_escape_string($db, $_POST["id"]);
        $medico = mysqli_real_escape_string($db, $_POST["medico"]);
        $fecha_venta = mysqli_real_escape_string($db, $_POST["fecha_venta"]);
        $fecha_receta = mysqli_real_escape_string($db, $_POST["fecha_receta"]);
        $estado = mysqli_real_escape_string($db, $_POST["estado"]);
        $unidades = mysqli_real_escape_string($db, $_POST["unidades"]);
        $dosis = mysqli_real_escape_string($db, $_POST["dosis"]);
        $canal = mysqli_real_escape_string($db, $_POST["canal"]);

    /* -------------- */

        $SQL = "INSERT into soliris_log SET fecha = now(), registro = 'adm_regs_form.php - ID $id', motivo = '$motivo', accion = 'Modificación de Registro';";
        $SQLMST = "UPDATE soliris_maestro SET medico = '$medico', fecha_venta = '$fecha_venta', fecha_receta = '$fecha_receta', estado = '$estado', unidades = '$unidades', dosis = '$dosis', canal = '$canal' WHERE id = $id;";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
//      echo $SQL;
        $response = MySQL_sendQueryAudit($SQL, "adm_regs_form.php");
        $response = MySQL_sendQueryAudit($SQLMST, "adm_regs_form.php");
        echo("$response");
    }
    mysqli_close($db);
}

?>
