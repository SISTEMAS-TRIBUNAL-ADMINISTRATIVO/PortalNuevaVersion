<?php
session_start();
require_once("../config/conexion.php");
require_once("../models/NotificacionesModel.php");

$Notificacion = new Notificacion();
$html = '';

switch ($_GET["opcion"]) 
{
    case "TodasNotificaciones":

        $datos = $Notificacion->LlamarNotificacion(11, $_SESSION['Enlace']);
        $fechaHoy = date('Y-m-d');
        $fechaHoyObj = new DateTime($fechaHoy);

        foreach ($datos as $resultado) 
        {
            $fechaCreacionObj = new DateTime($resultado['fecha_notificacion']);
            $intervalo = $fechaCreacionObj->diff($fechaHoyObj);
            $diasTranscurridos = $intervalo->days;
            $imagePath = '../../public/images/notificacion%20(1).png';


            if($resultado["esta_programado"] == "1" )
            {
                if($resultado["fecha_programado"] == date('Y-m-d'))
                {
                    $html .= "<div class='card text-center'>
                                <div class='' style='color: navy blue; font-size:15px;'>Notificación</div>
                                <div class='' style='color: red; font-size:15px;'> Hace ".$diasTranscurridos." días</div>
                                <div class='card-body'>
                                    <img src='" . $imagePath . "' alt='Imagen de notificación' class='card-img-top' style='max-height: 150px; object-fit: cover;'>
                                    <h5 class='card-title'>" . $resultado['Titulo_notificacion'] . "</h5>
                                    <a href='' class='card-text' target='_blank' onclick='notificacionClick(" . $resultado['idnotificacion'] . "); return false;'>" . $resultado['mensaje_corto_notificacion'] . "</a>
                                </div>
                            </div>";
        
                }
            }
            else
            {
                $html .= "<div class='card text-center'>
                            <div class='' style='color: navy blue; font-size:15px;'>Notificación</div>
                            <div class='' style='color: red; font-size:15px;'> Hace ".$diasTranscurridos." días</div>
                            <div class='card-body'>
                                <img src='" . $imagePath . "' alt='Imagen de notificación' class='card-img-top' style='max-height: 150px; object-fit: cover;'>
                                <h5 class='card-title'>" . $resultado['Titulo_notificacion'] . "</h5>
                                <a href='' class='card-text' target='_blank' onclick='notificacionClick(" . $resultado['idnotificacion'] . "); return false;'>" . $resultado['mensaje_corto_notificacion'] . "</a>
                            </div>
                        </div>";
            }
        }

        // Realiza un solo echo después del bucle
        echo $html;
    break;

    case "NotificaionCumpleaños":
        $datos = $Notificacion->LlamarNotificacionCumpleaños($_SESSION['Enlace']);
        $DatosDeRespuesta = array();

        if(is_array($datos)==true and count($datos)>0)
        {
            foreach ($datos as $resultado) 
            {
                if($resultado["esta_programado"] == "1" )
                {
                    if($resultado["fecha_programado"] == date('Y-m-d'))
                    {
                        $DatosDeRespuesta["MostrarModal"] = "SI";
                    }
                    else
                    {
                        $DatosDeRespuesta["MostrarModal"] = "NO";
                    }
                }
                else
                {
                    $DatosDeRespuesta["MostrarModal"] = "SI";
                }

                $DatosDeRespuesta["Titulo"] = $resultado["Titulo_notificacion"];
                $DatosDeRespuesta["Mensaje"] = $resultado["mensaje_corto_notificacion"];
                $DatosDeRespuesta["fotoBase64"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_notificacion"]);
            }
        }
        else
        {
            $DatosDeRespuesta["MostrarModal"] = "NO";
        }

        echo json_encode($DatosDeRespuesta);   

    break;

    case "NotificacionXid":
        $datos = $Notificacion->LlamarNotificacionXid($_POST['idnotificacion']);
        $DatosDeRespuesta = array();

        if(is_array($datos)==true and count($datos)>0)
        {
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta["Titulo"] = $resultado["Titulo_notificacion"];
                $DatosDeRespuesta["Mensaje"] = $resultado["mensaje_corto_notificacion"];
                $DatosDeRespuesta["Mensaje_largo"] = $resultado["mensaje_notificacion"];
                $DatosDeRespuesta["fecha_notificacion"] = $resultado["fecha_notificacion"];
                $DatosDeRespuesta["fotoBase64"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_notificacion"]);
            }
        }

        echo json_encode($DatosDeRespuesta);   

    break;
}




  
   