'Option Explicit


'///////////////////////////////////
'PROGRAMA PARA VINCULAR LA INDICACION APROBADA EN SOLIRIS CON LA VENTA EN NP

'//////////////////////////////////
dim ob_conn
dim connectionString
dim fso, CurrentDirectory

SET Ob_Conn = CreateObject ("ADODB.Connection")
    'connectionString = "Driver={MySQL ODBC 3.51 Driver};Server=127.0.0.1;" & _
	connectionString = "Driver={MySQL ODBC 5.2w Driver};Server=127.0.0.1;" & _
                   "Database=CRM;User=root;" & _
                   "Password=cotonete;"
    Ob_Conn.Open connectionString

ob_conn.execute("insert into tareas set nombre='ctr_ventas.vbs', f_inicio=now(), resultado='En Proceso'")
set rs_id=ob_conn.execute("select id from tareas where nombre='ctr_ventas' and resultado='En Proceso'")
	if not rs_id.eof then last_id=rs_id(0)
set np_rs=ob_conn.execute("SELECT zso_rmks, zso_nbr FROM m_zso_mstr  RIGHT JOIN m_zsod_det ON zso_nbr=zsod_nbr WHERE zsod_part ='908378' ") 'and date(zsod_req_date)=date(now()) SUMAR ESTO
	do until np_rs.eof
		f_control np_rs(0), np_rs(1), last_id
	np_rs.movenext
	loop
	np_rs.close
	
ob_conn.execute("update tareas set  f_fin=now(), resultado='Finalizado' where nombre='ctr_ventas.vbs' and resultado='En Proceso'")	
sub f_control(rmks, nbr, id_trasa)
	'Presumo que el rmks tiene que poseer espacios
	'quito los "-"
		rmks=replace(rmks,"-"," ")
	if instr(rmks," ")>0 then
		
		'divido por la cantidad de espacios
		campo=split(rmks)
			'presumo que el primer campo del split es numerico
			if isnumeric(campo(0)) then 
				f_asigno campo(0),nbr
			else 'en este caso encontre un NP que no tiene el ID del paciente
				ob_conn.execute("insert into tareas_det set tarea='"&last_id&"', fecha=now(),resultado='Error Soliris "& nbr &" "& rmks&" ' ")
			end if
	end if
end sub

sub f_asigno(id,nbr)
		ob_conn.execute("update soliris.maestro_ventas set nbr='"&nbr&"',estado_id='23' where id='"&id&"' and estado_id='22'")
end sub
