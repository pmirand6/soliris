<?php



    
require_once('../config/config.php');
    //include $_SERVER['DOCUMENT_ROOT'] . _SG;
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
$nuevo="";
$pacientes="";
$paciente="";
$n_ventas = "";
$c_pat_tot = "";
$c_pacientes = "";
$usuario = "";
$consulta = "";
$ao_val = "";
$mes = "";
$nombre = "";
$boton = "";
$unit ="";
$where_p="";
$where="";

?>

<!DOCTYPE html>
<html>
<head>
	<title>Reportes</title>
	    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Include Bootstrap Datepicker */
            @import "../resources/Bootstrap-DatePicker/css/datepicker.css";
        /* Bootstrap Validator */
            @import "../resources/Bootstrap-Validator/CSS/formValidation.min.css";
        /* Custom CSS */
            /*@import "../resources/CSS/Develop/reporte_360.css";*/
             /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/reporte_filtros.css";
    </style>
</head>
<body>

	<!-- TABLA DE FILTROS -->
	<div align="center" align="left" class="mcontent0" id="busquedas" style="display:none;border:1px solid #CCCCAA; background-color:#FFFFFF; vertical-align:middle; text-align:left; padding: 3px;position: absolute ; width: 750; left: 13%;">
		<table class="table sortable" width="100%">
			<tr>
				<td>Fechas</td>
				<td>Tipo</td>
				<td>Medicos</td>
				<td>Institución</td>
				<td>Canal</td>
				<td>Apm</td>
				<td>Patologia</td>
				<td>Dosis</td>
				<td>Unidades</td>
				<td>Edad</td>
			</tr>
			<tr>
				<td valign="top">
					<table class="sortable" id="tab_meses_anio">
						<tr>
							<td>Mes</td>
							<td>Año</td>
						</tr>
						<tr>
							<td valign="top" class="lef">
								<?php 
								for ($i=1; $i<=12; $i++) {?>
								<a href="reporte_360.php?tabla=soliris_maestro&campo=month(m.fecha_venta)&inicial=<?php echo $i;?>&lim=2" title="Filtro por Mes"><?php echo $i;?></a><br/>
								<?php }
								?>
							</td>
							<td valign="top">
								<?php
								$query = "select year(fecha_venta) from soliris_maestro group by year(fecha_venta)";
								$result = mysqli_query($db, $query);
								while ($row = mysqli_fetch_array($result)) {
									echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=year(m.fecha_venta)&inicial=". $row[0] ."&lim=2' title='Filtro por Año'>". $row[0] ."</a><br/>";
								}
								?>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
					<table class="table sortable" id="tab_ri_fu">
						<tr>
							<td valign="top" class="lef">
								<a href="reporte_360.php?tabla=soliris_maestro&campo=m.tipo&inicial=RI&lim=2">RI</a>
							</td>
							<td>
								<a href="reporte_360.php?tabla=soliris_maestro&campo=m.tipo&inicial=FU&lim=2">FU</a><br/>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
					<table class="table sortable" id="tab_medicos">
						<tr>
							<td valign="top" class="lef">
								<?php
								$query_medicos = "select Nombre from medicos WHERE estado = 'Activo' order by nombre asc";
								$result_medicos = mysqli_query($db, $query_medicos);
								while ($row_med = mysqli_fetch_array($result_medicos)) {?>
								<a href="reporte_360.php?tabla=soliris_maestro&campo=m.medico&inicial=<?=$row_med[0];?>&lim=2"><?=fl_act("medico",$row_med[0]);?></a><br/><?php
							}
							mysqli_free_result($result_medicos);
							?>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table class="table sortable" id="tab_inst">
					<tr>
						<td valign="top">
							<?php
							$query_inst = "select Nombre from institucion order by nombre asc";
							$result_inst = mysqli_query($db, $query_inst);
							while ($row_inst = mysqli_fetch_array($result_inst)) {
								echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=m.institucion&inicial=". $row_inst[0] ."&lim=2'>". fl_act("institucion", $row_inst[0]) . "</a><br/>";
							}
							mysqli_free_result($result_inst);
							?>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table class="table sortable" id="tab_canal">
					<tr>
						<td valign="top" class="lef">
							<?php
							$query_can = "SELECT canal 	FROM canales order by canal asc";
							$result_can = mysqli_query($db, $query_can);
							while ($row_can = mysqli_fetch_array($result_can)) {
								echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=m.canal&inicial=". $row_can[0] ."&lim=2'>". fl_act("canal", $row_can[0]) . "</a><br/>";
							}
							mysqli_free_result($result_can);
							?>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table class="table sortable" id="tab_apm">
					<tr>
						<td valign="top" class="lef">
							<?php
							$query_apm = "select nombre from apm order by nombre asc";
							$result_apm = mysqli_query($db, $query_apm);
							while ($row_apm = mysqli_fetch_array($result_apm)) {
								echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=m.apm&inicial=". $row_apm[0] ."&lim=2'>". fl_act("apm", $row_apm[0]) . "</a><br/>";
							}
							mysqli_free_result($result_apm);?>
						</td>
					</tr>

				</table>
			</td>
			<td valign="top">
				<table class="table sortable" id="tab_pat">
					<tr>
						<td valign="top" class="lef">
							<?php
							$query_pat = "select patologia from patologias order by patologia asc";
							$result_pat = mysqli_query($db, $query_pat);
							while ($row_pat = mysqli_fetch_array($result_pat)) {
								echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=m.patologia&inicial=". $row_pat[0] ."&lim=2'>". fl_act("patologia", $row_pat[0]) . "</a><br/>";
							}
							mysqli_free_result($result_pat);
							?>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table class="table sortable" id="tab_dos">
					<tr>
						<td valign="top" class="lef">
							<?php
							$query_dos = "select valor from auxiliar where tipo='Dosis' order by valor asc";
							$result_dos = mysqli_query($db, $query_dos);
							while ($row_dos = mysqli_fetch_array($result_dos)) {
								echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=m.dosis&inicial=". $row_dos[0] ."&lim=2'>". fl_act("dosis", $row_dos[0]) . "</a><br/>";
							}
							mysqli_free_result($result_dos);
							?>
						</td>
					</tr>

				</table>
			</td>
			<td valign="top">
				<table class="table sortable" id="tab_uni">
					<tr>
						<td valign="top" class="lef">
							<?php
							$query_un = "select valor from auxiliar where tipo='Unidades' order by valor asc";
							$result_un = mysqli_query($db, $query_un);
							while ($row_un = mysqli_fetch_array($result_un)) {
								echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=m.Unidades&inicial=". $row_un[0] ."&lim=2'>". fl_act("dosis", $row_un[0]) . "</a><br/>";
							}
							mysqli_free_result($result_un);
							?>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table class="table sortable" id="tab_edad">
					<tr>
						<td valign="top" class="lef">
							<?php
							$query_edad = "select valor from auxiliar where tipo='Unidades' order by valor asc";
							$result_edad = mysqli_query($db, $query_edad);
							while ($row_edad = mysqli_fetch_array($result_edad)) {
								echo "<a href='reporte_360.php?tabla=soliris_maestro&campo=m.edad&inicial=". $row_edad[0] ."&lim=2'>". fl_act("dosis", $row_edad[0]) . "</a><br/>";
							}
							mysqli_free_result($result_edad);
							?>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<!-- FIN TABLA DE FILTROS -->

