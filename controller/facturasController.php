<?php
    require_once("../config/conexion.php");
    require_once("../models/facturasModel.php");
       
    $Facturas = new Facturas();
    header('Content-Type: application/json');


    switch ($_GET["opcion"]) 
    {

        case "getFacturas":
                    $datos = $Facturas->get_facturas();
                    $data = array(); 
            
                    foreach ($datos as $resultado) 
                    {
                        $DatosDeRespuesta = array();
                        $DatosDeRespuesta[] = $resultado["fecha_emision"];
                        $DatosDeRespuesta[] = $resultado["folio"];
                        $DatosDeRespuesta[] = $resultado["folio_fiscal"];
                        $DatosDeRespuesta[] = $resultado["nombre_proveedor"];
                        $DatosDeRespuesta[] = $resultado["uso_cfdi"];
                        $DatosDeRespuesta[] = $resultado["observaciones_factura"];
                        $DatosDeRespuesta[] = '<button type="button" onClick="ver('.$resultado["id_factura"].');"  id="'.$resultado["id_factura"].'" class="btn btn-inline btn-primary btn-sm ladda-button"><i class="fa fa-edit"></i></button>';
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

        case "getFacturaXid":
            $datos = $Facturas->get_facturasXid($_POST['id_factura']);

            foreach ($datos as $resultado) 
            {
                $Respuesta["id_factura"]=$resultado["id_factura"];
                $Respuesta["fecha_emision"]=$resultado["fecha_emision"];
                $Respuesta["folio"]=$resultado["folio"];
                $Respuesta["folio_fiscal"]=$resultado["folio_fiscal"];
                $Respuesta["nombre_proveedor"]=$resultado["nombre_proveedor"];
                $Respuesta["uso_cfdi"]=$resultado["uso_cfdi"];
                $Respuesta["observaciones_factura"]=$resultado["observaciones_factura"];
            }
            echo json_encode($Respuesta);
        break;
        
    }
?>
            