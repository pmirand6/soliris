<?php
$dir = "../../../documentacion/test";

$files = scandir($dir);
$ret = array();
foreach ($files as $file) {
    if ($file == "." || $file == "..") {
        continue;
    }

    $filePath = $dir . "/" . $file;
    $details = array();
    $details['size'] = filesize($filePath);
    $ret[] = $details;
}
echo json_encode($ret);
