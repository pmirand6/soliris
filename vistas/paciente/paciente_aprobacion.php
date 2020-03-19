
<form action="" method="post" id="frmDictamenPac" class="form has-text-centered">
    <div class="field">
    <label class="label">Estado</label>
    <div class="control">
        <select id="estadoList" name="estadoList" class="form-control selectpicker">
        </select>
    </div>
    </div>

    <div class="field">
    <label class="label">Comentarios</label>
    <div class="control">
        <textarea id="comentario" name="comentario" class="textarea" placeholder="Comentarios..."></textarea>
    </div>
    </div>

    <div class="buttons has-addons is-centered">
        <button id="confirmar_pac" name="confirmar_pac" type="submit" class="button is-primary is-centered"><span class="icon is-small"><i class="fa fa-check"></i></span><span>Guardar Estado</span></button>
    </div>

        
    <div class="field has-text-centered" id="estadoDictamen" style="display: none">
        <div class="control has-text-centered">
            <div class="notification has-text-centered" id="ultimaNota">
            </div>
        </div>
    </div>
</form>







