<?php
session_start();
require_once("../config/conexion.php");
require_once("../models/AvisosModel.php");

$Avisos = new Avisos();
$html = "";
header('Content-Type: application/json');

switch ($_GET["opcion"]) 
{
    case "Avisos":
        // Validar que $_SESSION['Enlace'] esté definido y no vacío
        if (!isset($_SESSION['Enlace']) || empty($_SESSION['Enlace'])) {
            echo json_encode(["error" => "No hay un enlace válido en la sesión"]);
            exit;
        }

        // Obtener los avisos de la base de datos
        $datos = $Avisos->ObtenerTodosLosAvisos( $_SESSION["fk_area_ubicacion "], $_SESSION['Enlace']);

        // Validar que $datos sea un array antes de iterarlo
        if (!is_array($datos)) {
            echo json_encode(["error" => "Error al obtener los avisos. Datos no válidos."]);
            exit;
        }

        $data = array(); 

        foreach ($datos as $resultado) 
        {
            $DatosDeRespuesta = array();
            $DatosDeRespuesta[] = $resultado["Nombre_notificcion"];
            $DatosDeRespuesta[] = $resultado["mensaje_corto_notificacion"];
            $DatosDeRespuesta[] = $resultado["Titulo_notificacion"];
            $DatosDeRespuesta[] = $resultado["fecha_notificacion"];
            $DatosDeRespuesta[] = $resultado["nombre_estado"];
            $DatosDeRespuesta[] = $resultado["vigencia_notificacion"];


            // Agregar la fila completa a $data
            $data[] = $DatosDeRespuesta; 
        }
        
        $results = array(
            "sEcho" => 1,
            "iTotalRecords" => count($data),
            "iTotalDisplayRecords" => count($data),
            "aaData" => $data
        );

        echo json_encode($results);
    break;


     echo json_encode($results);
    break;

    case "ComboBoxTipoAviso":
        $datos = $Avisos->ObtenerTipoDeAvisos();
    
        if (is_array($datos) && count($datos) > 0) {
            foreach ($datos as $row) {
                $html .= "<option value='" . htmlspecialchars($row['idtiponotificacion']) . "'>" . htmlspecialchars($row['Nombre_notificcion']) . "</option>";
            }
        } else {
            $html = "<option value=''>No hay opciones disponibles</option>";
        }
        
        echo json_encode($html);
        break;
    
}
    
?>