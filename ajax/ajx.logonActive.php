<?php
    // session_start();
    $isSessionActive = (session_status() == PHP_SESSION_ACTIVE);

    if ($isSessionActive) {
      if(!isset($_SESSION["soliris_usuario"]) OR empty($_SESSION["soliris_usuario"])){
        // session_write_close();
        session_destroy();
          echo "Session Perdida";
      } else {
        echo "$isSessionActive";
      };
    }else{
      echo "$isSessionActive";
    }
?>
