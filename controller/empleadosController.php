<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/EmpleadosModel.php");
       
    $Empleados = new Empleados();
    header('Content-Type: application/json');


    
switch ($_GET["opcion"]) 
    {
        case "Activos":
                $datos = $Empleados->EmpleadosActivos();
                $data = array(); 
                
                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta = array();
                    $DatosDeRespuesta[] = $resultado["Plaza"];
                    $DatosDeRespuesta[] = $resultado["Enlace"];
                    $DatosDeRespuesta[] = $resultado["Empleado"];
                    $DatosDeRespuesta[] = $resultado["Categoria"];
                    $DatosDeRespuesta[] = $resultado["AREA"];
                    $DatosDeRespuesta[] = '<button type="button" onClick="ver('.$resultado["id_emp_empleado"].');"  id="'.$resultado["id_emp_empleado"].'" class="btn btn-link btn-inline ladda-button"><i class="fa fa-eye">Ver</i></button>';
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


        case "Xid":
            // Cambia 'Enlace' por 'id_empleado'
            $datos = $Empleados->EmpleadoXid($_POST["id_empleado"]);
            $DatosDeRespuesta = array();
            
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta["Plaza"] = $resultado["Plaza"];
                $DatosDeRespuesta["Enlace"] = $resultado["Enlace"];
                $DatosDeRespuesta["Empleado"] = $resultado["Empleado"];
                $DatosDeRespuesta["Categoria"] = $resultado["Categoria"];
                $DatosDeRespuesta["AREA"] = $resultado["AREA"];                
            }
            echo json_encode($DatosDeRespuesta);
            break;
    }
?>
