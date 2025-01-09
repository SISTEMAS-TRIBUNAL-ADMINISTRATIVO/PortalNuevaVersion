<?php
    require_once("../config/conexion.php");
    require_once("encryptController.php");
    $conexion = new Conectar();


    switch($_GET["opcion"])
    {
        case "Autorizacion":
            $clave_secreta = md5('tapje');
            $encriptador = new SimpleEncrypt($clave_secreta);
            $Enlace = $encriptador->encriptar($_SESSION['Enlace']);        
            $UrlAutorizacion = $conexion->rutaHelpdesk()."controller/autorizacionController.php?autorizacion=".$Enlace."&clave=".$clave_secreta;
        

            $Respuesta['UrlAutorizacion'] = $UrlAutorizacion;
            echo json_encode($Respuesta);
        break;
    }
?>

