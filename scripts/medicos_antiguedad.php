<?php
#REVISAR
include_once '../resources/PHP/PHPMailer_5.1/class.phpmailer.php';

  try{
    $dbh = new PDO("mysql:host=192.168.0.62; dbname=soliris", 'admin', 'admin');

    // Listado de Destinatarios
    $to = "";
    foreach ($dbh->query("SELECT * FROM soliris_usuarios WHERE grupo = 'Marketing' ORDER BY id DESC;") as $row){
      $to .= $row['mail'] . ";";
    }
    $to = trim($to, ";");

    // Cuerpo del Mail
    $cuerpo = "<html><body><h2>Listado de Médicos sin ventas por más de un año</h2>";
    foreach ($dbh->query("SELECT M.id as IDMED, RV.medico AS Medico, MAX(RV.fecha_venta) AS fechaMAXVenta FROM soliris_maestro AS RV INNER JOIN medicos as M ON (RV.medico = M.Nombre) WHERE DATE_SUB(CURDATE(),INTERVAL 1 YEAR) > RV.fecha_venta AND M.estado = 'Activo' GROUP BY Medico;") as $row){
      $cuerpo .= '<p>Médico: ' . $row['Medico'] . ' - Última venta: ' . $row["fechaMAXVenta"] . '</p>';
      $dbh->exec('UPDATE medicos SET estado=\'Inactivo\' WHERE id=' . $row["IDMED"]);
    }
    $cuerpo .= "<h5><i>Reporte generado el " . date("Y-m-d - h:i:s a") . " </i></h5></body></html>";


    // sendMail($to, 'soliris - Listado de Medicos sin APM', $cuerpo);
    if (!empty($cuerpo)){
        sendMail('dcilveti@raffo.com.ar', 'soliris - Medicos sin ventas', $cuerpo);
    }

    /*** close the database connection ***/
    $dbh = null;
  } catch(PDOException $e) {
    sendMail('dcilveti@raffo.com.ar', 'soliris - Medicos sin ventas', $e->getMessage());
  }


  function sendMail($to, $subject, $html){

    $mail = new PHPMailer();
    $mail->CharSet = 'UTF-8';

    //Luego tenemos que iniciar la validación por SMTP:
    #$mail->IsSMTP();
    #$mail->SMTPAuth = false;
    $mail->Host = "192.168.0.33"; 											// SMTP a utilizar.
    $mail->Username = "cron"; 												// Correo completo a utilizar
    $mail->Password = "cron2014"; 											// Contraseña
    #$mail->Port = 25; 														// Puerto a utilizar

    $mail->From = "cron@raffo.com.ar"; 										// Desde donde enviamos (Para mostrar)
    $mail->FromName = "Servicio soliris";

        $mail->AddAddress($to); 						                        // Esta es la dirección a donde enviamos ( $mail->AddAddress('dcilveti@raffo.com.ar', $userTo); )

    $mail->IsHTML(true); 													// El correo se envía como HTML

    $mail->Subject = $subject; 												// Este es el titulo del email.
    $mail->Body = $html; 													// Mensaje a enviar
    $exito = $mail->Send(); 												// Envía el correo.

    //También podríamos agregar simples verificaciones para saber si se envió:
    if($exito){
      //echo 'El correo fue enviado correctamente.';
      return true;
    }else{
      //echo 'Hubo un inconveniente. Contacta a un administrador.';
      return false;
    }
  }
?>
