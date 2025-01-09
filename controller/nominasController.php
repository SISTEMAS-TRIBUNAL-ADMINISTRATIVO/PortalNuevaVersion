<?php
session_start();
require_once("../config/conexion.php");
require_once("../models/NominasModel.php");

$Nominas = new Nominas();
header('Content-Type: application/json');

switch ($_GET["opcion"]) 
{
    case "NominasEmpleado":
        $datos = $Nominas->obtenerNominas($_SESSION['Enlace']);
        //$datos = $Nominas->obtenerNominas(122); // Asegúrate de pasar el ID correcto
        $data = array(); 

        foreach ($datos as $resultado) 
        {
            $DatosDeRespuesta = array();
            $DatosDeRespuesta[] = $resultado["Empleado"];
            $DatosDeRespuesta[] = $resultado["cfdi_fecha_timbrado"];
            $DatosDeRespuesta[] = $resultado["nom_concepto"];
            $DatosDeRespuesta[] = $resultado["cfdi_mensaje"];
            // Enlazar los archivos a un modal

            
            $DatosDeRespuesta[] = "<a href='#' class='view-file' data-file='data:application/xml;base64," . base64_encode($resultado["cfdi_xml_cfdi"]) . "' data-filename='" . htmlspecialchars($resultado["cfdi_xml_cfdi"]) . "'>
                                        <img src='../../public/images/xml.png' alt='Ver XML' style='width: 33px; height: 33px; margin-left: 5px;' title='Ver XML'>
                                    </a>";
            $DatosDeRespuesta[] = "<a href='#' class='view-file' data-file='data:application/pdf;base64," . htmlspecialchars($resultado["cfdi_pdf_timbrado"]) . "' data-filename='" . htmlspecialchars($resultado["cfdi_pdf_timbrado"]) . "'>
                                        <img src='../../public/images/pdf.png' alt='Ver PDF' style='width: 27px; height: 30px; margin-left: 6px;' title='Ver PDF'>
                                   </a>";

            // Agregar la fila completa a $data
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
