<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificación de Venta</title>


    <style type="text/css">
        /* Bulma CSS */
        @import "../../resources/CSS/bulma/css/bulma.css";
        /* Font-Awesome */
        @import "../../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Iconos de Estados */
        @import "../../resources/Sprites/TBL-icons.css";
        /* Custom CSS */
        /*@import "../../resources/CSS/Develop/generar_venta.css";*/
        /* Include Bootstrap Datepicker */
        @import "../../resources/Bootstrap-DatePicker/min/datepicker.min.css";
        /* Bootstrap Validator */
        @import "../../resources/formvalidation/dist/css/formValidation.css";
        /**Sweetalert2 */
        @import "../../resources/sweetalert2/dist/sweetalert2.min.css";
    </style>
</head>

<body>


    <?php
     
     // include plugins
     include "../resources/Includes/BootstrapHTML5.php";
     include "../resources/Includes/DatePicker.php";
     include "../resources/Includes/EasyUI.php";
     include "../resources/Includes/formvalidation-bulma.php";
     include "../resources/Includes/sweetalert2.php";

    // include vistas
    $idVenta = $_GET["idVenta"];

    free_all_results($db);

    $SQL = "CALL `ST_SHOW_VENTA`('$idVenta')";

    

    $result = mysqli_query($db, $SQL);

    while ($row = mysqli_fetch_assoc($result)) {
        $paciente_id = $row["paciente_id"];
        $paciente_nombre = $row["paciente_nombre"];
        $producto = $row["producto"];
        $medico_id = $row["medico_id"];
        $medico = $row["medico_nombre"];
        $presentacion = $row["presentacion"];
        $presentacion_id = $row["presentacion_id"];
        $unidades = $row["unidades"];
        $fecha_venta = $row["fecha_venta"];
        $usuario_creador = $row["usuario_creador"];
        $fecha_mod = $row["fecha_mod"];
        $usuario_mod = $row["usuario_mod"];
        $f_mod = $row["f_mod"]; // fechas sin formatear
        $f_venta = $row["f_venta"]; // fechas sin formatear
        $doc_receta = $row["doc_receta"];
        $fecha_receta = $row["fecha_receta"];
        $doc_otro = $row["doc_otro"];
        $fecha_otro = $row["fecha_otro"];
        $canal_id = $row["canal_id"];
        $canal = $row["canal"];
        $institucion_id = $row["institucion_id"];
        $institucion = $row["institucion"];
        $estado = $row["estado"];
        $nbr = $row["nbr"];
    }

    

    if (isset($_GET["read"]) && $_SESSION["grupo"] != 'ventas') {
        include "../vistas/venta/form_vista_venta.php";
    } else {
        include "../vistas/venta/form_modificar_venta.php";
    }

   

    ?>

    <!--<script src="<?php echo HTTP?>/resources/JS/funciones.min.js"></script>-->
    <!--<script type="text/javascript" language="javascript" src="../resources/JS/Develop/generar_venta.js"></script>-->

</body>

</html>