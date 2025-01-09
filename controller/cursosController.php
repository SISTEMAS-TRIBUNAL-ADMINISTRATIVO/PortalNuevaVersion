<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/CursosModel.php");
       
    $Curso = new Cursos();
    header('Content-Type: application/json');


    
switch ($_GET["opcion"]) 
    {
        case "TodosLosCursos":
            $datos = $Curso->TodosCursos();
            $data = array(); 
            
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta = array();
                $DatosDeRespuesta[] = $resultado["id_curso"]; // Agregar el ID aquí
                $DatosDeRespuesta[] = $resultado["fecha_curso"];
                $DatosDeRespuesta[] = $resultado["tema_curso"];
                $DatosDeRespuesta[] = $resultado["ponente_curso"];

                $DatosDeRespuesta[] = "<a href='#' class='view-file' data-file='data:application/pdf;base64," . htmlspecialchars($resultado["archivo_curso"]) . "' data-filename='" . htmlspecialchars($resultado["archivo_curso"]) . "'>
                <img src='../../public/images/pdf.png' alt='Ver PDF' style='width: 27px; height: 30px; margin-left: 6px;' title='Ver PDF'>
                 </a>";


        
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
        

        case "AgregarCurso":
            $datos=$Curso->AgregarCurso($_POST["fecha_curso"],$_POST["tema_curso"],$_POST["ponente_curso"],$_POST["archivo_curso"],$_POST["descripcion_curso"]);
            echo json_encode(["success" => $Curso]);
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

        case "EliminarCurso":
            $datos = $Curso->EliminarCurso($_POST['id_curso']);
            echo json_encode(["success" => $datos]);
        break;

        case "CursosXid":
            $data = $Curso->CursoXid($_POST['id_curso']);
            $DatosDeRespuesta = array(); 
        
            foreach ($data as $resultado) {
                $DatosDeRespuesta["id_curso"] = $resultado["id_curso"];
                $DatosDeRespuesta["fecha_curso"] = $resultado["fecha_curso"];
                $DatosDeRespuesta["tema_curso"] = $resultado["tema_curso"];
                $DatosDeRespuesta["ponente_curso"] = $resultado["ponente_curso"];
        
                // Pasar el archivo PDF como string base64
                $DatosDeRespuesta["archivo_curso"] = htmlspecialchars($resultado["archivo_curso"]); // Codificar a Base64
        
                $DatosDeRespuesta["descripcion_curso"] = $resultado["descripcion_curso"];
            }
        
            echo json_encode($DatosDeRespuesta);
        break;
        
        
        
        


    }
?>
