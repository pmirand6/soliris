<?php


require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;

if (strcasecmp($_POST["oper"],'getMed') == 0) {
	$query = "select 
	m.id as id,
	UCASE(m.Apellido) as ape,
	UCASE(m.Nombre) as nom, 
	m.m_nac as m_nac,
	m.m_prov as m_prov,
	IFNULL(UCASE(a.nombre), \"<b style='color: red;'>SIN APM</b>\") as apm_nom,
	IFNULL(a.id, 0) as apm_id
	from medicos m 
	LEFT JOIN
	  apm as a
	ON 
	  a.id = m.apm
	where m.id_meditec is null or m.id_meditec = 0 
	order by ape";

	$result = mysqli_query($db, $query);

	while($obj = mysqli_fetch_object($result)) {
		$var["data"][] = $obj;
	}

	echo json_encode($var);
}

if (strcasecmp($_POST["oper"],'getMed_Med') == 0) {
	$query_med = "select 
		m.id as id,
		UCASE(m.apellido) as ape,
		UCASE(m.nombre) as nom, 
		m.m_nac as m_nac,
		m.m_prov as m_prov,
		UCASE(a.nombre) as apm_nom,
		a.id as apm_id
	from tmp_med as m 
		LEFT JOIN
			apm as a
		ON 
			a.id = m.apm_id
		LEFT JOIN medicos med
		ON med.id_meditec = m.id
		WHERE med.id_meditec is null
	order by ape";

	$result_med = mysqli_query($db, $query_med);

	while($obj = mysqli_fetch_object($result_med)) {
		$var["data"][] = $obj;
	}


	echo json_encode($var);
}

if(isset($_POST["oper"]) AND $_POST["oper"] == "up_med"){
	

    /* Seteo de variables */
       
	    $m_id = mysqli_real_escape_string($db, $_POST["m_id"]);
		$m_ape = mysqli_real_escape_string($db, $_POST["m_ape"]);
		$m_nom = mysqli_real_escape_string($db, $_POST["m_nom"]);
		$m_m_n = mysqli_real_escape_string($db, $_POST["m_m_n"]);
		$m_m_p = mysqli_real_escape_string($db, $_POST["m_m_p"]);
		$m_apm_id = mysqli_real_escape_string($db, $_POST["m_apm_id"]);
		$id_meditec = mysqli_real_escape_string($db, $_POST["id_meditec"]);


    /* -------------- */

        $SQL = "UPDATE medicos
				SET
					Apellido = '$m_ape',
					Nombre = '$m_nom',
					id_meditec = $id_meditec,
					m_nac= $m_m_n,
					m_prov= $m_m_p,
					apm = '$m_apm_id'
				WHERE 
					id = $m_id";

    /* Realizo la consulta */
    if (isset($SQL) AND $SQL != ""){
        // echo $SQL;
            $response = MySQL_sendQueryAudit("$SQL", "diff_med.php");
            if (strcasecmp("$response", "OK") == 0) {
            	echo "Se realizó la actualización del médico: " . $m_ape . ' ' . $m_nom;
            } else {
            	echo("$response");
            }
    }
    mysqli_close($db);
}

