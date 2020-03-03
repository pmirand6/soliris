<?php


require_once('config/config.php');
    header( 'Cache-Control: no-store, no-cache, must-revalidate' );
    header( 'Cache-Control: post-check=0, pre-check=0', false );
    header( 'Pragma: no-cache' );

    session_start();

    if(isset($_SESSION["soliris_usuario"]) AND !empty($_SESSION["soliris_usuario"])){
        header('Location: defa.php');
    };
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">
    <meta http-equiv="Pragma" content="no-cache">
    <link rel="shortcut icon" href="resources/IMG/soliris.ico" type="image/x-icon" />
    <script type="text/javascript" src="resources/JQuery/jquery-2.1.3.js"></script>

    <title><?php echo _NAME;?> Login</title>
    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* Google Font */
            @import url('resources/CSS/GoogleFont/font.css?family=PT+Sans+Narrow');
        /* Custom CSS */
            @import "resources/CSS/login.min.css";
    </style>
</head>
<body>
    <div class="container">
        <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="resources/IMG/soliris.svg" />
            <samp id="profile-name" class="profile-name-card"></samp>
            <form id="form" class="form-signin">
                <input type="text" id="inputUser" class="form-control" placeholder="Usuario" required autofocus>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required autocomplete="off">
                <div id="remember" class="checkbox" style="text-align: right;">
                    <label>
                       <!--<input type="checkbox" id="remember_me" value="remember-me"> Recuérdame-->
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin">Ingresar</button>
            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->

<?php
    include "resources/Includes/BootstrapHTML5.php";
?>

    <!-- Custom JS -->
        <script type="text/javascript" src="resources/JS/Develop/login.js"></script>
</body>
</html>
