<?php

if (($_SESSION["grupo"] == "fv" OR $_SESSION["grupo"]=="admin")){
echo '
<!-- Comentarios -->
<div class="form-group">
    <label class="col-sm-4 col-xs-4 control-label" for="comentario">Comentarios</label>
    <div class="col-sm-6 col-xs-8">
        <div class="input-group">
            <div class="input-group-addon"><span class="fa fa-sticky-note-o"></span></div>
            <input id="comentario" name="comentario" type="text" placeholder="Comentarios..." class="form-control input-md">
        </div>
    </div>
</div>
<!-- Estado -->
<div class="form-group">
    <label class="col-sm-4 col-xs-4 control-label" for="estado">Estado</label>
    <div class="col-sm-5 col-xs-5 selectContainer">
        <div class="input-group">
            <div class="input-group-addon"><span id="icon_estado" class="fa fa-check-circle-o"></span></div>
            <select id="estadoList" name="estadoList" class="form-control selectpicker">
            </select>
        </div>
    </div>
</div>
<!-- Button (Double) -->
<div class="form-group text-center">
    <div class="col-xs-12 col-sm-12">
        <button id="confirmar_pac" name="confirmar_pac" type="submit" class="btn btn-success boton"><span class="fa fa-check-square"></span> Validar Paciente</button>
    </div>
</div>
</div>

';
} else {
   echo ' <!-- Button (Double) -->
    <div class="form-group text-center">
        <div class="col-sm-12">
            <button type="submit" id="bot_guardar" name="bot_guardar" data-loading-text="Loading..."
            class="btn btn-success disabled">
            <span class="fa fa-save"></span>
            Guardar
        </button>
    </div></div>
';}
?>
