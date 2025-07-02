<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/FormatosModel.php");
    require_once("../models/PermisosExtrasModal.php");
    require_once("../models/CatalogoModel.php");
       
    $Formato = new Formatos();
    $Permisos_extras = new Permisos_extras();
    $Catalogo = new Catalogo();
    header('Content-Type: application/json');


    
switch ($_GET["opcion"]) 
    {
        case "TodosFormatos":
            $datos = $Formato->AllFormatos();
            $data = array(); 
            
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta = array();
                $DatosDeRespuesta[] = $resultado["nombre_formato"] ." ( ". $resultado["area_sube_formato"] ." )";
                $DatosDeRespuesta[] = $resultado["fecha_subida"];

                if($_SESSION['id_rol']==3)
                {
                    $DatosDeRespuesta[] = '<a href="../../../controller/descargarFormatoController.php?id=' . $resultado["id_formato"] . '" class="btn btn-success"> Descargar </a>

                                        <button class="btn btn-danger eliminar-formato" 
                                                data-id="' . $resultado["id_formato"] . '" title="Eliminar">
                                            <i class="bi bi-trash"></i> Eliminar
                                        </button>';
                }
                else
                {
                    $datos = $Permisos_extras->Permisos_extras_Portal($_SESSION['Enlace']);
                    $Respuesta["TienePermiso"] = 'NO';

                    foreach($datos as $Resultado)
                    {
                        if($Resultado["fk_permiso_extra"]==1)
                        {
                            $Respuesta["TienePermiso"] = 'SI';
                        }
                    }

                    if($Respuesta["TienePermiso"] == 'SI')
                    {
                        $DatosDeRespuesta[] = '<a href="../../../controller/descargarFormatoController.php?id=' . $resultado["id_formato"] . '" class="btn btn-success"> Descargar </a>

                                        <button class="btn btn-danger eliminar-formato" 
                                                data-id="' . $resultado["id_formato"] . '" title="Eliminar">
                                            <i class="bi bi-trash"></i> Eliminar
                                        </button>';
                    }
                    else
                    {
                        $DatosDeRespuesta[] = '<a href="data:'.$resultado["tipo_archivo"].';
                                        base64,'.base64_encode($resultado["archivo_formato"]).'" 
                                        download="'.$resultado["nombre_archivo"].'">
                                        <button class="btn btn-success">Descargar</button></a>';
                    }
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
        

        case "guardaryeditar":

            $datos = $Catalogo->Cat_area_x_id( $_SESSION["fk_area_pertenece_siga "] );

            foreach($datos as $Resultado)
            {
                $area = $Resultado["ads_descripcion"];
            }

             if(empty($_POST["id_formato"]))
             {
                $archivo = $_FILES["archivo_formato"];
                $nombreArchivo = $archivo["name"];
                $tipoArchivo = $archivo["type"];
                $contenidoArchivo = file_get_contents($archivo["tmp_name"]);
                $Formato->AgregarFormato($_POST["nombreFormato"], $nombreArchivo, $tipoArchivo, $contenidoArchivo, $area);
             }
             else
             {
                $Formato->ActualizarFormato($_POST["id_formato"], $_POST["fecha_formato"], $_POST["nombre"], $_POST["archivo_formato"], $_POST["extencion_formato"], $area);
             }

             echo json_encode([
                                "status" => "success",
                                "message" => "Formato guardado correctamente."
                            ]);

        break;

        case "eliminar":
            $id = $_POST["id_formato"];
            $resultado = $Formato->EliminarFormato($id);
            
            echo json_encode([
                                "status" => "success",
                                "message" => "Formato guardado correctamente."
                            ]);
        break;


    }
?>
