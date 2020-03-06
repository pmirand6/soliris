<form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form" autocomplete="off" id="frm-paciente">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <!-- Form Name -->
            <legend>Datos del Paciente</legend>
                <!-- ID -->
                <div class="form-group" id="div_paciente_id" style="display:none;">
                    <label class="col-sm-4 col-xs-4 control-label" for="vw_id">ID</label>
                    <div class="col-sm-3 col-xs-6">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
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
                        <input id="f_nac" name="f_nac" type="text" placeholder="YYYY-MM-DD" class="form-control input-md date" requiered>
                    </div>
                </div>
            </div>
            <!-- Edad -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="f_nac">Edad</label>
                <div class="col-sm-2 col-xs-2">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-child"></span></div>
                        <input id="f_edad" name="f_edad" type="text" placeholder="Edad" class="form-control input-md" disabled>
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
           
    </div>
    <hr>
     <div id="estadoDictamen"></div><br><br>
    <?php 
        
        
        include('../vistas/paciente/paciente_aprobacion.php');

        if(isset($_GET["id"]) && ($_GET["id"] !== 0)) {
            $id = $_GET["id"];
            include('../vistas/paciente/documentacion_paciente.php');
        }


            
        
        
    ?>
</fieldset>
</form>