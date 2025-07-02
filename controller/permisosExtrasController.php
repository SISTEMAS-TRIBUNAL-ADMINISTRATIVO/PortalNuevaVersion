<?php
session_start();
require_once("../config/conexion.php");
require_once("../models/PermisosExtrasModal.php");

$Permisos_extras = new Permisos_extras();
$html = '';

switch ($_GET["opcion"]) 
{
    case "AgregarFormato":

        $Respuesta["TienePermiso"] = 'NO';
        
        if($_SESSION['id_rol']==3)
        {
            $Respuesta["TienePermiso"] = 'SI';
        }
        else
        {
            $datos = $Permisos_extras->Permisos_extras_Portal($_SESSION['Enlace']);

            foreach($datos as $Resultado)
            {
                if($Resultado["fk_permiso_extra"]==1)
                {
                    $Respuesta["TienePermiso"] = 'SI';
                }
            }
        }
        
        echo json_encode($Respuesta);
        
    break;

    case "AgregarNotificacion":

        $Respuesta["TienePermiso"] = 'NO';
        
        if($_SESSION['id_rol']==3)
        {
            $Respuesta["TienePermiso"] = 'SI';
        }
        else
        {
            $datos = $Permisos_extras->Permisos_extras_Portal($_SESSION['Enlace']);

            foreach($datos as $Resultado)
            {
                if($Resultado["fk_permiso_extra"]==2)
                {
                    $Respuesta["TienePermiso"] = 'SI';
                }
            }
        }
        
        echo json_encode($Respuesta);
        
    break;
}