<?php
    require_once("../config/conexion.php");
    require_once("../models/ConfiguracionInicialModel.php");


    $conexion = new Conectar();
    $PrimerInicio = new PrimerInicio();
    header('Content-Type: application/json');


    switch ($_GET["opcion"]) 
    {
        case "guardarConfiguracionInicial":
                $datos = $PrimerInicio->GuardarConfiguracion($_POST["siglas"], $_POST['area'], $_POST['nueva_contraseña'], $_SESSION["Enlace"], $_SESSION["email"], $_POST['Piso']);
                $DatosDeRespuesta = array(); 
                $DatosDeRespuesta["Respuesta"] = 1;
                echo json_encode($DatosDeRespuesta);
        break;
    }
?>
