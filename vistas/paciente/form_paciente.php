<?php

//FIXME switch session ventas | fv | default: usted no tiene permisos

// select quien tiene permisos sobre esta pagina, entonces me devuelve el grupo y en base a eso lo redirecciono

//onclick(id,form_paciente_fv.php)

//select quien tiene permisos a form_paciente_fv.php == true -> false redirecto "no tenes permisos"

$grupo = $_SESSION["grupo"];

switch ($grupo) {
    case 'atencion_paciente':
        include __DIR__ . '/form_paciente_ventas.php';
        if (isset($_GET["id"]) && ($_GET["id"] !== 0)) {
            $id = $_GET["id"];
            include('../vistas/paciente/documentacion_paciente.php');
        }
        break;
    case 'admin':
        include __DIR__ . '/form_paciente_ventas.php';
        if (isset($_GET["id"]) && ($_GET["id"] !== 0)) {
            $id = $_GET["id"];
            include('../vistas/paciente/documentacion_paciente.php');
        }
        break;
    case 'fv':
        // vista del dictamen del paciente
        if (isset($_GET["id"]) && ($_GET["id"] !== 0)) {
            $id = $_GET["id"];
        }
        include __DIR__ . '/form_paciente_fv.php';
        break;
    default:
        # code...
        break;
}

?>

<hr>

<br>