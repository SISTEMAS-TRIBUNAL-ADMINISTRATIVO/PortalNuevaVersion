<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/NotificacionesModel.php");

    $Notificacion = new Notificacion();
    $html = '';
    header('Content-Type: application/json');


    switch ($_GET["opcion"]) 
        {
            case "TodasNotificaciones":

                $datos = $Notificacion->LlamarNotificacion(11,$_SESSION['Enlace']);

                foreach ($datos as $resultado) 
                {
                    $html.="    <div class='col-md-4'>
                                    <div class='card' style='width: 18rem;'>
                                    <img src='' class='card-img-top' alt='...'>
                                    <div class='card-body'>
                                        <h5 class='card-title'>".$resultado['TipoNotificacion']."</h5>
                                        <p class='card-text'>".$resultado['Mensaje']."</p>
                                        <a href='#' class='btn btn-primary'>Ver más información</a>
                                    </div>
                                    </div>
                                </div>";

                    echo $html;
                }
            
            break;
        }
?>

