<form class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form" action="ajx.file-upload.php" method="post" enctype="multipart/form-data" autocomplete="off">
        <fieldset class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10">
            <legend>

            <?= (isset($_GET["id"]) && !empty($_GET["id"])) ? 
            '<i id="Docs" class="fa fa-step-backward btn btn-xs btn-default" 
            title="Volver" style="cursor:pointer;margin-right: 50pxs;"></i>
            Documentos del Paciente
                <p style="font-size: x-small;text-align: right;">
                    <i>(*) En caso de existir documentos anteriores, 
                    los subidos en este módulo los reemplazarán.</i>
            </p>' : ''?>
            </legend>
            

            <!-- ID -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="vw_id">ID</label>
                <div class="col-sm-3 col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-hashtag"></span></div>
                        <input id="vw_id" name="vw_id" type="text" placeholder="ID" class="form-control input-md disabled" disabled value="<?php echo $_GET["id"]?>">
                        <input id="id" name="id" type="hidden" class="form-control input-md hidden" value="<?php echo $_GET["id"]?>">
                    </div>
                </div>
            </div>

            <!-- Fecha Documento Documento-->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="f_doc_vac">Fecha de Vacunación</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="f_doc_vac" name="f_doc_vac" type="text" placeholder="DD-MM-YYYY" class="form-control input-md date">
                    </div>
                </div>
            </div>

            <!-- File Documento Documento-->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="file_consentimiento">Registro Vacunación</label>
                <div class="col-sm-4 col-xs-6">
                    <div id="file_consentimiento">Subir</div>
                </div>
            </div>

            <!-- Fecha Documento Otro-->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="f_doc_otro">Fecha de Consentimiento</label>
                <div class="col-sm-4 col-xs-8">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="fa fa-calendar"></span></div>
                        <input id="f_doc_otro" name="f_doc_otro" type="text" placeholder="DD-MM-YYYY" class="form-control input-md date">
                    </div>
                </div>
            </div>
            <!-- File Otro -->
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label" for="file_otro">Consentimiento</label>
                <div class="col-sm-4 col-xs-6">
                    <div id="file_otro">Subir</div>
                </div>
            </div>
            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-sm-12">
                    <button type="submit" id="bot_up_doc" name="bot_up_doc" data-loading-text="Loading..."
                    class="btn btn-success disabled">
                    <span class="fa fa-save"></span>
                    Guardar
                </button>
            </div>
        </fieldset>
    </form>



        