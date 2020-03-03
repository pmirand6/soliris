<?php
$param = json_decode(html_entity_decode('usuarios.json'),true);
 $json_errors = array(
JSON_ERROR_NONE => 'No error has occurred',
JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded',
JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded',
JSON_ERROR_SYNTAX => 'Syntax error',
);
 echo 'Last error : ', $json_errors[json_last_error()], PHP_EOL, PHP_EOL;
print_r($param);