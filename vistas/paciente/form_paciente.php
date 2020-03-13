<?php 
if($_SESSION["grupo"] == 'ventas'){
    include __DIR__.'/form_paciente_ventas.php';    
    echo '
    <div class="container" id="estadoDictamen">
    </div>';
    if(isset($_GET["id"]) && ($_GET["id"] !== 0)) {
        $id = $_GET["id"];
        include('../vistas/paciente/documentacion_paciente.php');
    }
    
    
} else {
    if(isset($_GET["id"]) && ($_GET["id"] !== 0)) {
        $id = $_GET["id"];
        include __DIR__.'/form_paciente_fv.php';
    }

}?>
    
<hr>

<br>
