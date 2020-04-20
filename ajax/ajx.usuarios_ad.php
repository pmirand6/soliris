<?php


require_once('../config/config.php');
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include('../vendor/autoload.php');

$query = $_GET["q"];


// Construct new Adldap instance.
$ad = new \Adldap\Adldap();

// Create a configuration array.
$config = [
  // An array of your LDAP hosts. You can use either
  // the host name or the IP address of your host.
  'hosts'    => ['192.168.0.27'],

  // The base distinguished name of your domain to perform searches upon.
  'base_dn'  => 'OU=OU MUNRO,DC=raffo,DC=local',

  // The account to use for querying / modifying LDAP records. This
  // does not need to be an admin account. This can also
  // be a full distinguished name of the user account.
  'username' => 'cron',
  'password' => 'cron2014',
];

// Add a connection provider to Adldap.
$ad->addProvider($config);


try {
  // If a successful connection is made to your server, the provider will be returned.
  $provider = $ad->connect();


  // Performing a query.
  $search = $provider->search();

  $record = $search
                ->where('displayName', 'contains', $query)
                ->whereHas('mail')
                ->limit(10)->get();

  

  $json = [];

  if ($record) {
    foreach ($record as $a) {
      $json[] = ['id' => $a->getAttribute('mail', 0), 'text' => $a->getDisplayName(), 'username' => $a->getAccountName()];
    }
    
  }

  echo json_encode($json);
} catch (\Adldap\Auth\BindException $e) {

  // There was an issue binding / connecting to the server.

}
