<?php
session_start();
require_once("../config/conexion.php");
require_once("../models/NotificacionesModel.php");

$Notificacion = new Notificacion();
$html = '';

switch ($_GET["opcion"]) {
    case "TodasNotificaciones":

        $datos = $Notificacion->LlamarNotificacion(11, $_SESSION['Enlace']);

        foreach ($datos as $resultado) {
            // Determina la URL del enlace dinámicamente
            $link = !empty($resultado['url_destino']) ? $resultado['url_destino'] : '#';

            // Ruta de la imagen
            $imagePath = '../../public/images/notificacion%20(1).png';

            $html .= "<div class='card text-center'>
                        <div class='' style='color: black; font-size:15px;'>Notificación</div>
                        <div class='card-body'>
                            <img src='" . $imagePath . "' alt='Imagen de notificación' class='card-img-top' style='max-height: 150px; object-fit: cover;'>
                            <h5 class='card-title'>" . $resultado['Titulo_notificacion'] . "</h5>
                            <a href='" . $link . "' class='card-text' target='_blank'>" . $resultado['mensaje_corto_notificacion'] . "</a>
                        </div>
                        <div class='card-footer text-muted' style='color:rgb(255, 255, 255) !important;'>
                            2 days ago
                        </div>
                    </div>";
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
                $DatosDeRespuesta["MostrarModal"] = "SI";
                $DatosDeRespuesta["Titulo"] = $resultado["Titulo_notificacion"];
                $DatosDeRespuesta["Mensaje"] = $resultado["mensaje_corto_notificacion"];
                $DatosDeRespuesta["URL"] ='192.168.1.121';
                $DatosDeRespuesta["fotoBase64"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_notificacion"]);
            }
        }
        else
        {
            $DatosDeRespuesta["MostrarModal"] = "NO";
        }

        echo json_encode($DatosDeRespuesta);   

    break;
}




  
   