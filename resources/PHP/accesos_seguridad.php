<?php
/**
* Created by PhpStorm.
* User: jgallina
* Date: 13/05/2015
* Time: 03:59 PM
*/
//include $_SERVER['DOCUMENT_ROOT'] . _FN;

if (session_status() == 1){
    session_start();
};



if (isset($_SESSION["soliris_usuario"])&&(!empty($_SESSION["soliris_usuario"]))&&(!empty($_SESSION["grupo"]))) {

    require_once $_SERVER['DOCUMENT_ROOT'] . '/soliris/config/config.php';
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    $grupo = $_SESSION["grupo"];
    $pagina = basename(strtok($_SERVER["REQUEST_URI"],'?'));
    $grupo = strtolower($grupo);


    //$query = "SELECT $grupo FROM soliris_seguridad WHERE $grupo = 1 AND pagina = '$pagina'";
    // PGM - Se implementa un store procedured que valida la página y el grupo
    // return INT
    $query = "CALL `ST_GET_ACCESS`('$pagina', '$grupo')";
    
    
    $result = mysqli_query($db, $query);
    $row = mysqli_fetch_array($result);

    $res = $row[0];
    if (strcasecmp($res, 1) !== 0) {

     $err = "Advertencia: " .  mysqli_error($db);
     $file = str_replace(".php", "", $pagina);
     header('Location: ../error.php?err=' . $err . "&file=" . $file);
 }
} else {
    header('Location: https://' . $_SERVER['HTTP_HOST'] . "/". _NAME . '/error.php?type=loginLost');
}
?>