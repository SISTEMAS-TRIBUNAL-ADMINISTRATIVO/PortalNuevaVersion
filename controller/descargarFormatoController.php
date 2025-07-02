<?php
    session_start();
    require_once("../config/conexion.php");
    require_once("../models/FormatosModel.php"); // Ajusta la ruta a tu modelo

if (!isset($_GET['id'])) {
    die("ID no proporcionado.");
}

$id = $_GET['id'];
$formato = new Formatos();
$datos = $formato->ObtenerFormatoPorID($id); // Debes crear esta función en tu modelo

 foreach ($datos as $resultado) 
 {
    header('Content-Description: File Transfer');
    header('Content-Type: ' . $resultado["tipo_archivo"]);
    header('Content-Disposition: attachment; filename="' . $resultado["nombre_archivo"] . '"');
    header('Content-Length: ' . strlen($resultado["archivo_formato"]));
    echo $resultado["archivo_formato"];
    exit;
  }