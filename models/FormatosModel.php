<?php
class Formatos extends Conectar
{
    public function AllFormatos()
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "SELECT 
                    id_formato,
                    fecha_formato,
                    nombre,
                    archivo_formato,
                    extencion_formato
                FROM cat_formatos_informatica_tapje";

        $stmt = $conectar->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function AgregarFormato($fecha_formato, $nombre, $archivo_formato, $extencion_formato)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();
    
        $sql = "INSERT INTO cat_formatos_informatica_tapje (fecha_formato, nombre, archivo_formato, extencion_formato) 
                VALUES (?, ?, ?, ?)";
        $stmt = $conectar->prepare($sql);
    
            // Enlazar valores
            $stmt->bindValue(1, $fecha_formato);
            $stmt->bindValue(2, $nombre);
            $stmt->bindValue(3, $archivo_formato);
            $stmt->bindValue(4, $extencion_formato);
    
            // Ejecutar la consulta
            $stmt->execute();
    }

    public function ActualizarFormato($id_formato, $fecha_formato, $nombre, $archivo_formato, $extencion_formato)
    {
        // Conexión a la base de datos
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();
    
        $sql = "UPDATE cat_formatos_informatica_tapje SET 
                    fecha_formato = ?, 
                    nombre = ?, 
                    archivo_formato = ?, 
                    extencion_formato = ?
                WHERE id_formato = ?";
        $stmt = $conectar->prepare($sql);
        
        // Enlazar valores
        $stmt->bindValue(1, $fecha_formato);
        $stmt->bindValue(2, $nombre);
        $stmt->bindValue(3, $archivo_formato);
        $stmt->bindValue(4, $extencion_formato);
        $stmt->bindValue(5, $id_formato); // Aquí enlazas el id_curso
        
        // Ejecutar la consulta
        $stmt->execute();
    }

    public function EliminarFormato($id)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "DELETE FROM cat_formatos_informatica_tapje WHERE id_formato = ?";
        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $id);
        return $stmt->execute();
    }

    public function FormatoXid($id)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "SELECT 
                    id_formato,
                    fecha_formato,
                    nombre,
                    archivo_formato,
                    extencion_formato
                FROM cat_formatos_informatica_tapje
                Where id_formato=?";

        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $id);
        $stmt->execute();
        return $stmt->fetchAll();
    }

}
?>
