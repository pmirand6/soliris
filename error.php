<?php

include './config/config.php';
    if(isset($_SESSION["soliris_usuario"]) AND !empty($_SESSION["soliris_usuario"])){
        header('Location: defa.php');
    };

    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Pragma" content="no-cache">

    <link rel="shortcut icon" href="resources/IMG/favicon.ico" type="image/x-icon" />

    <title>Error</title>

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
    <div class="col-sm-12 col-xs-12">
        <p class="bg-warning">
            <samp class="fa fa-warning">
                <?php

                    if (isset($_GET["type"]) AND $_GET["type"] === 'loginLost'){
                        echo "Sesión perdida, por favor vuelva a loguearse. <a href=\"login.php\" target='_parent'>Haga click aquí</a>";;
                    } else {
                        if(isset($_SESSION["grupo"])){
                            if (isset($_GET["err"])) echo $_GET["err"];
                            echo "El grupo:<i> " . $_SESSION["grupo"] . "</i><b> no tiene permisos </b>";
                            if (isset($_GET["file"])) echo " en el modulo de <b>" . $_GET["file"] . "</b>";
                        } else {
                            echo "Sesión perdida, por favor vuelva a loguearse. <a href=\"login.php\" target='_parent'>Haga click aquí</a>";
                        }
                    }
                ?>
            </samp>
        </p>
    </div>
<?php
    include "resources/Includes/BootstrapHTML5.php";
?>
</body>
</html>
