<!-- form_vista_venta.php -->

<section class="container box">
    <div class="container card">
        <div class="card-content">
            <form action="" id="frmVenta" enctype="multipart/form-data" autocomplete="off">
                <p class="heading">Producto</p>
                <p class="subtitle" id="productoTitle"><?= $producto; ?></p>
                <div class="notification is-success">
                    <p class="heading">Datos de la Venta</p>
                </div>
                <div class="columns">
                    <div class="column">
                        <div class="field">
                            <label class="heading">ID Venta</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $idVenta; ?></strong></h1>
                            </div>
                        </div>
                        <?php if (isset($nbr)) { ?>
                            <div class="field">
                                <label class="heading">nro. np</label>
                                <div class="control">
                                    <h1 class="heading"><strong><?= $nbr; ?></strong></h1>
                                </div>
                            </div>
                        <?php } ?>
                        <div class="field">
                            <label class="heading">Paciente</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $paciente_nombre; ?></strong></h1>
                            </div>
                        </div>
                        <div class="field">
                            <label class="heading">Usuario Creador</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $usuario_creador; ?></strong></h1>
                            </div>
                        </div>
                        <div class="field">
                            <label class="heading">Fecha Venta</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $fecha_venta; ?></strong></h1>
                            </div>
                        </div>

                    </div>
                    <div class="column">
                        <div class="field">
                            <label class="heading">Medico</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $medico; ?></strong></h1>
                            </div>
                        </div>
                        <div class="field">
                            <label class="heading">Presentación</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $presentacion; ?> x <?= $unidades; ?></strong></h1>
                            </div>
                        </div>
                        <div class="field">
                            <label class="heading">Canal</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $canal; ?></strong></h1>
                            </div>
                        </div>
                        <div class="field">
                            <label class="heading">Institución</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $institucion; ?></strong></h1>
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="field">
                            <label class="heading">Fecha Receta</label>
                            <div class="control">
                                <h1 class="heading"><strong><?= $fecha_receta; ?></strong></h1>
                            </div>
                        </div>
                        <div class="field">
                            <label class="heading">Documento Receta</label>
                            <div class="control">
                                <a class="heading" target="_blank" href="<?php echo _DOC_VENTAS . $paciente_id . '/' . $idVenta . '/' . $doc_receta; ?>"><strong>Ver Documento</strong></a>
                            </div>
                        </div>
                        <?php
                        if (isset($fecha_otro) && isset($doc_otro)) { ?>
                            <div class="field">
                                <label class="heading">Fecha Documento</label>
                                <div class="control">
                                    <h1 class="heading"><strong><?= $fecha_receta; ?></strong></h1>
                                </div>
                            </div>
                            <div class="field">
                                <label class="heading">Documento Adicional</label>
                                <div class="control">
                                    <a class="heading" target="_blank" href="<?php echo _DOC_VENTAS . $paciente_id . '/' . $idVenta . '/' . $doc_otro; ?>"><strong>Ver Documento</strong></a>
                                </div>
                            </div>
                        <?php }
                        ?>
                    </div>

            </form>
        </div>
        <div class="field is-grouped is-grouped-centered">
            <p class="control form-group">
                <button class="form-control button is-primary" onclick="parent.history.back();" id="btn-generar" type="submit">
                    Volver al listado
                </button>
            </p>
        </div>
    </div>
</section>