<!-- TABLA PRINCIPAL -->
<div class="mcontent0">
	<table border="0" width="90%" class="table sortable" align="center">
		<tr>
			<td colspan="20" class="lef">
				<a href="#" onclick="show('busquedas')">
					<img src="../resources/IMG/filtrar.png" border=0 title="Filtrar"/>
				</a>
				<?php if (!empty($_GET["campo"]) AND isset($_GET["campo"])){?>
				<img src="../resources/IMG/Unit completed.png" title="Guardar consulta" onclick="show('consulta')" />
				<img src="../resources/IMG/Surveys.png" title="Exportar a Excel" onclick="ventana('soliris_excel.php?campo=<?= $_GET["campo"];?>&inicial=<?= $inicial;?>&plus=<?= $plus;?>&valores=<?= $_GET["valores"];?>')"/>
				<?php }?>
				<img src="../resources/IMG/Folder Accept.png" title="Consultas Guardadas" onclick="show('c_guardadas')"/>
				<p id="cant" class="mhead">
					<img  width="16" height="16" align="absbottom" />
				</p>
				<div id="consulta" style="display:none; border:1px solid #CCCCAA; background-color:#FFFFFF; vertical-align:middle; text-align:left; padding:3px; position: absolute; width: 750; left: 13%;">
					<form method="post" name="cons" action="reporte_360.php">
						<p>
							Ingrese el nombre con el eque se guardara la consulta: <input type="text" name="nombre"/>
						</p>
						<?php 
						echo "<input type='hidden' name='consulta' value=" . $_GET["campo"] . "' = * ' " . $inicial . " '*' " . "AND" . $plus . "/>";
						?>
						<input type="submit" name="boton" value="Guardar"/>
					</form>
				</div>
				<div id="c_guardadas" style="display: none;border: 1px solid #CCCCAA; background-color:#FFFFFF;vertical-align: middle;text-align: left;padding: 3px;position: absolute;width: 750;left: 13%;">
					<table class="table" border="0" class="sortable">
						<tr>
							<td class="right">Usuario</td>
							<td class="right">Nombre</td>
						</tr>
						<?php
						$query_con = "SELECT * FROM soliris_consultas";
						$result_con = mysqli_query($db, $query_con);
						while ($row_con = mysqli_fetch_assoc($result_con)){?>
						<tr>
							<td class="lef"><?=$row_con["usuario"];?></td>
							<td class="lef"><a href="reporte_360.php?campo=0&valores=<?=$row_con["usuario"];?>"><?=$row_con["nombre"];?></a></td>
						</tr>
						<?php
					} mysqli_free_result($result_con);?>
				</table>
			</div>
		</td>
	</tr>
