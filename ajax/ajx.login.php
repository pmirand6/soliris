<?php
    
    
require_once("../config/config.php");
require $_SERVER['DOCUMENT_ROOT'] . _FN;
    

    session_start();

    //desactivamos los erroes por seguridad
    //error_reporting(0);
    // FIXME verificar el muestreo de errores
    error_reporting(E_ALL); //activar los errores (en modo depuración)
    if ($_POST["oper"] == "logUser"  AND !empty($_POST["usuario"]) AND !empty($_POST["password"])) {
        
				$servidor_LDAP = "ldap://192.168.0.27:389/";
                $servidor_dominio = "RAFFO.local";
                $ldap_dn = "DC=raffo,DC=local";
                $usuario_LDAP = $_POST["usuario"];
                $contrasena_LDAP = $_POST["password"];

                $conectado_LDAP = ldap_connect($servidor_LDAP);
                ldap_set_option($conectado_LDAP, LDAP_OPT_PROTOCOL_VERSION, 3);
                ldap_set_option($conectado_LDAP, LDAP_OPT_REFERRALS, 0);

                if ($conectado_LDAP) {
                    // Comprobando usuario y contraseña en Servidor LDAP \\
                    $autenticado_LDAP = ldap_bind($conectado_LDAP, $usuario_LDAP . "@" . $servidor_dominio, $contrasena_LDAP);
                    if ($autenticado_LDAP){
                       // "Autenticación en servidor LDAP desde Apache y PHP correcta." \\
                        if (UserAccess(strtoupper($usuario_LDAP))){
                            echo "OK";
                        } else {
                            echo "ERROR: El usuario no se encuentra habilitado para acceder al sistema";
                        }
                    } else {
                        MySQL_sendQuery("INSERT INTO soliris_log set fecha = now(), usuario='" . strtoupper($usuario_LDAP) . "', accion='Intento Fallido de Login', notas = 'Desde el Equipo: " . getIP() . " - ERROR: Verifique el usuario y la contraseña introducidos';");
                        echo "ERROR: Verifique el usuario y la contraseña introducidos";
                    }
                } else {
                    MySQL_sendQuery("INSERT INTO soliris_log set fecha = now(), usuario='" . strtoupper($usuario_LDAP) . "', accion='Intento Fallido de Login', notas = 'Desde el Equipo: " . getIP() . " - ERROR: No se ha podido realizar la conexión con el servidor LDAP';");
                    echo "ERROR: No se ha podido realizar la conexión con el servidor LDAP";
                }
    };

    if ($_POST["oper"] == "getLogUser"){
        if (isset($_SESSION["soliris_usuario"])){
            echo $_SESSION["soliris_usuario"];
        };
    };
    if ($_POST["oper"] == "delLogUser"){
        $_SESSION["soliris_usuario"] = "";
    };
?>
