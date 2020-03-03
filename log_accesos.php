<?php 
    header( 'Cache-Control: no-store, no-cache, must-revalidate' );
    header( 'Cache-Control: post-check=0, pre-check=0', false );
    header( 'Pragma: no-cache' );

     
require_once('config/config.php');
     include $_SERVER['DOCUMENT_ROOT'] . _BD;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Pragma" content="no-cache">

    <title>Log Accesos</title>
    
    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css"
        /* Style DataTables Bootstrap*/
            @import "resources/DataTables/CSS/dataTables.bootstrap.css";
        /* Style DataTable DataTools */
            @import "resources/DataTables/TableTools-2.0.0/CSS/dataTables.tableTools.css";
        /* Custom CSS */
            @import "resources/CSS/Develop/log_accesos.css";
    </style>


</head>
<body>
    <div class="row col-sm-10 col-xs-10 col-sm-offset-1 col-xs-offset-1">
        <h2 class="bg-primary text-center">Registro de Accesos al Sistema</h2>
    </div>
    <div class="row col-sm-10 col-xs-10 col-sm-offset-1 col-xs-offset-1">
        <table id="TBLLog_Accesos" class="table table-responsive table-bordered">
                <thead class="bg-info">
                    <th>id</th>
                    <th>Registro</th>
                    <th>Acción</th>
                    <th>Fecha</th>
                    <th>Usuario</th>
                    <th>Notas</th>
                </thead>
                <tbody>
<?php 
                $SQL = "SELECT * FROM soliris_log WHERE accion in ('Ingreso al sistema', 'Intento Fallido de Login') AND usuario = '" . $_SESSION["soliris_usuario"] . "' ORDER BY ID DESC;";
                $result = mysqli_query($db, $SQL);

                while ($row = mysqli_fetch_assoc($result)) {
                    $id = $row["id"];
                    $Registro = $row["registro"];
                    $Acción = $row["accion"];
                    $Fecha = $row["fecha"];
                    $Usuario = $row["usuario"];
                    $Notas = $row["notas"];

                    echo "
                    <tr class='text-center'>
                        <td>$id</td>
                        <td>$Registro</td>
                        <td>$Acción</td>
                        <td>$Fecha</td>
                        <td>$Usuario</td>
                        <td>$Notas</td>
                    </tr>";
                }
?>
                </tbody>
            </table>
    </div>

<?php 
    include "resources/Includes/BootstrapHTML5.php";
    include "resources/Includes/DataTables.php";
?>

    <!-- Custom JS -->
<!--        <script src="resources/JS/Develop/log_accesos.js"></script>-->
        <script src="resources/JS/log_accesos.min.js"></script>


</body>
</html>