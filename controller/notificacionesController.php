<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/NotificacionesModel.php");

    $Notificacion = new Notificacion();
    $html = '';

    switch ($_GET["opcion"]) 
        {
            case "TodasNotificaciones":

                $datos = $Notificacion->LlamarNotificacion(11,$_SESSION['Enlace']);

                foreach ($datos as $resultado) 
                {
                    $Foto = 'data:image/jpeg;base64,' . base64_encode($resultado["Imagen"]);

                    $html.="    <div class='col-md-4'>
                                    <div class='card' style='width: 18rem;'>
                                    <img src='". $Foto ."' class='card-img-top' alt='...'>
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

