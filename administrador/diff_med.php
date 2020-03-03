<?php

    require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;
?>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>Diferencias Meditec</title>

	<style type="text/css">
	/* Latest compiled and minified CSS */
	@import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
	/* Optional theme */
	@import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
	/* Font-Awesome */
	@import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
	/* EasyUI */
	@import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
	/* Style DataTables Bootstrap*/
	@import "../resources/DataTables/datatables.min.css";
	/* Iconos de Estados */
	@import "../resources/Sprites/TBL-icons.css";
	/* Custom CSS */
	@import "../resources/CSS/Develop/diff_med.css";

</style>
</head>
<body>

	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="m_comp" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Comparar Medicos</h4>
					</div>
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<form id="frm_comp" role="form">
									<div class="container">
										<div class="row">
											<div class="col-sm-4">
												<div class="form-group ">
													<h3 class="text-center">Base Médicos</h3>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_id">ID</label>
													<input type="text" class="form-control id_med" id="txt_id" name="txt_ape" placeholder="ID" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_ape">Apellido</label>
													<input type="text" class="form-control" id="txt_ape" name="txt_ape" placeholder="Apellido" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_nom">Nombre</label>
													<input type="text" class="form-control" id="txt_nom" name="txt_nom" placeholder="Nombre" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_m_n">Matricula Nacional</label>
													<input type="text" class="form-control" id="txt_m_n" name="txt_m_n" placeholder="Matricula Nacional" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_m_p">Matricula Provincial</label>
													<input type="text" class="form-control" id="txt_m_p" name="txt_m_p" placeholder="Matricula Provincial" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_apm">APM</label>
													<input type="text" class="form-control" id="txt_apm" name="txt_apm" placeholder="APM" disabled>
													<input type="text" name="txt_u_mod" id="txt_apm_id" name="txt_apm_id" style="display: none">
												</div>
											</div>
											<div class="col-sm-1" style="margin-top: 12.7%;padding-left: 0.9%;">
												<div class="container">
													<div class="row" style="/* margin-top: 0.05%; */">
														<button type="button" id="btn_ape_m" class="btn btn-danger " title="Aplicar Cambio"><i class="fa fa-arrow-left"></i></button>
														<button type="button" id="btn_ape_m_c" class="btn btn-primary" title="Deshacer"><i class="fa fa-undo"></i></button>    
													</div>
													<div class="row" style="margin-top: 3.1%;">
														<button type="button" id="btn_nom_m" class="btn btn-danger " title="Aplicar Cambio"><i class="fa fa-arrow-left"></i></button> 
														<button type="button" id="btn_nom_m_c" class="btn btn-primary " title="Deshacer"><i class="fa fa-undo"></i></button>    
													</div>
													<div class="row" style="margin-top: 3.1%;">
														<button type="button" id="btn_mat_n_m" class="btn btn-danger " title="Aplicar Cambio"><i class="fa fa-arrow-left"></i></button>    
														<button type="button" id="btn_mat_n_m_c" class="btn btn-primary " title="Deshacer"><i class="fa fa-undo"></i></button> 
													</div>
													<div class="row" style="margin-top: 3.1%;">
														<button type="button" id="btn_mat_p_m" class="btn btn-danger " title="Aplicar Cambio"><i class="fa fa-arrow-left"></i></button>    
														<button type="button" id="btn_mat_p_m_c" class="btn btn-primary " title="Deshacer"><i class="fa fa-undo"></i></button> 
													</div>
													<div class="row" style="margin-top: 3.1%;">
														<button type="button" id="btn_apm_m" class="btn btn-danger " title="Aplicar Cambio"><i class="fa fa-arrow-left"></i></button> 
														<button type="button" id="btn_apm_m_c" class="btn btn-primary " title="Deshacer"><i class="fa fa-undo"></i></button>    
													</div>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<h3 class="text-center">Base Meditec</h3>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_id_m">ID Meditec</label>
													<input type="text" class="form-control id_med" id="txt_id_m" name="txt_id_m" placeholder="ID" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_ape_m">Apellido</label>
													<input type="text" class="form-control" id="txt_ape_m" name="txt_ape_m" placeholder="Apellido" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_nom_m">Nombre</label>
													<input type="text" class="form-control" id="txt_nom_m" name="txt_nom_m" placeholder="Nombre" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group">
													<label for="txt_m_n_m">Matricula Nacional</label>
													<input type="text" class="form-control" id="txt_m_n_m" name="txt_m_n_m" placeholder="Matricula Nacional" disabled> 
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_m_p_m">Matricula Provincial</label>
													<input type="text" class="form-control" id="txt_m_p_m" name="txt_m_p_m" placeholder="Matricula Provincial" disabled>
												</div>
												<div class="clearfix"></div>
												<div class="form-group ">
													<label for="txt_apm_m">APM</label>
													<input type="text" class="form-control" id="txt_apm_m" name="txt_apm_m" placeholder="APM" disabled>
													<input type="text" name="txt_u_mod" id="txt_apm_id_m" name="txt_apm_id_m" style="display: none">
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="btn_frm_comp" class="btn btn-success" data-dismiss="modal">Guardar</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="margin-left: 2%;">
		<h3>Base Médicos</h3>
		<div class="row">
			<table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataMed">
				<thead>
					<tr>
						<th>ID</th>
						<th>Apellido</th>
						<th>Nombre</th>
						<th>Matricula Nacional</th>
						<th>Matricula Provincial</th>
						<th>APM</th>
						<th>apm_id</th>
					</tr>
				</thead>
				<tfoot class="bg-info">
					<tr>
						<th>ID</th>
						<th>Apellido</th>
						<th>Nombre</th>
						<th>Matricula Nacional</th>
						<th>Matricula Provincial</th>
						<th>APM</th>
						<th>apm_id</th>
					</tr>
				</tfoot>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<div class="container" style="margin-left: 2%;">
		<h3>Base Meditec</h3>
		<div class="row">
			<table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataMed_Med">
				<thead>
					<tr>
						<th>ID</th>
						<th>Apellido</th>
						<th>Nombre</th>
						<th>Matricula Nacional</th>
						<th>Matricula Provincial</th>
						<th>APM</th>
						<th>apm_id</th>
					</tr>
				</thead>
				<tfoot class="bg-info">
					<tr>
						<th>ID</th>
						<th>Apellido</th>
						<th>Nombre</th>
						<th>Matricula Nacional</th>
						<th>Matricula Provincial</th>
						<th>APM</th>
						<th>apm_id</th>
					</tr>
				</tfoot>
				<tbody></tbody>
			</table>
		</div>
	</div>

	<?php
	include "../resources/Includes/BootstrapHTML5.php";
	include "../resources/Includes/BootstrapSelect.php";
	include "../resources/Includes/DataTables.php";
	?>

	<!-- Custom JS -->
	<script type="text/javascript" src="../resources/JS/Develop/diff_med.js"></script>
</body>
</html>