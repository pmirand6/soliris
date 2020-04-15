<?php

require '../vendor/autoload.php';

// Create the Transport
$transport = (new Swift_SmtpTransport('192.168.0.66', 25))
  ->setUsername('cron')
  ->setPassword('cron2014')
;

// Create the Mailer using your created Transport
$mailer = new Swift_Mailer($transport);

// Create a message
$message = (new Swift_Message('Wonderful Subject'))
  ->setFrom(['cron@raffo.com.ar' => 'Cron'])
  ->setTo(['pmiranda@raffo.com.ar'])
  ->setBody('Here is the message itself')
  ;

// Send the message
$result = $mailer->send($message);