</table>
<table class="table" border=1 rules=all cellspacing="2" cellpadding="5" >
	<tr bgcolor="#999999" >
		<td class="titulo">
			Nombre, Apellido 
		</td>
		<td class="titulo">
			Edad
		</td>
		<td class="titulo">
			Sexo
		</td>
		<td class="titulo">
			Fecha de Venta
		</td>
		<td class="titulo">
			Patologia
		</td>
		<td class="titulo">
			Canal
		</td>
		<td class="titulo">
			Institucion
		</td>
		<td class="titulo">
			Medico
		</td>
		<td class="titulo">
			Dosis
		</td>
		<td class="titulo">
			Unidades
		</td>
		<td class="titulo">
			APM
		</td>
		<td class="titulo">
			Tipo
		</td>
		<td class="titulo">
			C. Antención
		</td>
	</tr>

<?php
if (isset($_GET["plus"]) AND !empty($_GET["plus"])) {

  $v_plus = $_GET["plus"];
  $v_plus = str_replace(";", "", $v_plus);
  $v_plus = str_replace("|","'", $v_plus);
}

$cant = 0;

if (isset($_GET["campo"]) AND !empty($_GET["campo"])) {
	$campo = $_GET["campo"];
}

if (isset($_GET["inicial"]) AND !empty($_GET["inicial"])) {
	$inicial = $_GET["inicial"];
}


