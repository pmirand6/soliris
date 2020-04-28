'Option Explicit



'//////////////////////////////////
dim ob_conn
dim connectionString
dim objTextFile
dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")
Const ForAppending = 8
'solicito que ingrese un paciente, si no ingresa ninguno exporto todo

ruta ="C:\Users\dcilveti\OneDrive\Oficina\soliris\triggers\"


SET Ob_Conn = CreateObject ("ADODB.Connection")

	connectionString = "Driver={MySQL ODBC 5.2w Driver};Server=127.0.0.1;" & _
                   "Database=soliris;User=root;" & _
                   "Password=cotonete;"
    Ob_Conn.Open connectionString
	

carga= inputbox("Indique la tabla a auditar "&chr(13)&"""todas"" exporta todas las tablas definidas en el programa")
if carga="todas" then
		set tbl=ob_conn.execute("select tbl from soliris.audit_tablas")
			do until tbl.eof
				inicio tbl(0)
			tbl.movenext
			loop
			tbl.close
		'tb_array=array("paciente","apm", "canales","configuracion","especialidades","documentos","institucion","maestro_estado","maestro_ventas","mail_configuracion","medico","patologia","presentacion","rel_medico_especialidad","rel_paciente_documentos","rel_patologia_sub_patologia","rel_reguridad_rol","rel_venta_documentos","usuario")
	
	'for each tb_a in tb_array
	'	inicio tb_a
		
	'next
	


else
	'llamo a la tabla particuluar
	inicio carga

end if




sub inicio(tabla)

	if tabla="" then 
		msgbox "salida"
		wscript.quit
	end if
	
	
	'accion=inputbox("indique la accion")
	acc_array=array("update","insert","delete")



	for each accion in acc_array

		'msgbox "Ejecutar "& accion

		cab="/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;"&chr(13)&_
			"/*!40101 SET NAMES utf8 */;"&chr(13)&_
			"/*!50503 SET NAMES utf8mb4 */;"&chr(13)&_
			"/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;"&chr(13)&_
			"/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;"&chr(13)&_
			"SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';"&chr(13)&_
			"DELIMITER //"

		pie ="END//"&chr(13)&_
				"DELIMITER ;"&chr(13)&_
				"SET SQL_MODE=@OLDTMP_SQL_MODE;"&chr(13)&_
				"/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;"&chr(13)&_
				"/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;"&chr(13)&_
				"/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;"&chr(13)

		select case accion	
			case "update"
				cab=cab &"CREATE TRIGGER log_"&tabla&"_upd BEFORE "&ucase(accion)&"  ON "&tabla&" "&chr(13)&" FOR EACH ROW  BEGIN"&chr(13)
				Set objTextFile = objFSO.OpenTextFile(ruta&"trigger_"&tabla&"_upd.sql", ForAppending, true)
			case "insert"
				cab=cab &"CREATE TRIGGER log_"&tabla&"_inst BEFORE "&ucase(accion)&" ON "&tabla&" "&chr(13)&" FOR EACH ROW  BEGIN"&chr(13)
				Set objTextFile = objFSO.OpenTextFile(ruta&"trigger_"&tabla&"_inst.sql", ForAppending, true)
			case "delete"
				cab=cab &"CREATE TRIGGER log_"&tabla&"_del AFTER "&ucase(accion)&"  ON "&tabla&" "&chr(13)&" FOR EACH ROW  BEGIN"&chr(13)
				Set objTextFile = objFSO.OpenTextFile(ruta&"trigger_"&tabla&"_del.sql", ForAppending, true)
			case default
				msgbox "la accion no existe"
				wscript.quit
		end select

			set rs=ob_conn.execute("SELECT column_name FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'soliris' AND TABLE_NAME = '"&tabla&"';")
				do until rs.eof
					
					det=det & mk_update(rs(0),tabla, accion)
					
				rs.movenext
				loop

				rs.close

			
						
	
			objTextFile.WriteLine(cab & det &chr(13) & pie)
	
				det=""
				cab=""
			objTextFile.Close
		
	next	


end sub



	msgbox "fin"


function mk_update(campo, tabla, accion)

		select case accion
			case "update"
					det=det & " if old."& campo &"<>new."&campo&" then" &_
					" insert into "&_
					" soliris_log "&_
					" set  "&_
					" usuario=user(), "&_
					" fecha=now(), "&_
					" accion='"&accion&"', "&_
					" registro='"& campo &"', "&_
					" tabla='"&tabla &"', "&_
					" id_registro=old.id, "&_
					" valor_anterior=OLD."&campo &","&_
					" valor_nuevo=NEW."&campo&";"&_
					"End If;"
			case "insert"
					
					det=det & " insert into "&_
						"soliris_log "&_
						"set  "&_
						"usuario=user(), "&_
						"fecha=now(), "&_
						"accion='"&accion&"', "&_
						"registro='"& campo &"', "&_
						"tabla='"&tabla &"', "&_
						"id_registro=new.id, "&_
						"valor_nuevo=new."&campo &";"
						
						
			
			case "delete"
					det=det & " insert into "&_
						"soliris_log "&_
						"set "&_
						"usuario=user(),"&_
						"fecha=now(),"&_
						"accion='"&accion&"',"&_
						"registro='"& campo &"',"&_
						"tabla='"&tabla &"',"&_
						"id_registro=old.id,"&_
						"valor_anterior=old."&campo &";"
			
			
		end select
		mk_update=det
end function

function f_castdate(valor)

	if valor<>"" then
		if instr(valor,"/") then
			dd=split(valor,"/")
			salida=dd(2)&"-"&dd(1)&"-"&dd(0)
		else
			salida=""
		end if
		if instr(valor,"-") then
			dd=split(valor,"-")
			salida=dd(2)&"-"&dd(1)&"-"&dd(0)
		else
			salida=""
		end if
	else
		salida=""
	end if
	
	f_castdate=salida


end function



