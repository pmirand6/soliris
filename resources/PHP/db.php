<?php
/**
 * Created by PhpStorm.
 * User: sogvicious
 * Date: 25/07/2015
 * Time: 08:27 PM
 */

include_once realpath(dirname(__FILE__)."/../../") . '/config/config.php';

//echo basename($_SERVER['SCRIPT_FILENAME']);

    //$db = mysqli_connect('192.168.0.62','soliris_ap','acceso_app') or die ("Database error"); // conector produccion
    $db = mysqli_connect('192.168.0.139','soliris_ap','acceso_app') or die ("Database error"); // conector desarrollo
    mysqli_set_charset($db, 'utf8');
    mysqli_select_db($db, _NAME);

    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }

    /*$db_np = mysqli_connect('192.168.0.47','soliris_ap','soliris') or die ("Database error");
    mysqli_set_charset($db, 'utf8');
    mysqli_select_db($db, _NAME_NP);

    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }*/

    
    
?>
