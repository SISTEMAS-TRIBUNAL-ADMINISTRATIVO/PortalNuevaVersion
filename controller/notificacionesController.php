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
           // $Foto = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_notificacion"]);

            $html .= "<div class='col-md-4'>
                        <div class='card' style='width: 18rem;'>
                            <div class='card-body'>
                                <h5 class='card-title'>" . $resultado['Titulo_notificacion'] . "</h5>
                                <p class='card-text'>" . $resultado['mensaje_corto_notificacion'] . "</p>
                                <a href='#' class='btn btn-primary'>Ver más información</a>
                            </div>
                        </div>
                    </div>";
        }

        // Realiza un solo echo después del bucle
        echo $html;
        break;
}
?>