/*Analisis del WHERE para el paciente*/
			if (strcasecmp($campo, '0') == 0) {

			 $where_p="FROM soliris_maestro as m
							LEFT JOIN
								pacientes as p
							ON
								p.id = m.nombre
							LEFT JOIN 
								medicos as me
							ON
								m.medico=me.nombre 
							WHERE 
								m.estado in('NP', 'Historico') 
							$v_plus
							group by p.id
							order by p.nombre asc";
				} else {
					if (isset($_GET["inicial"])) {
						
					
					$inicial_split = str_replace("_", " ",$_GET["inicial"]);
					if (strcasecmp($campo, 'p.edad') == 0) {
						
						$where_p="FROM 
									soliris_maestro as m
								LEFT JOIN
									pacientes as p
								ON
									p.id = m.nombre
								LEFT JOIN 
									medicos as me
								ON
									m.medico=me.nombre 
								WHERE 
									m.estado in('NP', 'Historico') 
								AND
									DATE_FORMAT(FROM_DAYS(TO_DAYS(now())-TO_DAYS(p.fecha_nac)),'%Y')+0='".$inicial_split."'
									$v_plus
								group by p.id
								ORDER by
									p.nombre asc";
					 } else {

					 	$where_p="FROM 
									soliris_maestro as m
								LEFT JOIN
									pacientes as p
								ON
									p.id = m.nombre
								LEFT JOIN 
									medicos as me
								ON
									m.medico=me.nombre 
								WHERE 
									m.estado in('NP', 'Historico') 
							  	AND
							  		$campo = '".$inicial_split."' $v_plus 
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

$result_pac_v = mysqli_query($db, $query_pac_v);

if ($result_pac_v){

while ($row_pac_v = mysqli_fetch_assoc($result_pac_v)) {

	$id_pac = $row_pac_v["id"];


if (!empty($campo)) {

		/*Analisis del WHERE*/
			if (strcasecmp($campo, '0') == 0) {

			 $where="FROM soliris_maestro as m
							LEFT JOIN
								pacientes as p
							ON
								p.id = m.nombre
							LEFT JOIN 
								medicos as me
							ON
								m.medico=me.nombre 
							WHERE 
								m.estado in('NP', 'Historico') 
							AND
								m.nombre = $id_pac $v_plus
							order by p.id asc";
				} else {
					$inicial_split = str_replace("_", " ",$_GET["inicial"]);
					if (strcasecmp($campo, 'p.edad') == 0) {
						
						$where="FROM 
									soliris_maestro as m
								LEFT JOIN
									pacientes as p
								ON
									p.id = m.nombre
								LEFT JOIN 
									medicos as me
								ON
									m.medico=me.nombre 
								WHERE 
									m.estado in('NP', 'Historico') 
								AND
									m.nombre = $id_pac
								AND
									DATE_FORMAT(FROM_DAYS(TO_DAYS(now())-TO_DAYS(p.fecha_nac)),'%Y')+0='".$inicial_split."'
									$v_plus
								ORDER by
									p.id asc";
					 } else {

					 	$where="FROM 
									soliris_maestro as m
								LEFT JOIN
									pacientes as p
								ON
									p.id = m.nombre
								LEFT JOIN 
									medicos as me
								ON
									m.medico=me.nombre 
								WHERE 
									m.estado in('NP', 'Historico') 
								AND
									m.nombre = $id_pac
							  	AND
							  		$campo = '".$inicial_split."' $v_plus 
							  	ORDER BY 
							  		p.id asc";
					 }	
				}




		$sel = "SELECT 
					m.canal, /*0*/
					m.institucion, /*1*/ 
					m.fecha_venta, /*2*/ 
					m.medico, /*3*/ 
					m.dosis, /*4*/ 
					m.unidades, /*5*/ 
					m.edad, /*6*/ 
					m.apm, /*7*/ 
					m.tipo, /*8*/ 
					m.nombre, /*9*/ 
					m.estado, /*10*/ 
					m.id,/*11*/ 
					me.c_atencion /*12*/ 
					 $where";
				

	

$result_sel = mysqli_query($db, $sel);

while ($m = mysqli_fetch_array($result_sel)){
	$cant = $cant+1;
	$timestamp = strtotime($m[2]);
    $day = date("d", $timestamp);
    $month = date("m", $timestamp);
    $year = date("Y", $timestamp);
    $nom = $m[9];

?>
	 </tr>
	 <td>
		<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.edad=|<?=$m[6];?>|;<?=$plus;?>"><?=$row_pac_v["pac_nom"]?></a>
	 </td>	
	 <td class="lef">
		<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.edad=|<?=$m[6];?>|;<?=$plus;?>"><?=$m[6];?></a>
		</td>
		<td class="lef">
		<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20p.Sexo=|<?=$row_pac_v["pac_sexo"];?>|;<?=$plus;?>"><?=$row_pac_v["pac_sexo"];?></a>
		</td>
        <td class="lef">
			<?=$day;?>
		    /<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&lim=3&plus=%20and%20month(m.fecha_venta)=|<?=$month;?>|;<?=$plus;?>" title="Filtro por Mes"><?=$month;?></a>
		    /<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&lim=3&plus=%20and%20year(m.fecha_venta)=|<?=$year;?>|;<?=$plus;?>" title="Filtro por Año"><?=$year;?></a>
		</td>
		<td class="lef">
		    <a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20p.patologia=|<?=$row_pac_v["pac_pat"];?>|;<?=$plus;?>"><?=$row_pac_v["pac_pat"];?></a>
		</td>
		<td class="lef">
		    <a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.canal=|<?=$m[0];?>|;<?=$plus;?>"><?=$m[0];?></a>
		</td>
		<td class="lef">
			<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.institucion=|<?=$m[1];?>|;<?=$plus;?>"><?=$m[1];?></a>
		</td>
		<td class="lef">
			<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.medico=|<?=$m[3];?>|;<?=$plus;?>"><?=$m[1];?></a>
		</td>
		<td class="lef">
			<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.dosis=|<?=$m[4];?>|;<?=$plus;?>"><?=$m[4];?></a>
		</td>
		<td class="lef">
			<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.unidades=|<?=$m[5];?>|;<?=$plus;?>"><?=$m[5];?></a>
		</td>
	    <td class="lef">
			<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.apm=|<?=$m[7];?>|;<?=$plus;?>"><?=$m[7];?></a>
		</td>
		<td class="lef">
			<a href="reporte_360.php?tabla=soliris_maestro&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20m.tipo=|<?=$m[8];?>|;<?=$plus;?>"><?=fl_tipo_rep($m[8]);?></a>
		</td>
		<td class="lef">
			<a href="reporte_360.php?tabla=medicos&campo=<?=$campo;?>&inicial=<?=$inicial;?>&lim=3&plus=%20and%20me.c_atencion=|<?=$m[12];?>|;<?=$plus;?>"><?=$m[12];?></a>
		</td>


<?php    
	switch ($m[5]) {
		case '21':
			$unit= $unit + 1;
			break;
		case '42':
			$unit= $unit + 2;
			break;
		case '63':
			$unit= $unit + 3;
			break;
		
	}

}
	



echo "<tr bgcolor=\"silver\"><td colspan=\"13\">Cantidad de ventas: ".$row_pac_v["cuenta_id"]." Cantidad de unidades Vendidas: ". $unit ." Cantidad de Comprimidos: ". $row_pac_v["suma_unidades"] ."</td></tr>";

}
} //<-- end while paciente
}
?>


</table>


	


<table class="table sortable" align="center" width="50%">

	<tr>
		<td class="right">
			Panel de Control
		</td>
	</tr>
	<tr>
		<td>Año</td>
		<td>Unidades QAD<sup>2</sup></td>
		<td>Total de pacientes</td>
		<td>Ventas por RI<sup>1</sup></td>
		<td>Ventas por FU<sup>1</sup></td>		
	</tr>
	<?php
		//DETERMINO CUANTOS AÑOS TIENE LA BASE
		$query_anios = mysqli_query($db, "select distinct year(fecha_venta) from soliris_maestro order by fecha_venta asc");
		if ($query_anios) {
			while ($ao = mysqli_fetch_array($query_anios)) {?>
				<tr onmouseover="this.style.background='#D9E68E';"onmouseout="this.style.background='white';"><?php
                echo "<td class=lef>". $ao[0] ."</td>";
		

		//CUENTO UNIDADES QAD EN EL AÑO
		$query_can = "select count(unidades), unidades from soliris_maestro where year(fecha_venta)= '$ao[0]' and estado in ('NP', 'Historico') group by unidades";
		$result_can = mysqli_query($db, $query_can);

			while ($can = mysqli_fetch_array($result_can)) {
				switch ($can[1]) {
                    case '21':
                    $c_pat_tot= $c_pat_tot + (number_format($can[0],0) * 1);
                    break;
                    case '42':
                    $c_pat_tot= $c_pat_tot + (number_format($can[0],0) * 2);
                    break;
                    case '63':
                    $c_pat_tot= $c_pat_tot + (number_format($can[0],0) * 3);
                    break;
                }
			}
		

			echo "<td class=lef>" . $c_pat_tot ."</td>";
            $c_pat_tot = 0;

		//CUENTO PACIENTES ACTIVOS EN EL AÑO
		if ($query_pac = mysqli_query($db, "select count(id) from soliris_maestro where year(fecha_venta)='$ao[0]' and estado in ('NP','Historico') group by nombre")){
			while ($pac = mysqli_fetch_array($query_pac)) {
				$c_pacientes = $c_pacientes + 1;
			}
		}

			echo "<td class=lef>" . $c_pacientes . "</td>";
         	$c_pacientes=0;

        //CUENTO TIPOLOGIAS EN EL AÑO

        	$query_ri = mysqli_query($db, "select count(tipo) from soliris_maestro  where year(fecha_venta)='$ao[0]' and tipo='RI' and estado in ('NP','Historico') group by tipo");
            $query_fu = mysqli_query($db, "select count(tipo) from soliris_maestro  where year(fecha_venta)='$ao[0]' and tipo='FU' and estado in ('NP','Historico') group by tipo");

            while ($ri = mysqli_fetch_array($query_ri)) {
            	echo "<td class=lef>" . $ri[0] . "</td>";
            }

             while ($fu = mysqli_fetch_array($query_fu)) {
            	echo "<td class=lef>" . $fu[0] . "</td>";
            }

            
		}
	}

	?>
	
</table>
<br>
<div class="box">
	<sup>1</sup> Las operaciones contabilizadas como RI o FU son independientes de la cantidad de unidades QAD vendidas en cada operacion. Si en la operacion de venta se
	vendieron 42 unidades del producto, la operacion es 1, ya que se refleja la acción de venta y no las unidades vendidas.<br />
	<sup>2</sup> Se contabiliza la cantidad de unidades vendidas en la operacion, si se vendio 21 unidades se contabiliza como 1 unidad, para 42 unidades como 2 y para 63 como 3. La sumatoria de estos valores da la cantidad unidades QAD (caja) vendidas.<br />

	NOTA: la suma de los RI y FU debe siempre dar inferior a la cantidad de unidades QAD.
</div>

<table class="table sortable" align="center">
	<form method=post name=fv action="reporte_360.php">
		<tr>
			<td>Ventas del Mes</td>

			<tr>
				<td>
				<select name="mes">
					<?php
						for ($i=1; $i <=12 ; $i++) { 
							echo "<option value='" . $i . "" . f_p_selected($i, date('m')). ">" . get_month() . "</option>";
						}
					 ?>				
				</select>
				 <select name="ao">
	                   <?php 
		                   $res_years = mysqli_query($db, "select distinct year(fecha_venta) from soliris_maestro order by fecha_venta asc");
							while ($row_years = mysqli_fetch_array($res_years)) {
								echo "<option value='" . $row_years[0] . "' f_p_selected($i, date('Y')) ". $row_years[0] . ">". $row_years[0] . "</option>";
							}
	                	?>
	            </select>
	            <input type=submit name="boton" value="Generar" />
	            </td>
            </tr>
		</tr>
	</form>

	<?php 
	if (isset($_POST["boton"])) {
		if(strcasecmp($_POST["boton"], 'Generar') == 0){?>
			<tr>
				<td colspan=2>
					<a href="soliris_reporte_fv.php?ao=<?=$_POST["ao"];?>&mes=<?=$_POST["mes"];?>">
						<img src="resources/img/Excel.png" border=0 />Exportar FV
					</a>
					<a href="soliris_reporte_xls.php?ao=<?=$_POST["ao"];?>&mes=<?=$_POST["mes"];?>">
						<img src="resources/img/Excel.png" border=0 />Exportar
					</a>
				</td>
			</tr>
	        <tr>
	        	<td colspan=5>Informe del mes de <?=get_month();?> de <?=$_POST["ao"];?></td>
	        </tr>
    <?php
		}
	}
	?>
	<tr bgcolor="#999999">
		<td class="titulo">Registro</td>
        <td class="titulo">Paciente</td>
        <td class="titulo">Sexo</td>
        <td class="titulo">Venta</td>
        <td class="titulo">C. Gestar</td>
        <td class="titulo">Edad</td>
        <td class="titulo">Medico</td>
        <td class="titulo">Dosis</td>
        <td class="titulo">Unidad</td>
        <td class="titulo">Patologia</td>
        <td class="titulo">institución</td>
        <td class="titulo">canal</td>
        <td class="titulo">APM</td>
        <td class="titulo">C. Atención</td>
        <td class="titulo">Tipo</td>
	</tr>  
    <?php

    $mes_val = "";
    $nom_val = "";

    if (isset($_POST["ao"])) {
            $ao_val = $_POST["ao"];
        }

        if (isset($_POST["mes"])) {
            $mes_val = $_POST["mes"];
        }

        if (isset($_POST["nombre"])) {
            $nom_val = $_POST["nombre"];
        }

        if (isset($_POST["boton"])) {
        	$boton = $_POST["boton"];
        }

    
    	if(strcasecmp($boton, 'Generar') !== 0){
    		$sql= "SELECT 
    				m.id, 
    				p.nombre,
    				p.sexo,
    				m.fecha_venta,
    				p.c_gestar,
    				m.edad,
    				m.medico,
    				m.dosis,
    				m.unidades, 
    				m.patologia, 
    				m.institucion, 
    				m.canal,
    				m.id,
    				m.APM, 
    				me.c_atencion, 
    				m.tipo  
    				from 
    					soliris_maestro as m 
    				LEFT JOIN 
    					pacientes as p ON (m.nombre = p.id) 
    				LEFT JOIN medicos as me ON (m.medico = me.nombre) 
    				where 
    					m.medico=me.nombre 
    				and 
    					p.estado='Aprobado' 
    				and 
    					year(m.fecha_venta) = year(now()) 
    				and 
    					month(m.fecha_venta) = month(now()) 
    				and 
    					m.nombre=p.id 
    				and 
    					m.estado not in('Operacion Cancelada', 'eliminado' ,'Paciente Fallecido','Cancela Paciente') 
    				AND 
    					me.estado = 'Activo' 
    				order by m.id asc";
    	} else {
    		$sql="
    		SELECT 
    			m.id, 
    			p.nombre,
    			p.sexo,
    			m.fecha_venta,
    			p.c_gestar,
    			m.edad,
    			m.medico,
    			m.dosis,
    			m.unidades, 
    			m.patologia, 
    			m.institucion, 
    			m.canal, 
    			m.id,
    			m.apm, 
    			me.c_atencion, 
    			m.tipo  
    		from 
    			soliris_maestro as m 
    		LEFT JOIN 
    			pacientes as p ON (m.nombre = p.id) 
    		LEFT JOIN 
    			medicos as me ON (m.medico = me.nombre) 
    		where 
    			m.medico=me.nombre 
    		and 
    			p.estado='Aprobado' 
    		and  
    			year(m.fecha_venta) = '$ao_val'
    		and 
    			month(m.fecha_venta) = '$mes_val'
    		and 
    			m.nombre=p.id 
    		and 
    			m.estado not in('Operacion Cancelada', 'eliminado' ,'Paciente Fallecido','Cancela Paciente') 
    		AND 
    			me.estado = 'Activo' 
    		order by m.id asc";
    	}
    

    if ($query_v = mysqli_query($db, $sql)) {
    	while ($v = mysqli_fetch_array($query_v)) {?>
    		<tr onmouseover="this.style.background='#D9E68E'; " onmouseout="this.style.background='white';">
    	<?php

    		for ($i=0; $i <= 11 ; $i++) { 
    			echo "<td class=lef>" .  strtoupper($v[$i]) . "</td>";
    		}

    		echo "<td class=lef>". strtoupper($v[13]) . "</td>";
            echo "<td class=lef>". strtoupper($v[14]) . "</td>";
            echo "<td class=lef>". fl_tipo_rep(strtoupper($v[15])) . "</td>";

    	}
    }
    ?>
</tr>
</table>
<?php
/*cierre else campo vacio }*/
?>
</div>

<?php
	
if (isset($_POST["boton"])){
	$usuario = $_SESSION["soliris_usuario"];
	if (isset($_POST["consulta"])) {
  		 $consulta = str_replace("'","*",$_POST["consulta"]);
	}	
    	if(strcasecmp($_POST["boton"], 'Guardar') == 0){
    		$inst = mysqli_query($db, "insert into soliris_consultas set usuario='$usuario', consulta='$consulta', nombre='$nom_val'");
    	}?>

    	<script type="text/javascript">
    		alert("La consulta fue guardada");
    	</script>
<?php

} 

?>


</table>
</div>
<!-- FIN TABLA PRINCIPAL -->

<div class="mcontent0">
	
</div>


<script type="text/javascript">
	function ventana(file) {
		window.open(file, "", "resizable, dependent = no,scrollbars=yes, status = no, toolbar = no, resizable=yes, location = no, menu = no, width= 700, height= 500");
	}
</script>
<script type="text/javascript">
	function show(equipo) {
		var objeto = document.getElementById(equipo);
		if (objeto.style.display == "none") {
			objeto.style.display = "";
		} else {
			objeto.style.display = "none";
		}
	}

	function n_show(equipo) {
		var objeto = document.getElementById(equipo);
		if (objeto.style.display == "") {

			objeto.style.display = "none";
		}
	}
</script>
</body>
</html>