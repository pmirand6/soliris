<?php


require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;

if (isset($_GET["idreg"]) and $_GET["idreg"] != "") {
    $idreg = $_GET["idreg"];
    $SQL = "SELECT
                P.Nombre AS nom_pac,
                IM.medico,
                IM.fecha_venta,
                IM.fecha_receta,
                IM.estado,
                IM.unidades,
                IM.dosis,
                IM.canal as canal
                FROM
                soliris_maestro IM
                LEFT JOIN
                pacientes P ON
                P.id = IM.nombre
                LEFT JOIN
                medicos m ON
                m.Id = IM.id_medico
            WHERE
            IM.id = '$idreg';";
}

/* Realizo la consulta */
if (isset($SQL) and $SQL != "") {
    $response = mysqli_query($db, $SQL);
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Administrador de Registros</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Bootstrap Validator */
            @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Include Bootstrap Datepicker */
            @import "../resources/Bootstrap-DatePicker/css/datepicker.css";

        .form-horizontal .selectContainer .form-control-feedback {
            top: 0;
            right: 25px;
        }
    </style>

</head>
<body>
    <fieldset class="form-horizontal col-sm-12 col-xs-12">
        <legend>Registro seleccionado</legend>

        <form class="col-sm-12 col-xs-12 form" id="form_reg_edit">
            <input type="hidden" id="id" value="<?php echo $_GET["idreg"] ?>">
            <input type="hidden" id="motivo" value="<?php echo $_GET["motivo"] ?>">
            <table class="table table-responsive table-bordered">
                <thead class="bg-info">
                    <th class="text-center"></th>
                    <th class="text-center">Original</th>
                    <th class="text-center">A Modificar</th>
                </thead>
                <tbody>
    <?php
if ($response) {
    while ($row = mysqli_fetch_assoc($response)) {
        //print_r($row);
        $nom_pac = $row["nom_pac"];
        $medico = $row["medico"];
        $fecha_venta = $row["fecha_venta"];
        $fecha_receta = $row["fecha_receta"];
        $estado = $row["estado"];
        $unidades = $row["unidades"];
        $dosis = $row["dosis"];
        $canal = $row["canal"];

        echo "<tr class=\"text-center\">";
        echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Paciente</b></td>";
        echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $row["nom_pac"] . "</td>";
        echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span class=\"fa fa-user\"></span></div>
                                            <input id=\"nom_pac\" name=\"nom_pac\" type=\"text\" placeholder=\"Paciente\" class=\"form-control\" value=\"" . $row["nom_pac"] . "\" disabled>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr class=\"text-center\">";
        echo "<tr class=\"text-center\">";
        echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Médico</b></td>";
        echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $row["medico"] . "</td>";
        echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12 selectContainer\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span id=\"icon_estado\" class=\"fa fa-user-md\"></span></div>
                                            <select id=\"medico\" name=\"medico\" class=\"form-control selectpicker\">";
        //$SQLmed = "SELECT * FROM medicos;";
        //$SQLmed = "SELECT CONCAT(m.Apellido, ', ', m.Nombre) as Nombre FROM medicos m order by Nombre asc;";
		$SQLmed = "select nombre as Nombre from medicos where estado='Activo' order by nombre asc;";
        /* Realizo la consulta */
        $response = mysqli_query($db, $SQLmed);
        while ($rowmed = mysqli_fetch_assoc($response)) {
            $nombreMed = $rowmed["Nombre"];
            echo "<option value=\"$nombreMed\" " . f_p_selected($nombreMed, $medico) . " >$nombreMed</option>";
        }

        echo "</select>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr class=\"text-center\">";
        echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Fecha de Venta</b></td>";
        echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $row["fecha_venta"] . "</td>";
        echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span class=\"fa fa-calendar\"></span></div>
                                            <input id=\"fecha_venta\" name=\"fecha_venta\" type=\"text\" placeholder=\"YYYY-MM-DD\" class=\"form-control input-md date\" value=\"" . f_p_date($fecha_venta) . "\">
                                        </div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr class=\"text-center\">";
        echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Fecha de Receta</b></td>";
        echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $row["fecha_receta"] . "</td>";
        echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span class=\"fa fa-calendar\"></span></div>
                                            <input id=\"fecha_receta\" name=\"fecha_receta\" type=\"text\" placeholder=\"YYYY-MM-DD\" class=\"form-control input-md date\" value=\"" . f_p_date($fecha_receta) . "\">
                                        </div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr class=\"text-center\">";
        echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Estado</b></td>";
        echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $row["estado"] . "</td>";
        echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12 selectContainer\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span id=\"icon_estado\" class=\"fa fa-check-circle-o\"></span></div>
                                            <select id=\"estado\" name=\"estado\" class=\"form-control selectpicker\">
                                                <option value=\"Aprobado\" " . f_p_selected('Aprobado', $estado) . ">Aprobado</option>
                                                <option value=\"NP\" " . f_p_selected('NP', $estado) . ">NP</option>
                                                <option value=\"Pendiente\" " . f_p_selected('Pendiente', $estado) . ">Pendiente</option>
                                                <option value=\"FV\" " . f_p_selected('FV', $estado) . ">FV</option>
                                                <option value=\"Operacion\" " . f_p_selected('Operacion Cancelada', $estado) . ">Operacion Cancelada</option>
                                                <option value=\"Cancela\" " . f_p_selected('Cancela Paciente', $estado) . ">Cancela Paciente</option>
                                                <option value=\"Error\" " . f_p_selected('Error de Sistema', $estado) . ">Error de Sistema</option>
                                                <option value=\"Historico\" " . f_p_selected('Historico', $estado) . ">Historico</option>
                                                <option value=\"AReasignado\" " . f_p_selected('A Reasignar', $estado) . ">A Reasignar</option>
                                                <option value=\"Cancelado\" " . f_p_selected('Cancelado', $estado) . ">Cancelado</option>
                                                <option value=\"eliminado\" " . f_p_selected('eliminado', $estado) . ">Eliminado</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr class=\"text-center\">";
        echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Unidades</b></td>";
        echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $row["unidades"] . "</td>";
        echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span class=\"fa fa-medkit\"></span></div>
                                            <select id=\"unidades\" name=\"unidades\" class=\"form-control selectpicker\">";
        //$SQLmed = "SELECT * FROM medicos;";
        $SQLuni = "SELECT valor from auxiliar where tipo = 'unidades' order by valor asc;";
        /* Realizo la consulta */
        $response = mysqli_query($db, $SQLuni);
        while ($rowuni = mysqli_fetch_assoc($response)) {
            $nombreuni = $rowuni["valor"];
            echo "<option value=\"$nombreuni\" " . f_p_selected($nombreuni, $unidades) . " >$nombreuni</option>";
        }

        echo "</select>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr class=\"text-center\">";
        echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Dosis</b></td>";
        echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $dosis . "</td>";
        echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span class=\"fa fa-medkit\"></span></div>
                                            <select id=\"dosis\" name=\"dosis\" class=\"form-control selectpicker\">";
        //$SQLmed = "SELECT * FROM medicos;";
        $SQLdosis = "SELECT valor from auxiliar where tipo = 'dosis' order by valor asc;";
        /* Realizo la consulta */
        $response = mysqli_query($db, $SQLdosis);
        while ($rowdosis = mysqli_fetch_assoc($response)) {
            $nombredosis = $rowdosis["valor"];
            echo "<option value=\"$nombredosis\" " . f_p_selected($nombredosis, $dosis) . " >$nombredosis</option>";
        }

        echo "</select>
                                        </div>
                                    </div>
                                </div>
                            </td>";
        echo "</tr>";
        echo "</select>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr class=\"text-center\">";
echo "<td class=\"col-sm-2 col-xs-2 bg-info\"><b>Canal</b></td>";
echo "<td class=\"col-sm-5 col-xs-5 text-muted\">" . $canal . "</td>";
echo "<td class=\"col-sm-5 col-xs-5\">
                                <div class=\"form-group\">
                                    <div class=\"col-sm-12 col-xs-12\">
                                        <div class=\"input-group\">
                                            <div class=\"input-group-addon\"><span class=\"fa fa-medkit\"></span></div>
                                            <select id=\"canal\" name=\"canal\" class=\"form-control selectpicker\">";
$SQLCanal = "SELECT c.canal FROM canales AS c";
/* Realizo la consulta */
$response = mysqli_query($db, $SQLCanal);
while ($rowCanal = mysqli_fetch_assoc($response)) {
    $nombreCanal = $rowCanal["canal"];
    echo "<option value=\"$nombreCanal\" " . f_p_selected($nombreCanal, $canal) . " >$nombreCanal</option>";
}

echo "</select>
                                        </div>
                                    </div>
                                </div>
                            </td>";
echo "</tr>";

    }
}
?>
                </tbody>
            </table>
            <hr>
            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-sm-12">
                    <button type="submit" id="buscar" name="guardar" class="btn btn-success disabled">
                        <span class="fa fa-save"></span>
                        Guardar
                    </button>
                </div>
            </div>

        </form>
    </fieldset>

    <?php
include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/FormValidation.php";
include "../resources/Includes/DatePicker.php";
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="../resources/JS/Develop/adm_regs_edit.js"></script>
<!--    <script type="text/javascript" src="../resources/JS/adm_regs_edit.min.js"></script>-->

<!-- ################## -->
</body>
</html>
<?php
mysqli_close($db);
?>
