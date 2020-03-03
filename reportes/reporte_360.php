<?php

require_once('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;

$v_plus = "";
$cant = "";
$inicial = "";
$t_u_ventas = "";
$campo = "";
$cant = "";
$plus = "";
$ventas = "";
$n_unid = "";
$u_ventas = "";
$nom = "";
$nuevo = "";
$pacientes = "";
$paciente = "";
$n_ventas = "";
$c_pat_tot = "";
$c_pacientes = "";
$usuario = "";
$consulta = "";
$ao_val = "";
$mes = "";
$nombre = "";
$boton = "";
$unit = "";
$where_p = "";
$where = "";
$contador_ventas = 0;
$contador_unit = 0;
$contador_paciente = 0;
$promedio_venta = 0;

?>

<!DOCTYPE html>
<html>
<head>
	<title>Reporte 360</title>
	<style type="text/css">
	/* Latest compiled and minified CSS */
	@import "../resources/Bootstrap-3.3.1/css/bs.min.css";
	/* Optional theme */
	/*@import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";*/
	/* Font-Awesome */
	@import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
	/* BS Select */
	@import "../resources/Bootstrap-Select/css/bootstrap-select.min.css";
	/* Custom CSS */
	@import "../resources/CSS/Develop/reporte_360.css";
</style>
</head>
<body>


	<!-- TABLA PRINCIPAL -->

	<div class="mcontent0">
		<br>
		<!-- TABLA DE FILTROS -->
		<div class="filter-wrapper">
			<div class="pull-center">
				<div class="well" id="d_tbl_fil">
					<div class="container text-center">
						<h1>Reporte 360</h1>
						<div class="well well-sm" style="width: 10%;margin-left: 45%;">
							<h5>Mostrar Filtros</h5>
							<label class="switch">
								<input type="checkbox" data-toggle="collapse" data-target="#rep-filter-card">
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					<br>
					<div id="rep-filter-card" class="collapse filter-card">
						<div class="container text-center">
							<div class="well well-sm ">
								<h5><b>Fechas</b></h5>
								<div class="row">
									<div class="col-md-offset-3 col-md-3">
										<select  id="mesVenta" name="mesVenta" class="selectpicker" data-live-search="true" data-style="btn-success" data-size="5">
											<option disabled value="">Mes</option>
										</select>
									</div>
									<div class="col-md-3">
										<select  id="yearVenta" name="yearVenta" class="selectpicker" data-live-search="true" data-style="btn-success" data-size="5">
											<option disabled value="">Año</option>
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">

									<select  id="sel_med" name="sel_med" class="selectpicker" data-live-search="true" data-style="btn-primary" data-size="5">
										<option disabled value="">Médicos</option>
									</select>

								</div>
								<div class="col-md-3">

									<select  id="sel_inst" name="sel_inst" class="selectpicker" data-live-search="true" data-style="btn-primary" data-size="5">
										<option disabled value="">Instituciones</option>
									</select>

								</div>
								<div class="col-md-3">

									<select  id="sel_can" name="sel_can" class="selectpicker" data-live-search="true" data-style="btn-primary" data-size="5">
										<option disabled value="">Canales</option>
									</select>

								</div>
								<div class="col-md-3">

									<select  id="sel_apm" name="sel_apm" class="selectpicker" data-live-search="true" data-style="btn-primary" data-size="5">
										<option disabled value="">APM</option>
									</select>

								</div>
							</div>
							<div class="row">
								<div class="col-md-3">

									<select id="sel_pat" name="sel_pat" class="selectpicker"data-style="btn-primary" data-size="5">
										<option disabled value="">Patologías</option>
									</select>

								</div>
								<div class="col-md-3">

									<select id="sel_dos" name="sel_dos" class="selectpicker"data-style="btn-primary" data-size="5">
										<option disabled value="">Dosís</option>
									</select>

								</div>
								<div class="col-md-3">

									<select id="sel_uni" name="sel_uni" class="selectpicker"data-style="btn-primary" data-size="5">
										<option disabled value="">Unidades</option>
									</select>

								</div>
								<div class="col-md-3">
									<select id="sel_edad" name="sel_edad" class="selectpicker"data-style="btn-primary" data-size="5">
										<option disabled value="">Edad</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FIN TABLA DE FILTROS -->

	<?php
/*if (!(isset($_GET["plus"]))) {
//echo "<script>document.getElementById('busquedas').style.display='';</script>";
}*/

?>
<div class="container cTblPri">
<div id="tDat"></div>
<p id="pHelp" class="bg-success text-center"><b>Por favor realice la selección de un filtro para comenzar</b></p>
<section id="secPrincipal">
	<button id="btnExcel" class="btn btn-success"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Exportar a Excel</button>
	<br><br>
	<table class="table table-bordered" id="tblPrincipal">
		<thead>
			<tr>
				<th>Nombre, Apellido</th>
				<th>Edad</th>
				<th>Sexo</th>
				<th>Fecha de Venta</th>
				<th>Patología</th>
				<th>Canal</th>
				<th>Institución</th>
				<th>Médico</th>
				<th>Dosís</th>
				<th>Unidades</th>
				<th>APM</th>
				<th>Tipo</th>
				<th>C. Atención</th>
			</tr>
		</thead>
		<tbody>
			<?php
if (isset($_GET["plus"]) and !empty($_GET["plus"])) {

    $v_plus = $_GET["plus"];
    $v_plus = str_replace(";", "", $v_plus);
    $v_plus = str_replace(">", "", $v_plus);
    $v_plus = str_replace("|", "'", $v_plus);
}

$cant = 0;

if (isset($_GET["campo"]) and !empty($_GET["campo"])) {
    $campo = $_GET["campo"];
}

if (isset($_GET["inicial"]) and !empty($_GET["inicial"])) {
    $inicial = $_GET["inicial"];
}

/*Analisis del WHERE para el paciente*/
if (strcasecmp($campo, '0') == 0) {

    $where_p = "FROM soliris_maestro as m
				LEFT JOIN
				pacientes as p
				ON
				p.id = m.nombre
				LEFT JOIN
				medicos as me
				ON
				/*m.medico=me.nombre*/
				m.id_medico = me.id
				WHERE
				m.estado in('NP', 'Historico')
				$v_plus
				group by p.id
				order by p.nombre asc";
} else {
    if (isset($_GET["inicial"])) {

        $inicial_split = str_replace("_", " ", $_GET["inicial"]);
        if (strcasecmp($campo, 'p.edad') == 0) {

            $where_p = "FROM
						soliris_maestro as m
						LEFT JOIN
						pacientes as p
						ON
						p.id = m.nombre
						LEFT JOIN
						medicos as me
						ON
						/*m.medico=me.nombre*/
						m.id_medico = me.id
						WHERE
						m.estado in('NP', 'Historico')
						AND
						DATE_FORMAT(FROM_DAYS(TO_DAYS(now())-TO_DAYS(p.fecha_nac)),'%Y')+0='" . $inicial_split . "'
						$v_plus
						group by p.id
						ORDER by
						p.nombre asc";
        } else {

            $where_p = "FROM
						soliris_maestro as m
						LEFT JOIN
						pacientes as p
						ON
						p.id = m.nombre
						LEFT JOIN
						medicos as me
						ON
						/*m.medico=me.nombre*/
						m.id_medico = me.id
						WHERE
						m.estado in('NP', 'Historico')
						AND
						$campo = '" . $inicial_split . "' $v_plus
						group by p.id
						ORDER BY
						p.nombre asc";
        }
    }
}

$query_pac_v = "SELECT
			p.id,
			p.Nombre as pac_nom,
			p.sexo as pac_sexo,
			p.fecha_nac as pac_fn,
			p.patologia as pac_pat,
			p.fecha_con as pac_fc,
			count(m.id) as cuenta_id,
			sum(m.unidades) as suma_unidades
			$where_p";

if (!empty($where_p)) {
    $result_pac_v = mysqli_query($db, $query_pac_v);
    if ((mysqli_num_rows($result_pac_v) > 0)) {

        while ($row_pac_v = mysqli_fetch_assoc($result_pac_v)) {

            $id_pac = $row_pac_v["id"];

            if (!empty($campo)) {

                /*Analisis del WHERE*/
                if (strcasecmp($campo, '0') == 0) {

                    $where = "FROM soliris_maestro as m
							LEFT JOIN
							pacientes as p
							ON
							p.id = m.nombre
							LEFT JOIN
							medicos as me
							ON
							/*m.medico=me.nombre*/
							m.id_medico = me.id
							WHERE
							m.estado in('NP', 'Historico')
							AND
							m.nombre = $id_pac $v_plus
							order by p.id asc";
                } else {
                    $inicial_split = str_replace("_", " ", $_GET["inicial"]);
                    if (strcasecmp($campo, 'p.edad') == 0) {

                        $where = "FROM
								soliris_maestro as m
								LEFT JOIN
								pacientes as p
								ON
								p.id = m.nombre
								LEFT JOIN
								medicos as me
								ON
								/*m.medico=me.nombre*/
								m.id_medico = me.id
								WHERE
								m.estado in('NP', 'Historico')
								AND
								m.nombre = $id_pac
								AND
								DATE_FORMAT(FROM_DAYS(TO_DAYS(now())-TO_DAYS(p.fecha_nac)),'%Y')+0='" . $inicial_split . "'
								$v_plus
								ORDER by
								p.id asc";
                    } else {

                        $where = "FROM
								soliris_maestro as m
								LEFT JOIN
								pacientes as p
								ON
								p.id = m.nombre
								LEFT JOIN
								medicos as me
								ON
								/*m.medico=me.nombre*/
								m.id_medico = me.id
								WHERE
								m.estado in('NP', 'Historico')
								AND
								m.nombre = $id_pac
								AND
								$campo = '" . $inicial_split . "' $v_plus
								ORDER BY
								p.id asc";
                    }

                }
                $sel = "SELECT
						m.canal, /*0*/
						m.institucion, /*1*/
						m.fecha_venta, /*2*/
						me.Id as id_med, /*3*/
						UPPER(CONCAT(me.Apellido, ', ', me.Nombre)) as nombre_med, /*4*/
						m.dosis, /*5*/
						m.unidades, /*6*/
						m.edad, /*7*/
						m.apm, /*8*/
						m.tipo, /*9*/
						m.nombre, /*10*/
						m.estado, /*11*/
						m.id,/*12*/
						me.c_atencion /*13*/
						$where";

                $result_sel = mysqli_query($db, $sel);
                //echo $sel;

                while ($m = mysqli_fetch_array($result_sel)) {
                    $cant = $cant + 1;
                    $timestamp = strtotime($m[2]);
                    $day = date("d", $timestamp);
                    $month = date("m", $timestamp);
                    $year = date("Y", $timestamp);
                    $nom = $m[9];
                    ?>
						</tr>
						<td>
							<?=$row_pac_v["pac_nom"]?>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.edad=|<?=$m[7];?>|;<?=$_GET["plus"];?>"><?=$m[7];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20p.Sexo=|<?=$row_pac_v["pac_sexo"];?>|;<?=$_GET["plus"];?>"><?=$row_pac_v["pac_sexo"];?></a>
						</td>
						<td class="lef">
							<?=$day;?>
							/<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&lim=3&plus=%20and%20month(m.fecha_venta)=|<?=$month;?>|;<?=$_GET["plus"];?>>" title="Filtro por Mes"><?=$month;?></a>
							/<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&lim=3&plus=%20and%20year(m.fecha_venta)=|<?=$year;?>|;<?=$_GET["plus"];?>>" title="Filtro por Año"><?=$year;?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20p.patologia=|<?=$row_pac_v["pac_pat"];?>|;<?=$_GET["plus"];?>>"><?=$row_pac_v["pac_pat"];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.canal=|<?=$m[0];?>|;<?=$_GET["plus"];?>>"><?=$m[0];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.institucion=|<?=$m[1];?>|;<?=$_GET["plus"];?>>"><?=$m[1];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.id_medico=|<?=$m[3];?>|;<?=$_GET["plus"];?>"><?=$m[4];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.dosis=|<?=$m[5];?>|;<?=$_GET["plus"];?>"><?=$m[5];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.unidades=|<?=$m[6];?>|;<?=$_GET["plus"];?>"><?=$m[6];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.apm=|<?=$m[8];?>|;<?=$_GET["plus"];?>"><?=$m[8];?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.tipo=|<?=$m[9];?>|;<?=$_GET["plus"];?>"><?=fl_tipo_rep($m[9]);?></a>
						</td>
						<td class="lef">
							<a href="reporte_360.php?tabla=medicos&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20me.c_atencion=|<?=$m[13];?>|;<?=$_GET["plus"];?>"><?=$m[13];?></a>
						</td>
						<?php
switch ($m[6]) {
	
                        case '21':
                            $unit = $unit + 1;
                            break;
                        case '42':
                            $unit = $unit + 2;
                            break;
                        case '63':
                            $unit = $unit + 3;
                            break;

                    }

                }

                echo "<tr bgcolor=\"silver\"><td colspan=\"13\"><b>Cantidad de ventas: " . $row_pac_v["cuenta_id"] . " | Cantidad de unidades Vendidas: " . $unit . " | Cantidad de Comprimidos: " . $row_pac_v["suma_unidades"] . "</b></td></tr>";
                $contador_ventas = $contador_ventas + $row_pac_v["cuenta_id"];
                $contador_unit = $contador_unit + $unit;
				$unit=0;
                $contador_paciente = $contador_paciente + 1;

            }
        } //<-- end while paciente
    } else {
        echo "<tr><td align=\"center\" colspan=\"13\"><b>No se encontraron resultados con el filtro seleccionado</b></td></tr>";
    }
} else {
    echo "<tr><td align=\"center\" colspan=\"13\"><b>Sin Datos</b></td></tr>";

}

?>
</tbody>

</table>
</section>
</div>

<?php
/*cierre else campo vacio }*/
?>
</div>


</table>
</div>
<!-- FIN TABLA PRINCIPAL -->

<div class="mcontent0">

</div>

<?php

include "../resources/Includes/BootstrapHTML5.php";
include "../resources/Includes/FormValidation.php";
include "../resources/Includes/DataTables.php";
include "../resources/Includes/BootstrapSelect.php";
?>


<!--Custom JS-->
<script src="../resources/JS/Develop/reporte_360.js"></script>
<script src="../resources/tableExport.jquery.plugin-master/libs/FileSaver/FileSaver.min.js"></script>
<script src="../resources/tableExport.jquery.plugin-master/tableExport.min.js"></script>
<script>
	var a = <?echo ($contador_ventas != "") ? $contador_ventas : 0;?>;
	var b = <?echo ($contador_unit != "") ? $contador_unit : 0;?>;
	var c = <?echo ($contador_paciente != "") ? $contador_paciente : 0;?>;
	var d = <?
	if ($contador_unit != 0) {
		echo $promedio_venta = ( $contador_unit / $contador_paciente);
	} else {
		echo 0;
	}
	 ?>

	fillTblDatos(a,b,c,d)
</script>



</body>
</html>