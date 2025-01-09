<?php
    //session_start();
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

        case "ResguardosEmpleadoXid":
                    $datos = $Resguardo->ResguardosEmpleadoXid($_POST['id_empleado']);
                    $data = array(); 
            
                    foreach ($datos as $resultado) 
                    {
                        $DatosDeRespuesta = array();
                        $DatosDeRespuesta[] = $resultado["Descripcion"];
                        $DatosDeRespuesta[] = $resultado["Marca"];
                        $DatosDeRespuesta[] = $resultado["Modelo"];
                        $DatosDeRespuesta[] = $resultado["Serie"];
                        $DatosDeRespuesta[] = $resultado["Inventario"];
                        $DatosDeRespuesta[] = $resultado["Observacion"];
                        $DatosDeRespuesta[] = $resultado["Alta"];
                        $DatosDeRespuesta[] = $resultado["Origen_del_Equipo"];
                        $DatosDeRespuesta[] = '<button type="button" onClick="ver('.$resultado["id_resguardo"].');"  id="'.$resultado["id_resguardo"].'" class="btn btn-inline btn-primary btn-sm ladda-button"><i class="fa fa-edit"></i></button>';
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

        case "ResguardosxEmpleado":
            $datos = $Resguardo->ResguardosEmpleadoXid($_SESSION['Enlace']);
            $data = array(); 
    
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta = array();
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

        case "Historial":
            //$datos = $Resguardo->Historial(118);
            $datos = $Resguardo->Historial($_POST['id_equipo']);
            $data = array(); 
    
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta = array();
                $DatosEmpleado = $Empleados->EmpleadoXid($resultado["fk_empleado"]);

                foreach($DatosEmpleado as $ResultadosEmpleado)
                {
                    $DatosDeRespuesta[] = $ResultadosEmpleado['Empleado'];
                }

                $DatosDeRespuesta[] = $resultado["Alta"];
                $DatosDeRespuesta[] = $resultado["Baja"];
                $DatosDeRespuesta[] = $resultado["Estado"];
                $DatosDeRespuesta[] = $resultado["observacion"];
                $DatosDeRespuesta[] = $resultado["observacion_baja"];


                $DatosUbicacion = $Catalogo->Cat_Ubicaciones($resultado["fk_ubicacion"]);

                
                foreach($DatosUbicacion as $ResultadosUbicacion)
                {
                    $DatosDeRespuesta[] = $ResultadosUbicacion['ads_descripcion'];
                }

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

            case "Mantenimiento":
                $datos = $Resguardo->Mantenimiento(118);
                //$datos = $Resguardo->Historial($_POST['id_resguardo']);
                $data = array(); 
        
                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta = array();
                    $DatosEmpleado = $Empleados->EmpleadoXid($resultado["fk_resguardante"]);

                    $DatosDeRespuesta[] = $resultado["folio_recepcion"];
                    $DatosDeRespuesta[] = $resultado["fecha_recepcion"];
                    $DatosDeRespuesta[] = $resultado["Baja"];
    
                    foreach($DatosEmpleado as $ResultadosEmpleado)
                    {
                        $DatosDeRespuesta[] = $ResultadosEmpleado['Empleado'];
                    }
    
                    $DatosDeRespuesta[] = $resultado["observaciones"];
    
    
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
            