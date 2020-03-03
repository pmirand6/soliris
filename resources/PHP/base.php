<?php
    include $_SERVER['DOCUMENT_ROOT'] . "/" . _NAME . '/resources/PHP/db.php';
    //include $_SERVER['DOCUMENT_ROOT'] . _BD;

    if (mysqli_connect_errno()){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    };

// Valido la session del usuario
    if((!isset($_SESSION["soliris_usuario"]) OR empty($_SESSION["soliris_usuario"])) AND basename($_SERVER['PHP_SELF']) !== 'ajx.login.php' ){
//        echo basename($_SERVER['PHP_SELF']);
        header('Location: https://' . $_SERVER['HTTP_HOST'] . "/". _NAME . '/error.php?type=loginLost');
        
        //header('Location: ../../error.php?type=loginLost');

    };
?>
