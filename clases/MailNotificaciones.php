<?php



require '../vendor/autoload.php';

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
        $message = (new Swift_Message($subject))
            ->setFrom(['cron@raffo.com.ar' => 'Cron'])
            ->setTo($destinatarios)
            ->setBody($body);

        // Send the message
        $result = $mailer->send($message);
    }
}
