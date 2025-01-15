<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/NotificacionModel.php");

    $Notificacion = new Notificacion();
    header('Content-Type: application/json');

switch ($_GET["opcion"]) 
    {
        case "TodasNotificaciones":
            $datos = $Notificacion->LlamarNotificacion();
            $data = array();

            foreach ($datos as $resultado) {
                $DatosDeRespuesta = array();
                $DatosDeRespuesta[] = $resultado["idnotificacion"];
                $DatosDeRespuesta[] = $resultado["Mensaje"];
                $DatosDeRespuesta[] = $resultado["TipoNotificacion"];
                $DatosDeRespuesta[] = $resultado["UsuarioNotificado"];
                $DatosDeRespuesta[] = $resultado["Area"];
                $DatosDeRespuesta[] = $resultado["Fecha"];
                $DatosDeRespuesta[] = '<button type="button" onClick="ver('.$resultado["idnotificacion"].');" id="'.$resultado["idnotificacion"].'" class="btn btn-link btn-inline ladda-button"><i class="fa fa-eye">Ver</i></button>';
                $data[] = $DatosDeRespuesta;
            }

            $results = array
            (
                "sEcho" => 1,
                "iTotalRecords" => count($data),
                "iTotalDisplayRecords" => count($data),
                "aaData" => $data
            );

            echo json_encode($results);
        
        break;
        
    }
?>
