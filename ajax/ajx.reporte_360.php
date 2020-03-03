<?php
  
    require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;


if ($_GET["oper"] == 'j_meds') {
    $query_medicos = "SELECT
	distinct im.id_medico as ID,
	UPPER(CONCAT(me.Apellido, ', ', me.Nombre)) as nombre_med
	FROM soliris_maestro im
	LEFT JOIN
	medicos me on im.id_medico = me.Id where im.estado in('NP', 'Historico')";
    $result_medicos = mysqli_query($db, $query_medicos);
    while ($row_med = mysqli_fetch_assoc($result_medicos)) {
        //$var[] = "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.id_medico&inicial=" . $row_med[0]. "&lim=2&plus='><b>" . $row_med[1] . "</b></a></p>";
        $var[] = $row_med;
    }

    echo json_encode($var);
    mysqli_free_result($result_medicos);
}

if ($_GET["oper"] == 'j_inst') {
    $query_inst = "SELECT distinct im.institucion as inst_nom
		FROM soliris_maestro im where im.estado in('NP', 'Historico')";
    $result_inst = mysqli_query($db, $query_inst);
    while ($row_inst = mysqli_fetch_array($result_inst)) {
        //echo "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.institucion&inicial=" . $row_inst[0] . "&lim=2&plus='>" . fl_act("institucion", $row_inst[0]) . "</a></p>";
        $var[] = $row_inst;
    }
    echo json_encode($var);
    mysqli_free_result($result_inst);
}

if ($_GET["oper"] == 'j_can') {
    $query_can = "SELECT distinct im.canal as can_nom
					FROM soliris_maestro im where im.estado in('NP', 'Historico')";
    $result_can = mysqli_query($db, $query_can);
    while ($row_can = mysqli_fetch_array($result_can)) {
        //echo "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.canal&inicial=" . $row_can[0] . "&lim=2&plus='>" . fl_act("canal", $row_can[0]) . "</a></p>";
        $var[] = $row_can;
    }
    echo json_encode($var);
    mysqli_free_result($result_can);
}

if ($_GET["oper"] == 'j_apm') {
    $query_apm = "SELECT distinct im.apm FROM soliris_maestro im where im.estado in('NP', 'Historico')";
    $result_apm = mysqli_query($db, $query_apm);
    while ($row_apm = mysqli_fetch_array($result_apm)) {
        //echo "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.apm&inicial=" . $row_apm[0] . "&lim=2&plus='>" . fl_act("apm", $row_apm[0]) . "</a></p>";
        $var[] = $row_apm;
    }

    echo json_encode($var);
    mysqli_free_result($result_apm);
}

if ($_GET["oper"] == 'j_pat') {
    $query_pat = "SELECT distinct im.patologia as pat FROM soliris_maestro im where im.estado in('NP', 'Historico')";
    $result_pat = mysqli_query($db, $query_pat);
    while ($row_pat = mysqli_fetch_array($result_pat)) {
        //echo "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.patologia&inicial=" . $row_pat[0] . "&lim=2&plus='>" . fl_act("patologia", $row_pat[0]) . "</a></p>";
        $var[] = $row_pat;
    }
    echo json_encode($var);
    mysqli_free_result($result_pat);
}

if ($_GET["oper"] == 'j_dos') {
    $query_dos = "select valor as dosis from auxiliar where tipo='Dosis' order by valor asc";
    $result_dos = mysqli_query($db, $query_dos);
    while ($row_dos = mysqli_fetch_array($result_dos)) {
        //echo "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.dosis&inicial=" . $row_dos[0] . "&lim=2&plus='>" . fl_act("dosis", $row_dos[0]) . "</a></p>";
        $var[] = $row_dos;
    }

    echo json_encode($var);
    mysqli_free_result($result_dos);
}

if ($_GET["oper"] == 'j_uni') {
    $query_un = "select valor as uni from auxiliar where tipo='Unidades' order by valor asc";
    $result_un = mysqli_query($db, $query_un);
    while ($row_un = mysqli_fetch_array($result_un)) {
        //echo "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.Unidades&inicial=" . $row_un[0] . "&lim=2&plus='>" . fl_act("dosis", $row_un[0]) . "</a></p>";
        $var[] = $row_un;
    }

    echo json_encode($var);
    mysqli_free_result($result_un);
}

if ($_GET["oper"] == 'j_edad') {
    $query_edad = "select distinct edad as edad from soliris_maestro im where im.estado in('NP', 'Historico')";
    $result_edad = mysqli_query($db, $query_edad);
    while ($row_edad = mysqli_fetch_array($result_edad)) {
        //echo "<p><a href='reporte_360.php?tabla=soliris_maestro&campo=m.edad&inicial=" . $row_edad[0] . "&lim=2&plus='>" . fl_act("dosis", $row_edad[0]) . "</a></p>";
        $var[] = $row_edad;
    }

    echo json_encode($var);
    mysqli_free_result($result_edad);
}

if ($_GET["oper"] == 'j_year') {

    $query = "select year(fecha_venta) as f_venta from soliris_maestro group by year(fecha_venta)";
    $result_y = mysqli_query($db, $query);
    while ($row_year = mysqli_fetch_array($result_y)) {
        //echo "<a onclick=\"mostrarVal(this);\" href='reporte_360.php?tabla=soliris_maestro&campo=year(m.fecha_venta)&inicial=" . $row[0] . "&lim=2&plus=' title='Filtro por Año'>" . $row[0] . "</a><br/>";
        $var[] = $row_year;

    }

    echo json_encode($var);
    mysqli_free_result($result_y);
}

if ($_GET["oper"] == 'j_mes') {

	$ar_meses = array(
	1 => "Enero",
	2 => "Febrero",
	3 =>  "Marzo",
	4 =>  "Abril",
	5 =>  "Mayo",
	6 => "Junio", 
	7 => "Julio",
	8 => "Agosto",
	9 => "Septiembre",
	10 => "Octubre",
	11 => "Noviembre",
	12 => "Diciembre");

	echo json_encode($ar_meses);

}	
