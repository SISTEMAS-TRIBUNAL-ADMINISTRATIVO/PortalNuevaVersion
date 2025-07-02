<?php
session_start();
require_once("../config/conexion.php");
require_once("../models/NotificacionesModel.php");
require_once("../models/UsuarioModel.php");
require_once("../models/CatalogoModel.php");
   
$Catalogo = new Catalogo();
$Notificacion = new Notificacion();
$usuario = new Usuario();
$html = '';

switch ($_GET["opcion"]) 
{
    case "TodasNotificaciones":

        $datos = $Notificacion->LlamarNotificacion(11, $_SESSION['Enlace']);
        $fechaHoy = date('Y-m-d');
        $fechaHoyObj = new DateTime($fechaHoy);

        foreach ($datos as $resultado) 
        {
            $fechaCreacionObj = new DateTime($resultado['fecha_notificacion']);
            $intervalo = $fechaCreacionObj->diff($fechaHoyObj);
            $diasTranscurridos = $intervalo->days;
            $imagePath = '../../public/images/notificacion (1).png';


            if($resultado["esta_programado"] == "1" )
            {
                if($resultado["fecha_programado"] == date('Y-m-d'))
                {
                    $html .= "<div class='card text-center'>
                                <div class='' style='color: navy blue; font-size:15px;'>NOTIFICACIÓN</div>
                                <div class='' style='color: red; font-size:15px;'> Hace ".$diasTranscurridos." días</div>
                                <div class='card-body'>
                                    <img src='" . $imagePath . "' alt='Imagen de notificación' class='card-img-top' style='max-height: 120px; object-fit: contain;'>
                                    <h5 class='card-title'>" . $resultado['Titulo_notificacion'] . "</h5>
                                    <a href='' class='card-text' target='_blank' onclick='notificacionClick(" . $resultado['idnotificacion'] . "); return false;'>" . $resultado['mensaje_corto_notificacion'] . "</a>
                                </div>
                            </div>";
        
                }
            }
            else
            {
                $html .= "<div class='card text-center'>
                            <div class='' style='color: navy blue; font-size:15px;'>NOTIFICACIÓN</div>
                            <div class='' style='color: red; font-size:15px;'> Hace ".$diasTranscurridos." días</div>
                            <div class='card-body'>
                               <img src='" . $imagePath . "' alt='Imagen de notificación' class='card-img-top' style='max-height: 120px; object-fit: contain;'>
                                <h5 class='card-title'>" . $resultado['Titulo_notificacion'] . "</h5>
                                <a href='' class='card-text' target='_blank' onclick='notificacionClick(" . $resultado['idnotificacion'] . "); return false;'>" . $resultado['mensaje_corto_notificacion'] . "</a>
                            </div>
                        </div>";
            }
        }


        echo $html;
    break;

    case "NotificaionCumpleaños":
        $datos = $Notificacion->LlamarNotificacionCumpleaños($_SESSION['Enlace']);
        $DatosDeRespuesta = array();

        if(is_array($datos)==true and count($datos)>0)
        {
            foreach ($datos as $resultado) 
            {
                if($resultado["esta_programado"] == "1" )
                {
                    if($resultado["fecha_programado"] == date('Y-m-d'))
                    {
                        $DatosDeRespuesta["MostrarModal"] = "SI";
                    }
                    else
                    {
                        $DatosDeRespuesta["MostrarModal"] = "NO";
                    }
                }   
                else
                {
                    $DatosDeRespuesta["MostrarModal"] = "SI";
                }

                $DatosDeRespuesta["Titulo"] = $resultado["Titulo_notificacion"];
                $DatosDeRespuesta["Mensaje"] = $resultado["mensaje_notificacion"];
                $DatosDeRespuesta["fotoBase64"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_notificacion"]);
            }
        }
        else
        {
            $DatosDeRespuesta["MostrarModal"] = "NO";
        }

        echo json_encode($DatosDeRespuesta);   

    break;

    case "NotificacionXid":
        $datos = $Notificacion->LlamarNotificacionXid($_POST['idnotificacion']);
        $DatosDeRespuesta = array();

        if(is_array($datos)==true and count($datos)>0)
        {
            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta["Titulo"] = $resultado["Titulo_notificacion"];
                $DatosDeRespuesta["Mensaje"] = $resultado["mensaje_corto_notificacion"];
                $DatosDeRespuesta["Mensaje_largo"] = $resultado["mensaje_notificacion"];
                $DatosDeRespuesta["fecha_notificacion"] = $resultado["fecha_notificacion"];
                $DatosDeRespuesta["fotoBase64"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_notificacion"]);
            }
        }

        echo json_encode($DatosDeRespuesta);   

    break;


     case "ListarNotificaciones":

        if($_SESSION['id_rol'] == 3)
        {
            $datos = $Notificacion->TodasLasNotificaciones();
        }
        else
        {
            $datos = $Notificacion->TodasLasNotificacionesPorAreas($_SESSION['fk_area_pertenece_siga']);
        }

        $data = array(); 
        
        foreach ($datos as $resultado) 
        {
            $DatosDeRespuesta = array();
            $DatosDeRespuesta[] = $resultado["nombre_notificacion"];
            $DatosDeRespuesta[] = $resultado["mensaje_corto_notificacion"];


            if($resultado["fk_usuario_se_notifica"]==0)
            {
                $DatosDeRespuesta[] = "Todos los usuarios";
            }
            else
            {
                $Datosusuario = $usuario->DetallesUsuarioXid($resultado["fk_usuario_se_notifica"]);
                $DatosDeRespuesta[] = $usuario[0]["nombres"] . " " . $usuario[0]["paterno"] . " " . $usuario[0]["materno"];
            }


            $DatosDeRespuesta[] = $resultado["fecha_notificacion"];


            if($resultado["esta_programado"] == 1)
            {
                $DatosDeRespuesta[] = "Programada";
            }
            else
            {
                if($resultado["vigencia_notificacion"] <= date("Y-m-d"))
                {
                    $DatosDeRespuesta[] = "Activa";
                }
                else
                {
                    $DatosDeRespuesta[] = "vencida";
                }
            }

                $DatosDeRespuesta[] = '
                                    <button class="btn btn-info ver-notificacion" 
                                            data-id="' . $resultado["idnotificacion"] . '" title="Ver">
                                        <i class="bi bi-eye"></i> Ver
                                    </button>

                                    <button class="btn btn-primary editar-notificacion" 
                                            data-id="' . $resultado["idnotificacion"] . '" title="Editar">
                                        <i class="bi bi-pencil-square"></i> Editar
                                    </button>

                                    <button class="btn btn-danger eliminar-formato" 
                                            data-id="' . $resultado["id_formato"] . '" title="Eliminar">
                                        <i class="bi bi-trash"></i> Eliminar
                                    </button>';
            

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


    case "cat_Tipo_de_aviso":
        $datos = $Catalogo->cat_Tipo_de_aviso();

        if(is_array($datos)==true and count($datos)>0){
            foreach($datos as $row)
            {
                $html.= "<option value='".$row['idtiponotificacion']."'>".$row['Nombre_notificacion']."</option>";
            }
            echo $html;
        }    
    break;
    
}




  
   