<?php
class Formatos extends Conectar
{
    public function AllFormatos()
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "SELECT * FROM cat_formatos";

        $stmt = $conectar->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function ObtenerFormatoPorID($id_formato)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "SELECT * FROM cat_formatos WHERE id_formato=?";

        $stmt = $conectar->prepare($sql);
        $stmt->bindParam(1, $id_formato);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function AgregarFormato($nombreFormato, $nombreArchivo, $tipoArchivo, $contenidoArchivo, $area) 
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();
    
        $sql = " INSERT INTO cat_formatos 
                    SET 
                        nombre_formato=?,
                        nombre_archivo=?, 
                        tipo_archivo=?, 
                        archivo_formato=?,
                        area_sube_formato=?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindParam(1, $nombreFormato);
            $stmt->bindParam(2, $nombreArchivo);
            $stmt->bindParam(3, $tipoArchivo);
            $stmt->bindParam(4, $contenidoArchivo, PDO::PARAM_LOB);
            $stmt->bindParam(5, $area);
            $stmt->execute();
    }

    public function ActualizarFormato($id_formato, $fecha_formato, $nombre, $archivo_formato, $extencion_formato)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();
    
        $sql = "UPDATE cat_formatos_informatica_tapje SET 
                    fecha_formato = ?, 
                    nombre = ?, 
                    archivo_formato = ?, 
                    extencion_formato = ?
                WHERE id_formato = ?";
        $stmt = $conectar->prepare($sql);
        

        $stmt->bindValue(1, $fecha_formato);
        $stmt->bindValue(2, $nombre);
        $stmt->bindValue(3, $archivo_formato);
        $stmt->bindValue(4, $extencion_formato);
        $stmt->bindValue(5, $id_formato); 
        $stmt->execute();
    }

    
    public function EliminarFormato($idFormato)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();
    
        $sql = " DELETE FROM cat_formatos WHERE id_formato =?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindParam(1, $idFormato);
            $stmt->execute();
    }
}
?>
