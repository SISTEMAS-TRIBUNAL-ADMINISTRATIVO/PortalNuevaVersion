<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/BienesInformaticosModel.php");
       
    $BinesInformaticos = new BienesInformaticos();
    header('Content-Type: application/json');


    
switch ($_GET["opcion"]) 
    {
        case "TodosBienesInformaticos":
                $datos = $BinesInformaticos->VerBienesInformaticos();
                $data = array(); 
                
                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta = array();
                    $DatosDeRespuesta[] = $resultado["id_equipo"];
                    $DatosDeRespuesta[] = $resultado["Descripcion"];
                    $DatosDeRespuesta[] = $resultado["Marca"];
                    $DatosDeRespuesta[] = $resultado["Modelo"];
                    $DatosDeRespuesta[] = $resultado["Serie"];
                    $DatosDeRespuesta[] = $resultado["Inventario"];
                    $DatosDeRespuesta[] = $resultado["Origen_del_Equipo"];
                    $DatosDeRespuesta[] = $resultado["Factura"];
                    $DatosDeRespuesta[] = $resultado["Fecha_Adsquisicion"];
                    $DatosDeRespuesta[] = $resultado["Costo_Original"];
                    $DatosDeRespuesta[] = $resultado["Disponibilidad"];
                    $DatosDeRespuesta[] = '<button type="button" onClick="ver('.$resultado["id_equipo"].');"  id="'.$resultado["id_equipo"].'" class="btn btn-link btn-inline ladda-button"><i class="fa fa-eye">Ver</i></button>';
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

            case "DetallesBienInfoXid":
                //$datos = $BinesInformaticos->DetallesBienInfXid(721);
                $datos = $BinesInformaticos->DetallesBienInfXid($_POST['id_equipo']);
                $DatosDeRespuesta = array();
                
                foreach ($datos as $resultado) {
                    $DatosDeRespuesta["id_licencia_antivirus"] = $resultado["id_licencia_antivirus"];
                    $DatosDeRespuesta["Descripcion"] = $resultado["Descripcion"];
                    $DatosDeRespuesta["Marca"] = $resultado["Marca"];
                    $DatosDeRespuesta["Modelo"] = $resultado["Modelo"];
                    $DatosDeRespuesta["Serie"] = $resultado["Serie"];
                    $DatosDeRespuesta["Inventario"] = $resultado["Inventario"];
                    $DatosDeRespuesta["Origen_del_Equipo"] = $resultado["Origen_del_Equipo"];
                    $DatosDeRespuesta["fk_factura"] = $resultado["fk_factura"];
                    $DatosDeRespuesta["Factura"] = $resultado["Factura"];
                    $DatosDeRespuesta["Folio_Fiscal"] = $resultado["Folio_Fiscal"];
                    $DatosDeRespuesta["Fecha_Adsquisicion"] = $resultado["Fecha_Adsquisicion"];
                    $DatosDeRespuesta["uso_cfdi"] = $resultado["uso_cfdi"];
                    $DatosDeRespuesta["Observaciones_Factura"] = $resultado["Observaciones_Factura"];
                    $DatosDeRespuesta["Disponibilidad"] = $resultado["Disponibilidad"];
                    $DatosDeRespuesta["equipo_observaciones"] = $resultado["equipo_observaciones"];
                    $DatosDeRespuesta["costo_original"] = $resultado["costo_original"];
                    $DatosDeRespuesta["costo_actual"] = $resultado["costo_actual"];
                    $DatosDeRespuesta["Caracteristicas"] = $resultado["Caracteristicas"];
                    $DatosDeRespuesta["licencia_privada_office"] = $resultado["licencia_privada_office"];
                    $DatosDeRespuesta["fecha_caducidad_office"] = $resultado["fecha_caducidad_office"];
                    $DatosDeRespuesta["licencia_publica"] = $resultado["licencia_publica"];
                    $DatosDeRespuesta["licencia_privada"] = $resultado["licencia_privada"];
                    $DatosDeRespuesta["fecha_registro"] = $resultado["fecha_registro"];
                    $DatosDeRespuesta["fecha_caducidad"] = $resultado["fecha_caducidad"];
                    $DatosDeRespuesta["MAC"] = $resultado["MAC"];
                    $DatosDeRespuesta["Nombre_proveedor"] = $resultado["Nombre_proveedor"];                   
                    $DatosDeRespuesta["siglas_proveedor"] = $resultado["siglas_proveedor"];
                    $DatosDeRespuesta["fk_resguardante"] = $resultado["fk_resguardante"];
                    $DatosDeRespuesta["fk_marca"] = $resultado["fk_marca"];
                    $DatosDeRespuesta["tiene_garantia"] = $resultado["tiene_garantia"];
                    $DatosDeRespuesta["fecha_inicial_garantia"] = $resultado["fecha_inicial_garantia"];
                    $DatosDeRespuesta["fecha_final_garantia"] = $resultado["fecha_final_garantia"];
                    $DatosDeRespuesta["tiene_cuenta_contable"] = $resultado["tiene_cuenta_contable"];
                    $DatosDeRespuesta["cuenta"] = $resultado["cuenta"];
                    $DatosDeRespuesta["subcuenta"] = $resultado["subcuenta"];
                    $DatosDeRespuesta["sub_subcuenta"] = $resultado["sub_subcuenta"];
                    $DatosDeRespuesta["comentarios_cuenta_contable"] = $resultado["comentarios_cuenta_contable"];
                    $DatosDeRespuesta["equipo_ubicacion"] = $resultado["equipo_ubicacion"];

                        $DatosDeRespuesta["imagen_equipo"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_equipo"]);
                        $DatosDeRespuesta["imagen_anexo"] ='data:image/jpeg;base64,'. base64_encode( $resultado["imagen_anexo"]); 

                        $pdf_content = $resultado["pdf_anexo"];
        
                        // Asegúrate de que el contenido se maneje adecuadamente
                        //$DatosDeRespuesta["pdf_anexo"] = 'data:application/pdf;base64,' . base64_encode($pdf_content);
                       

                               
                }   try {
                // Retorna los datos en formato JSON
                echo json_encode($DatosDeRespuesta);
                break;
            } catch (Exception $e) {
                echo json_encode(["error" => $e->getMessage()]);
            }
            
            
    }
?>
    