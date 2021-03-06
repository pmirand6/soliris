<?php

        require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _SG;
include $_SERVER['DOCUMENT_ROOT'] . _BD;

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Log de Registros</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Bootstrap Validator */
        @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
         /* DT - Buttons */
        @import "../resources/DataTables/Buttons-1.0.3/css/buttons.jqueryui.min.css";
        /* Custom Style */
        @import "../resources/CSS/Develop/log.css";
        tfoot {
            display: table-header-group;
        }
        tfoot input {
            width: 100%;
            padding: 3px;
            box-sizing: border-box;
        }
    </style>

<?php

$arr_select_tbls='<option value=>Seleccione objeto</option>';

$SQLtbls = "select tbl, descripcion from audit_tablas order by descripcion asc";
$result = mysqli_query($db, $SQLtbls);
    while ($row = mysqli_fetch_assoc($result)) {
        
        $arr_select_tbls .= '<option value="' . $row["tbl"] . '">' . $row["descripcion"] . '</option>;';
    }
?>
</head>
<body>
    <fieldset class="form-horizontal col-sm-11 col-xs-11">
        <legend>Registro seleccionado</legend>

        <form class="col-sm-12 col-xs-12 form">
            <!-- ID -->
            <div class="form-group">
                <div class="col-sm-2 col-xs-2">
                    <label class=" control-label" for="id">ID del registro y Tabla</label>
                </div>
                <div class="col-sm-2 col-xs-2">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                        <input id="id" name="id" type="text" placeholder="ID del Registro" class="form-control input-md" maxlength="20">
                    </div>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <div class="input-group">
                        <select  id="tbl" name="tbl" placeholder="Componente" class="form-control select-md">
                        <?= $arr_select_tbls; ?>
                        </select>
                    </div>
                </div>
                <div class="col-sm-2 col-xs-2">
                    <button type="submit" id="buscar" name="guardar" class="btn btn-info disabled">
                        <span class="fa fa-search"></span>
                        Buscar
                    </button>
                </div>
            </div>

        </form>
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <table id="TBLLog" class="table table-responsive table-bordered">
                    <thead class="bg-info">
                        <th>id</th>
                        <th>Fecha</th>
                        <th>Campo</th>
                        <th>Val. Anterior</th>
                        <th>Val. Nuevo</th>
                        <th>Usuario</th>
                        <th>Acción</th>
                    </thead>
                    <tfoot class="bg-info">
                    <th>id</th>
                        <th>Fecha</th>
                        <th>Campo</th>
                        <th>Val. Anterior</th>
                        <th>Val. Nuevo</th>
                        <th>Usuario</th>
                        <th>Acción</th>
                    </tfoot>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>

    </fieldset>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/DataTables.php";
    ?>
    <!-- Custom JS -->
    <script src="../resources/JS/Develop/log.js"></script>
    <!-- ################## -->
</body>
</html>
