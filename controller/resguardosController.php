<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/ResguardosModel.php");
    require_once("../models/CatalogoModel.php");
    require_once("../models/EmpleadosModel.php");


    $Catalogo = new Catalogo();
    $Resguardo = new Resguardos();
    $Empleados = new Empleados();
    header('Content-Type: application/json');


    switch ($_GET["opcion"]) 
    {
        case "ResguardosxEmpleado":
            $datos = $Resguardo->ResguardosEmpleadoXid($_SESSION['Enlace']);
            $data = array(); 
    
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta = array();
                $DatosDeRespuesta[] = "<td><img src='data:image/jpeg;base64," . base64_encode($resultado['Imagen']) . "' width='100' height='100'/></td>";
                $DatosDeRespuesta[] = $resultado["Descripcion"];
                $DatosDeRespuesta[] = $resultado["Marca"];
                $DatosDeRespuesta[] = $resultado["Modelo"];
                $DatosDeRespuesta[] = $resultado["Serie"];
                $DatosDeRespuesta[] = $resultado["Inventario"];
                $DatosDeRespuesta[] = $resultado["Alta"];
                $DatosDeRespuesta[] = $resultado["Observacion"];
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

        case "ResguardosxEmpleadoPDF":
                $datos = $Resguardo->ResguardosxEmpleadoPDF($_SESSION['Enlace']);
                $DatosDeRespuesta = array(); 

                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta["pdf_resguardo"] = $resultado["pdf_resguardo"];
                }
                echo json_encode($DatosDeRespuesta);
        break;
    }
?>
            