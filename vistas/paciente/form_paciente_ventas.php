<style>

/*
Full screen Modal 
*/
.fullscreen-modal .modal-dialog {
  margin: 0;
  margin-right: auto;
  margin-left: auto;
  width: 60%;
}
@media (min-width: 768px) {
  .fullscreen-modal .modal-dialog {
    width: 550px;
  }
}
@media (min-width: 992px) {
  .fullscreen-modal .modal-dialog {
    width: 770px;
  }
}
@media (min-width: 1200px) {
  .fullscreen-modal .modal-dialog {
     width: 970px;
  }
}


</style>



<form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form" autocomplete="off" id="frm-paciente">
<span id="estadoDictamen"></span>
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Datos del Paciente</legend>
                <!-- ID -->
                <div class="form-group" id="div_paciente_id" style="display:none;">
                    <label class="col-sm-4 col-xs-4 control-label" for="vw_id">ID</label>
                    <div class="col-sm-3 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                            <span class="tag" id="idPac" style="display:none;"></span>
                            <input id="vw_id" name="vw_id" type="text" placeholder="ID" class="form-control input-md disabled" disabled>
                            <input id="id" name="id" type="hidden" class="form-control input-md hidden">
                        </div>
                    </div>
                </div>
            <!-- Apellido -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="apellido">Apellido</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user"></span></div>
                        <input id="apellido" name="apellido" type="text" placeholder="Apellido" class="form-control input-md" maxlength="200" required="">
                    </div>
                </div>
            </div>
            <!-- Nombre -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="nombre">Nombre</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-user"></span></div>
                        <input id="nombre" name="nombre" type="text" placeholder="Nombre" class="form-control input-md" maxlength="200" required="">
                    </div>
                </div>
            </div>
             <!-- Fecha Nacimiento -->
             <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="f_nac">Fecha de Nacimiento</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="f_nac" name="f_nac" type="text" placeholder="DD-MM-YYYY" class="form-control input-md date">
                    </div>
                </div>
            </div>
            <!-- Edad -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="f_nac">Edad</label>
                <div class="col-sm-2 col-xs-2">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-child"></span></div>
                        <input id="f_edad" name="f_edad" type="text" placeholder="Edad" class="form-control input-md" disabled />
                    </div>
                </div>
                <label id="pac_error" class="" for="f_nac" style="margin-top:1%;color: red;"></label>
            </div>
             <!-- Sexo -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="sexo">Sexo</label>
                <div class="col-sm-6 col-xs-8">
                    <div class="input-group">
                        <div class="btn btn-xs btn-default">
                            <input type="radio" name="sexo" id="masculino" value="M">
                            <label class="radio-inline" for="masculino" style="vertical-align: top">
                                <span class="fa fa-mars"></span>
                                Masculino
                            </label>
                        </div>
                        <div class="btn btn-xs btn-default">
                            <input type="radio" name="sexo" id="femenino" value="F">
                            <label class="radio-inline" for="femenino" style="vertical-align: top">
                                <span class="fa fa-venus"></span>
                                Femenino
                            </label>
                        </div>
                    </div>
                </div>
            </div>
             <!-- Telefono -->
             <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="telefono">Teléfono</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-phone"></span></div>
                        <input id="telefono" name="telefono" type="tel" placeholder="45097100" class="form-control input-md" maxlength="45">
                    </div>
                </div>
            </div>
            <!-- Ciudad -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="ciudad">Ciudad</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-building"></span></div>
                        <input id="ciudad" name="ciudad" type="text" placeholder="Capital Federal" class="form-control input-md" maxlength="100">
                    </div>
                </div>
            </div>
            <!-- Pais -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="ciudad">Pais</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-map-o"></span></div>
                        <select id="pais" name="pais" class="form-control selectpicker after-init" data-live-search="true" data-abs-preserve-selected="true"></select>
                    </div>
                </div>
            </div>
            <!-- eMail -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="mail">e-Mail</label>
                <div class="col-sm-5 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-at"></span></div>
                        <input id="mail" name="mail" type="email" placeholder="john.doe@abc.com" class="form-control input-md" maxlength="100">
                    </div>
                </div>
            </div>
            <!-- estado -->
            <?php if(isset($_GET["id"]) AND $_GET["id"] != "") { ?>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="estado">Estado</label>
                <div class="col-sm-5 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span id="icon_estado" class="fa fa-check-circle-o"></span></div>
                        <input id="estado" name="estado" type="text" class="form-control input-md" maxlength="100">
                    </div>
                </div>
            </div>
            <?php }?>
            <!-- Sub Estado -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="sub_estado">Sub Estado</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span id="icon_estado" class="fa fa-check-circle-o"></span></div>
                        <select id="sub_estado" name="sub_estado" class="form-control selectpicker">
                        </select>
                    </div>
                </div>
            </div>
              <!-- Patologia -->
              <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="patologia">Patología</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-heartbeat"></span></div>
                        <select id="patologia" name="patologia" class="form-control selectpicker">
                            <option value="" selected >Seleccione una Patología</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- Sub Patología -->
            <div class="form-group" id="div-sub_pat">
                <label class="col-sm-4 col-xs-4 control-label" for="sub_patologia">Sub Patología</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-heartbeat"></span></div>
                        <select id="sub_patologia" name="sub_patologia" class="form-control selectpicker">
                            
                        </select>
                    </div>
                </div>
            </div>
             <!-- OS -->
             <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="patologia">Obra Social</label>
                <div class="col-sm-5 col-xs-8 selectContainer">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-heartbeat"></span></div>
                        <select id="os" name="os" class="form-control selectpicker after-init" data-live-search="true" data-abs-preserve-selected="true"></select>
                    </div>
                </div>
            </div>
            <!-- CRM Con Vos -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="cmr_id">CRM con Vos ID</label>
                <div class="col-sm-2 col-xs-2">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-id-card"></span></div>
                        <input id="crm_id" name="crm_id" type="text" placeholder="ID" class="form-control input-md">
                    </div>
                </div>
            </div>
        </fieldset>
        
     <!-- estado -->
     <?php if(isset($_GET["id"]) AND $_GET["id"] != "") { ?>
        <div class="form-group text-center">
        <div class="col-sm-12">
            <button type="submit" id="bot_guardar" name="bot_guardar" data-loading-text="Loading..."
            class="btn btn-success disabled">
            <span class="fa fa-save"></span>
            Guardar
        </button>
        <button type="button" id="bot_borrar" name="bot_borrar" data-loading-text="Loading..."
            class="btn btn-danger">
            <span class="fa fa-ban"></span>
            Baja
        </button>
    </div>
            <?php } else {?>

                <!-- Button (Double) -->
    <div class="form-group text-center">
        <div class="col-sm-12">
            <button type="submit" id="bot_guardar" name="bot_guardar" data-loading-text="Loading..."
            class="btn btn-success disabled">
            <span class="fa fa-save"></span>
            Guardar
        </button>
    </div>

            <?php }?>
</div>

</form>

<!-- Modal -->

<div class="modal fullscreen-modal fade" id="modalDocumentacionPaciente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
            <img id="imgModalDocumentacionPaciente" class="img-responsive" src="" alt="">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
	      </div>
	    </div>
	  </div>
	</div>
