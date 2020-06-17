<?php

/**
 * @Author: Pablo Miranda
 * @Date: 2020-06-02 16:36:11
 * @Last Modified by:
 * @Last Modified time: 2020-06-02 16:36:11
 */
require_once '../config/config.php';
require_once $_SERVER['DOCUMENT_ROOT']._BD;
require_once $_SERVER['DOCUMENT_ROOT']._FN;

if (isset($_GET['q'])) {
    $filtro = $_GET['q'];
    $SQL = "CALL `ST_GET_CANAL`('$filtro');";
    $result = mysqli_query($db, $SQL);

    $json = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $json[] = ['id' => $row['id'], 'text' => $row['zcust_ad_name']];
    }

    echo json_encode($json);

    mysqli_free_result($result);
    mysqli_close($db);
}
