<?php
require_once '../config/config.php';

    
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
    include $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Reporte de Ventas x Paciente</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Style DataTables Bootstrap*/
            @import "../resources/DataTables/CSS/dataTables.bootstrap.css";
        /* Style DataTable DataTools */
            @import "../resources/DataTables/TableTools-2.0.0/CSS/dataTables.tableTools.css";
        /* Custom CSS */
            @import "../resources/CSS/Develop/reporte_ventas_paciente.css";
    </style>
</head>
<body>
<?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/DataTables.php";
?>
<!-- Custom JS -->
<!--    <script src="../resources/JS/Develop/reporte_ventas_paciente.js"></script>-->
    <script src="../resources/JS/reporte_ventas_paciente.min.js"></script>
</body>
</html>

<?php
    function functRI($apm, $ao, $mes){
require_once '../config/config.php';

        include $_SERVER['DOCUMENT_ROOT'] . _BD;
        $SQLRI = "SELECT count(id) as CANT FROM soliris_maestro WHERE apm='$apm' AND year(fecha_venta)='$ao' AND month(fecha_venta)='$mes' AND estado='NP' AND tipo='RI';";
        $responseRI = mysqli_query($db, $SQLRI);
        if ($responseRI){
            while ($rowRI = mysqli_fetch_assoc($responseRI)) {
                return $rowRI["CANT"];
            }
        } else {
            return false;
        }
        mysqli_close($db);
    }
    function functUP($apm, $ao, $mes){
require_once '../config/config.php';

        include $_SERVER['DOCUMENT_ROOT'] . _BD;
        $SQLFU = "SELECT count(id) as CANT FROM soliris_maestro WHERE apm='$apm' AND year(fecha_venta)='$ao' AND month(fecha_venta)='$mes' AND estado='NP' AND tipo='FU';";
        $responseFU = mysqli_query($db, $SQLFU);
        if ($responseFU){
            while ($rowFU = mysqli_fetch_assoc($responseFU)) {
                return $rowFU["CANT"];
            }
        } else {
            return false;
        }
        mysqli_close($db);
    }
?>