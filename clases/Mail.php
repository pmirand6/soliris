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
class Mail
{
    public static function sendMessage($subject, $body)
    {
        // automatic use smtp.domain.com, username, password ??
        $transport = Swift_MailTransport::newInstance();
        $mailer = Swift_Mailer::newInstance($transport);

        $message = Swift_Message::newInstance('Test')
            ->setSubject($subject)
            ->setFrom(array('mail@domain.com' => 'from user'))
            ->setTo(array('mail@domain.com' => 'from user'))
            ->setBody($body);

        $result = $mailer->send($message);
    }
}
