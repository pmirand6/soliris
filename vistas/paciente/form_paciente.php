<?php 

//FIXME switch session ventas | fv | default: usted no tiene permisos

// select quien tiene permisos sobre esta pagina, entonces me devuelve el grupo y en base a eso lo redirecciono

//onclick(id,form_paciente_fv.php)

//select quien tiene permisos a form_paciente_fv.php == true -> false redirecto "no tenes permisos"

if($_SESSION["grupo"] == 'atencion_paciente'){
    // include de la vista del formulario de alta/modificacion del paciente
    include __DIR__.'/form_paciente_ventas.php';    

    if(isset($_GET["id"]) && ($_GET["id"] !== 0)) {
        $id = $_GET["id"];
        include('../vistas/paciente/documentacion_paciente.php');
    }
    
    
} else {
    if(isset($_GET["id"]) && ($_GET["id"] !== 0)) {
        $id = $_GET["id"];
        // vista del dictamen del paciente
        include __DIR__.'/form_paciente_fv.php';
    }

}?>
    
<hr>

<br>
