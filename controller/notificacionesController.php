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

            $html .= "<div class='card text-center'>
                        <div class='' style='color: black; font-size:15px;'>Notificación</div>
                        <div class='card-body'>
                            <h5 class='card-title'>" . $resultado['Titulo_notificacion'] . "</h5>
                            <a href='" . $link . "' class='card-text' target='_blank'>" . $resultado['mensaje_corto_notificacion'] . "</a>
                        </div>
                        <div class='card-footer text-muted' style='background-color: yellow;'>
                            2 days ago
                        </div>
                    </div>";
        }

        // Realiza un solo echo después del bucle
        echo $html;
        break;
}
?>



  
   