<?php
    require_once("../config/conexion.php");
    require_once("../models/CatalogoModel.php");
    $Catalogo = new Catalogo();
    $html = "";

    switch($_GET["opciones"])
    {
        case "cat_ubicaciones":
            $datos = $Catalogo->Cat_Ubicaciones();

            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row)
                {
                    $html.= "<option value='".$row['id_ads_adscripcion']."'>".$row['ads_descripcion']."</option>";
                }
                echo $html;
            }    
        break;

        case "cat_Pisos":
            $datos = $Catalogo->cat_Pisos();

            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row)
                {
                    $html.= "<option value='".$row['id_piso']."'>".$row['piso_nombre']."</option>";
                }
                echo $html;
            }    
        break;
    }
?>