<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/FormatosModel.php");
       
    $Formato = new Formatos();
    header('Content-Type: application/json');


    
switch ($_GET["opcion"]) 
    {
        case "TodosFormatos":
            $datos = $Formato->AllFormatos();
            $data = array(); 
            
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta = array();
                $DatosDeRespuesta[] = $resultado["id_formato"]; // Agregar el ID aquí
                $DatosDeRespuesta[] = $resultado["fecha_formato"];
                $DatosDeRespuesta[] = $resultado["nombre"];
            
        
        // Base64 del archivo
        $base64Archivo = htmlspecialchars($resultado["archivo_formato"]);

        // Botón de descarga con un ID único
        $DatosDeRespuesta[] = '<button id="download-btn-' . $resultado["id_formato"] . '" type="button" class="btn btn-inline btn-primary btn-sm ladda-button" data-base64="' . $base64Archivo . '" data-extencion="' . htmlspecialchars($resultado["extencion_formato"]) . '" data-nombre="' . htmlspecialchars($resultado["nombre"]) . '"><i class="fa fa-download"></i></button>';


                $DatosDeRespuesta[] = $resultado["extencion_formato"];
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
        
        case "AgregarFormato":
            // Obtiene la extensión del formato
            $extencion_formato = $_POST['extencion_formato'];
            
            // Guarda el archivo en la base de datos
            $datos = $Formato->AgregarFormato($_POST["fecha_formato"], $_POST["nombre"], $_POST["archivo_formato"], $extencion_formato);
            
            // Verifica si se guardó correctamente y devuelve la respuesta
            echo json_encode(["success" => true]);
        break;
        

        case "ActualizarCurso":
            $datos = $Curso->ActualizarCurso(
                $_POST['id_curso'],
                $_POST['fecha_curso'],
                $_POST['tema_curso'],
                $_POST['ponente_curso'],
                $_POST['archivo_curso'],
                $_POST['descripcion_curso']
            );
            echo json_encode(["success" => $Curso]);
        break;

        case "EliminarFormato":
            $datos = $Formato->EliminarFormato($_POST['id_formato']);
            echo json_encode(["success" => $datos]);
        break;

        case "Formatoxid":
            $data = $Formato->FormatoXid($_POST['id_curso']);
            $DatosDeRespuesta = array(); 
        
            foreach ($data as $resultado) {
                $DatosDeRespuesta["id_formato"] = $resultado["id_formato"];
                $DatosDeRespuesta["fecha_formato"] = $resultado["fecha_formato"];
                $DatosDeRespuesta["nombre"] = $resultado["nombre"];
        
                // Pasar el archivo PDF como string base64
                $DatosDeRespuesta["archivo_formato"] = htmlspecialchars($resultado["archivo_formato"]); // Codificar a Base64
        
                $DatosDeRespuesta["extencion_formato"] = $resultado["extencion_formato"];
            }
        
            echo json_encode($DatosDeRespuesta);
        break;
        
        
        
        


    }
?>
