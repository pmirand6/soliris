<?php

/*require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;*/

require '../clases/Mail.php';

//Now creating and sending a message becomes simpler when you use this class in your app code
try {
   //Instantiate your new class, making use of the new `$body` parameter
   $mail = new Mail(true, '<strong>This is the message body</strong>');
   // Now you only need to set things that are different from the defaults you defined
   $mail->addAddress('pmiranda@raffo.com.ar', 'Pablo Miranda');
   $mail->Subject = 'Here is the subject';
   //$mail->addAttachment(__FILE__, 'myPHPMailer.php');
   $mail->send(); //no need to check for errors - the exception handler will do it
} catch (Exception $e) {
   //Note that this is catching the PHPMailer Exception class, not the global \Exception type!
   echo 'Caught a '. get_class($e) .': '. $e->getMessage();
}