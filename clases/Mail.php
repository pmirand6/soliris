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
class Mail extends PHPMailer
{
    /**
     * myPHPMailer constructor.
     *
     * @param bool|null $exceptions
     * @param string    $body A default HTML message body
     */
    public function __construct($exceptions, $body = '')
    {
        //Don't forget to do this or other things may not be set correctly!
        parent::__construct($exceptions);
        //Set a default 'From' address
        $this->setFrom('cron@raffo.com.ar', 'Cron');
        //Send via SMTP
        $this->isSMTP();
        //Equivalent to setting `Host`, `Port` and `SMTPSecure` all at once
        $this->Host = '192.168.0.66';
        $this->SMTPAuth = true;
        $this->Username = 'cron';
        $this->Password = 'cron2014';
        //Set an HTML and plain-text body, import relative image references
        $this->msgHTML($body, './images/');
        //Show debug output
        $this->SMTPDebug = SMTP::DEBUG_SERVER;
        //Inject a new debug output handler
        $this->Debugoutput = static function ($str, $level) {
            echo "Debug level $level; message: $str\n";
        };
    }

    //Extend the send function
    public function send()
    {
        $this->Subject = '[Yay for me!] ' . $this->Subject;
        $r = parent::send();
        echo 'I sent a message with subject '. $this->Subject;

        return $r;
    }
}

