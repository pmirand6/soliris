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
    echo ' <!-- Button (Double) -->
    <div class="form-group text-center">
        <div class="col-sm-12">
            <button type="submit" id="bot_guardar" name="bot_guardar" data-loading-text="Loading..."
            class="btn btn-success disabled">
            <span class="fa fa-save"></span>
            Guardar
        </button>
    </div></div>
';
    
} else {
    if(isset($_GET["id"]) && ($_GET["id"] !== 0)) {
        $id = $_GET["id"];
        include __DIR__.'/form_paciente_fv.php';
    }

}?>
    
<hr>

<br>
