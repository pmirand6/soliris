<!-- form_modificar_venta.php -->

<section class="hero is-info">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                Modificación de Venta
            </h1>
            <h2 class="subtitle" id="idVenta"></h2>
        </div>
    </div>
</section>

<section class="box">
    <div class="card">
        <div class="card-content">
            <form action="" id="frmModVenta" enctype="multipart/form-data" autocomplete="off">
                <input id="producto" name="producto" value="<?= $producto; ?>" type="text" class="input" style="display: none">
                <div class="columns">
                    <div class="column">
                        <p class="heading">Producto</p>
                        <p class="subtitle" id="productoTitle"><?= $producto; ?></p>
                    </div>
                    <div class="column">
                        <p class="heading">Usuario Creador</p>
                        <p class="subtitle" id="productoTitle"><?= strtoupper($usuario_creador); ?></p>
                    </div>
                    <div class="column">
                        <p class="heading">Fecha de Venta</p>
                        <p class="subtitle" id="productoTitle"><?= $fecha_venta; ?></p>
                    </div>
                    <?php
                    $date1 = new DateTime($f_venta);
                    $date2 = new DateTime($f_mod);
                    if ($date1 <> $date2) {
                        echo
                            '<div class="column">
                                <p class="heading">Usuario Modificación</p>
                                <p class="subtitle" id="productoTitle">' . strtoupper($usuario_mod) . '</p>
                            </div>
                            <div class="column">
                                <p class="heading">Fecha Modificación</p>
                                <p class="subtitle" id="productoTitle"> ' . $fecha_mod .'</p>
                            </div>';
                    } ?>
                </div>
                <div class="columns">
                    <div class="column">
                        <div class="notification is-success">
                            <p class="heading">Datos de la Venta</p>
                        </div>
                        <div class="field is-horizontal">
                            <div class="field-label"><label class="label is-normal">Medico</label></div>
                            <div class="field-body">
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input type="hidden" name="medicoSelected" id="medicoSelected" value="<?php echo $medico; ?>">
                                        <input id="medico" name="medico" type="text" placeholder="Seleccione Médico" class="form-control input" maxlength="45" data-id="<?php echo $medico_id; ?>" value="<?php echo $medico; ?>" required>
                                    </p>
                                    <p id="helpMedico" class="help"></p>
                                    <div id="result_medicos"></div>
                                </div>
                            </div>
                        </div>
                        <div class="field is-horizontal">
                            <div class="field-label"><label class="label is-normal">Presentación</label></div>
                            <div class="field-body">
                                <div class="field">
                                    <p class="control select has-icons-right form-group">
                                        <select id="presentacion" name="presentacion" class="form-control">
                                            <option value="">Selecionar presentacion</option>
                                            <option value="<?php echo $presentacion_id; ?>" selected><?= $presentacion; ?></option>
                                        </select>
                                    </p>
                                </div>
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input class="input form-control" type="number" name="cantDosis" id="cantDosis" min="1" value="<?= $unidades; ?>">
                                        <p id="helpCantDosis" class="help is-success">* Cantidad</p>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="field is-horizontal">
                            <div class="field-label"><label class="label is-normal">Canal</label></div>
                            <div class="field-body">
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input type="hidden" name="canalSelected" id="canalSelected" value="<?= $canal; ?>">
                                        <input id="canal" name="canal" type="text" placeholder="Seleccione Canal" value="<?= $canal; ?>" class="form-control input" maxlength="45" data-id="<?= $canal_id; ?>" required>
                                        <p id="helpCanal" class="help"></p>
                                        <div id="result_canal"></div>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="field is-horizontal">
                            <div class="field-label"><label class="label is-normal">Institución</label></div>
                            <div class="field-body">
                                <div class="field">
                                    <p class="control has-icons-right form-group">
                                        <input type="hidden" name="institucionSelected" id="institucionSelected" value="<?php echo $institucion; ?>">
                                        <input id="institucion" name="institucion" type="text" placeholder="Seleccione Institución" class="form-control input" maxlength="45" data-id="<?php echo $institucion_id; ?>" value="<?php echo $institucion; ?>" required>
                                        <p id="helpInstitucion" class="help"></p>
                                        <div id="result_institucion"></div>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="notification is-success">
                            <p class="heading">Documentación</p>
                        </div>
                        <div class="field is-horizontal" id="divRecetaDocumento">
                            <div class="field-label"><label class="label is-normal">Receta</label></div>
                            <div class="field-body">
                                <div class="field">
                                    <div class="control has-icons-right">
                                        <input id="f_receta" name="f_receta" type="text" placeholder="Fecha de Documento" class="form-control input date" value="<?= $fecha_receta; ?>" disabled>
                                        <span class="icon is-small is-right">
                                            <i data-field="f_receta" class=""></i>
                                        </span>
                                    </div>
                                    <div class="fv-plugins-message-container"></div>
                                </div>
                                <div class="field">
                                    <div class="control file is-info has-icons-right" id="divFileReceta">
                                        <label class="file-label">
                                            <input class="file-input" type="file" name="file_receta" id="file_receta" value="<?=$doc_receta;?>">
                                            <span class="file-cta" id="span-receta" onClick="window.open('<?php echo _DOC_VENTAS . $paciente_id . '/' . $idVenta . '/' . $doc_receta; ?>');">
                                                <span class="file-icon">
                                                    <i id="iconReceta" class="fa fa-search"></i>
                                                </span>
                                                <span class="file-label">
                                                    Ver
                                                </span>
                                            </span>
                                        </label>
                                        <span class="icon is-small is-right">
                                            <i data-field="lastName" class=""></i>
                                        </span>
                                    </div>
                                    <div class="fv-plugins-message-container"></div>
                                </div>
                                <div class="field">
                                    <p class="control">
                                        <button class="button is-danger" id="btnRemDocReceta" type="button">
                                        <span class="icon is-small" title="Borrar Documento">
                                                <i class="fa fa-times"></i>
                                            </span>
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="field is-grouped is-grouped-centered has-icon-left" id="divAddDoc" style="display:<?php if(isset($fecha_otro)){echo 'none';} else {echo '';}?>">
                            <p class="control">
                                <button class="button is-info is-small" id="btnAddDoc" type="button">
                                    <span class="icon">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                    <span>Agregar Documento</span>
                                </button>
                            </p>
                        </div>
                        <div class="field is-horizontal" id="divOtroDocumento" style="display:<?php if(isset($fecha_otro)){echo '';} else {echo 'none';}?>">
                            <div class="field-label"><label class="label is-normal">Otro</label></div>
                            <div class="field-body">
                                <div class="field">
                                    <div class="control has-icons-right">
                                        <input id="f_otro" name="f_otro" type="text" value="<?php if(isset($fecha_otro)){echo $fecha_otro;}?>" placeholder="Fecha de Documento" class="input date " disabled>
                                        <span class="icon is-small is-right">
                                            <i data-field="f_otro" class=""></i>
                                        </span>
                                    </div>
                                    <div class="fv-plugins-message-container"></div>
                                </div>
                                <div class="field fv-plugins-icon-container">
                                    <div class="control file is-info has-icons-right" id="divFileOtro">
                                        <label class="file-label">
                                            <input class="file-input" type="file" name="file_otro" id="file_otro">
                                            <span id="span-otro" class="file-cta" onClick="window.open('<?php echo _DOC_VENTAS . $paciente_id . '/' . $idVenta . '/' . $doc_otro; ?>');">
                                                <span class="file-icon">
                                                    <i id="iconOtro" class="fa fa-search"></i>
                                                </span>
                                                <span class="file-label">
                                                    Ver
                                                </span>
                                            </span>
                                        </label>
                                        <span class="icon is-small is-right">
                                            <i data-field="f_otro" class=""></i>
                                        </span>
                                    </div>
                                    <div class="fv-plugins-message-container"></div>
                                </div>
                                <div class="field">
                                    <p class="control">
                                        <button class="button is-danger" id="btnRemDocOtro" type="button">
                                            <span class="icon is-small" title="Borrar Documento">
                                                <i class="fa fa-times"></i>
                                            </span>
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="field is-grouped is-grouped-centered">
                    <p class="control form-group">
                        <button class="form-control button is-danger" id="btn-modificar" type="submit">
                            Modificar
                        </button>
                    </p>
                    <p class="control form-group">
                        <button class="button is-light" id="canModificacion">
                            Cancelar
                        </button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</section>


<script type="text/javascript" language="javascript" src="../../resources/JS/Develop/modificar_venta.js"></script>