<?php

/**
 * This example shows how to extend PHPMailer to simplify your coding.
 * If PHPMailer doesn't do something the way you want it to, or your code
 * contains too much boilerplate, don't edit the library files,
 * create a subclass instead and customise that.
 * That way all your changes will be retained when PHPMailer is updated.
 */

//Import PHPMailer classes into the global namespace
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;

require '../vendor/autoload.php';

/**
 * Use PHPMailer as a base class and extend it
 */
class MailNotificaciones
{
    public static function sendMessage($subject, $body, Array $destinatarios)
    {
        // Create the Transport
        $transport = (new Swift_SmtpTransport('192.168.0.66', 25))
            ->setUsername('cron')
            ->setPassword('cron2014');

        // Create the Mailer using your created Transport
        $mailer = new Swift_Mailer($transport);

        // Create a message
        $message = (new Swift_Message('Wonderful Subject'))
            ->setFrom(['cron@raffo.com.ar' => 'Cron'])
            ->setTo(['pmiranda@raffo.com.ar'])
            ->setBody('Here is the message itself');

        // Send the message
        $result = $mailer->send($message);
    }
}
