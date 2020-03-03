<?php
/**
 * User: jgallina
 * Date: 15/04/2015
 * Time: 05:04 PM
 */


if(isset($_POST["oper"]) AND $_POST["oper"] == "Guardar"){
    require($_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

    if (isset($_POST["id"]) AND $_POST["id"] != ""){
        $id = $_POST["id"];
    };

    /* Seteo de variables */
        $nombre = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["nombre"])));
        if (isset($_POST["matricula_tipo"])){
            $matricula_tipo = $_POST["matricula_tipo"];
        }else{
            $matricula_tipo = "";
        }
        $matricula_numero = mysqli_real_escape_string($db, $_POST["matricula_numero"]);
        $lugar = mysqli_real_escape_string($db, $_POST["lugar"]);
        $c_atencion = mysqli_real_escape_string($db, strtoupper($_POST["c_atencion"]));
        $telefono = mysqli_real_escape_string($db, $_POST["telefono"]);
        $fax = mysqli_real_escape_string($db, $_POST["fax"]);
		$email = mysqli_real_escape_string($db, $_POST["email"]);
        $nacimiento = mysqli_real_escape_string($db, $_POST["nacimiento"]);
        $domicilio = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["domicilio"])));
        $localidad = mysqli_real_escape_string($db, ucfirst(strtolower($_POST["localidad"])));
        $fecha_cap = mysqli_real_escape_string($db, $_POST["fecha_cap"]);
        $especialidad = mysqli_real_escape_string($db, $_POST["especialidad"]);
        $apm = mysqli_real_escape_string($db, $_POST["apm"]);
        $u_venta = mysqli_real_escape_string($db, $_POST["u_venta"]);
        $estado = mysqli_real_escape_string($db, $_POST["estado"]);
        $usuario = $_SESSION["soliris_usuario"];

    /* -------------- */

    if (isset($id) AND $id != ""){
            $SQL = "SELECT FU_UP_MED('$nombre', '$matricula_tipo', '$matricula_numero', '$lugar', '$c_atencion', '$telefono', '$fax', '$nacimiento', '$domicilio', '$localidad', '$fecha_cap', '$especialidad', '$apm', '$estado', '$usuario', '$id','$email') as response";
        } else {
            /* Verifico que no exista el Medico en la base */
                $arr_exists = mysqli_query($db, "select id from medicos where nombre = '$nombre' and matricula_numero = '$matricula_numero';");
            /* Determinar el número de filas del resultado */
                $row_cnt = mysqli_num_rows($arr_exists);
                if ($row_cnt == 0){
                    $SQL = "SELECT FU_NEW_MED('$nombre', '$matricula_tipo', '$matricula_numero', '$lugar', '$c_atencion', '$telefono', '$fax', '$nacimiento', '$domicilio', '$localidad', '$fecha_cap', '$especialidad', '$apm', '$estado','$email') as response";
                }else{
                    echo "ERROR: Ya existe un médico con ese nombre y número de matricula registrado";
                }
                mysqli_free_result($arr_exists);
        }

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
            $response = MySQL_sendFunctionAudit("$SQL", "medico_form.php", "1");
            echo("$response");
    }
    mysqli_close($db);
}
?>
