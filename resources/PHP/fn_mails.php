<?php
	//include_once $_SERVER['DOCUMENT_ROOT'] . 'resources/PHP/PHPMailer_5.1/class.phpmailer.php';
    
    include dirname(__FILE__) . '/db.php';
    include_once $_SERVER['DOCUMENT_ROOT'] . '/' . _NAME .'/resources/PHP/PHPMailer_5.1/class.phpmailer.php';
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;


    function sendMailPM($estadoPac, $paciente, $id, $nota){
        include dirname(__FILE__) . '/db.php';

        switch ($estadoPac){
            case "Pendiente":
                $titulo = "soliris - Autorización requerida para venta de soliris";
                $cuerpo = "Se ha cargado un nuevo pedido para el paciente $paciente que requiere su autorización";
                $grupo = " WHERE grupo = 'FV'";
                break;
            case "Documentacion":
                $titulo = "soliris - Venta en estado Documentación ";
                $cuerpo = "La venta para el paciente $paciente quedó pendiente de Documentación. Motivo: $nota";
                $grupo = " WHERE (grupo = 'FV' OR grupo = 'VENTAS')";
                break;
			case "Autorizado":
                $titulo = "soliris - Autorización de venta de soliris realizada";
                $cuerpo = "Se ha autorizado el pedido del paciente $paciente.";
                $grupo = " WHERE (grupo = 'VENTAS' OR grupo = 'MARKETING')";
                break;
            case "NP":
                $titulo = "soliris - Autorización generada para venta de soliris";
                $cuerpo = "Se ha autorizado la venta #$id requerida para el paciente: $paciente";
                $grupo = " WHERE (grupo = 'VENTAS' OR grupo = 'MARKETING')";
								
                break;
            case "Rechazado":
                $titulo = "soliris - Autorización rechazada de la venta de soliris";
                $cuerpo = "Se ha rechazado un pedido de autorización de venta al paciente: $paciente. Motivo: $nota";
                $grupo = " WHERE (grupo = 'VENTAS' OR grupo = 'MARKETING')";
                break;
            case "Postergado":
                $titulo = "soliris - Venta Postergada";
                $cuerpo = "Se ha postergado un pedido de autorización de venta al paciente: $paciente. Motivo: $nota";
                $grupo = " WHERE (grupo = 'VENTAS' OR grupo = 'FV')";
                break;
            case "Consentimiento":
                $titulo = "soliris - Paciente con Consentimiento pendiente";
                $cuerpo = "Se ha dado de alta el paciente $paciente al cual le falta el consentimiento firmado";
                $grupo = " WHERE grupo = 'VENTAS'";
                break;
            case "Paciente Pendiente":
                $titulo = "soliris - Paciente nuevo pendiente de aprobacion";
                $cuerpo = "Nuevo paciente pendiente de aprobacion: $paciente.";
                $grupo = " WHERE grupo = 'FV'";
                break;
            case "Paciente Rechazado":
                $titulo = "soliris - Alta de Paciente Rechazada";
                $cuerpo = "Se ha rechazado un paciente verifique la nota colocada para: $paciente. Motivo: $nota";
                $grupo = " WHERE (grupo = 'VENTAS' OR grupo = 'MARKETING')";
                break;
            case "Paciente Aprobado":
                $titulo = "soliris - Alta de Paciente Aceptada";
                $cuerpo = "Se ha dado de alta el paciente : $paciente";
                $grupo = " WHERE (grupo = 'VENTAS' OR grupo = 'MARKETING')";
                break;
            case "Venta Modificada":
                $titulo = "soliris - Modificación de fecha de venta";
                $cuerpo = "Se ha modificado la fecha de venta del paciente: $paciente";
                $grupo = " WHERE grupo = 'FV' ";
                break;
        }

        
        #$SQL = "SELECT distinct mail FROM soliris_usuarios $grupo and estado='Activo';";  //dc001
        $SQL = "SELECT GROUP_CONCAT(DISTINCT u.email) AS mail FROM usuario u WHERE u.rol_id = (SELECT r.id FROM rol r WHERE r.nombre = LOWER('FV')) AND u.estado_id = 1";  //PGM002
        $result = mysqli_query($db, $SQL);
        $destino = "";
        while ($row = mysqli_fetch_assoc($result)) {
            #$destino .= $row["mail"] . ",";
            $destino = $row["mail"];
        };

        mysqli_free_result($result);
        mysqli_close($db);

                
        //sendMail(trim($destino, ","), $titulo, $cuerpo);
        sendMail($destino, $titulo, $cuerpo);
    }


    function sendMail($to, $subject, $html){

			$mail = new PHPMailer();
			$mail->CharSet = 'UTF-8';

			//Luego tenemos que iniciar la validación por SMTP:
			$mail->IsSMTP();
			$mail->SMTPAuth = false;
			#$mail->Host = "192.168.0.33"; 											// SMTP a utilizar.
			#$mail->Host = "192.168.0.106"; 											// SMTP a utilizar.
			$mail->Host = "192.168.0.66"; 											// SMTP a utilizar.
			$mail->Username = "raffo/cron"; 												// Correo completo a utilizar
			$mail->Password = "cron2014"; 											// Contraseña
			$mail->Port = 25; 														// Puerto a utilizar

			$mail->From = "cron@raffo.com.ar"; 													// Desde donde enviamos (Para mostrar)
			$mail->FromName = "Servicio soliris";
			//$to='dcilveti@raffo.com.ar';
            //$to='pmiranda@raffo.com.ar';
	        //$cco='pmiranda@raffo.com.ar';
			//$mail->AddAddress($to); 						                        // Esta es la dirección a donde enviamos ( $mail->AddAddress('lucas.masiello@inx3.com.ar', $userTo); )
			$to_array = explode(',', $to);											//Se define esta nueva funcion para el envio a mltiples direcciones
			foreach($to_array as $address)
			{
				$mail->addAddress($address, '');
			}
			$mail->IsHTML(true); 													// El correo se envía como HTML

			$mail->Subject = $subject; 												// Este es el titulo del email.
			$mail->Body = $html; 													// Mensaje a enviar
			$mail->AddBCC($cco);
			$exito = $mail->Send(); 												// Envía el correo.

			//También podríamos agregar simples verificaciones para saber si se envió:
			$usuario=$_SESSION["soliris_usuario"];
			$envio=$to . ' ' . $subject . ' ' . $html . ' '. $exito;
			if($exito){
				$response = MySQL_sendFunctionAudit("insert into soliris_log set usuario='$usuario', fecha=now(), accion='Envio de Mail', notas='$envio'","Envio de mail","");
				echo $response;
				return true;
			}else{
				$response = MySQL_sendFunctionAudit("insert into soliris_log set usuario='$usuario', fecha=now(), accion='Envio de Mail', notas='$envio'","ERROR Envio de mail ","");
				echo $response;
				return false;
			}

            //return $to;
    }
?>
