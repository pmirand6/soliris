<?php
require '../vendor/autoload.php';
try{
    $count = 1000;
    $faker = Faker\Factory::create('es_ES');;
    //Connecting MySQL Database
    $pdo  = new PDO('mysql:host=localhost;dbname=soliris;charset=utf8', 'root', '', array(
        PDO::ATTR_PERSISTENT => true
    ));
    $pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
    
    //Drop the table 
    $stmt = $pdo->prepare("truncate table cp");
    $stmt->execute();

    $arrayProv = Array();
    $data = $pdo->query("select id from provincias")->fetchAll();
    foreach ($data as $row) {
        
        array_push($arrayProv, $row['id']);
    }


    //Insert the data
    $sql = 'INSERT INTO cp
	(CP, Localidad, provincia_id) 
    VALUES (:CP, :localidad, :provincia_id)';
    $stmt = $pdo->prepare($sql);
    for ($i=0; $i < $count; $i++) {
        //$date = $faker->dateTime($max = 'now', 'UTC')->format('Y-m-d H:i:s');
        $stmt->execute(
            [
                ':CP' => $faker->postcode,                            
                ':localidad' => $faker->city,    
                ':provincia_id' => $faker->randomElement($arrayProv)
            ]
        );
    }
} catch(Exception $e){
    echo '<pre>';print_r($e);echo '</pre>';exit;
}
?>