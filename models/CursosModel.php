<?php
class Cursos extends Conectar
{
    public function TodosCursos()
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "SELECT 
                    id_curso,
                    fecha_curso,
                    tema_curso,
                    ponente_curso,
                    archivo_curso,
                    descripcion_curso
                FROM cat_cursos_tapje";

        $stmt = $conectar->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function AgregarCurso($fecha_curso, $tema_curso, $ponente_curso, $archivo_curso, $descripcion_curso)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();
    
        $sql = "INSERT INTO cat_cursos_tapje (fecha_curso, tema_curso, ponente_curso, archivo_curso, descripcion_curso) 
                VALUES (?, ?, ?, ?, ?)";
        $stmt = $conectar->prepare($sql);
    
            // Enlazar valores
            $stmt->bindValue(1, $fecha_curso);
            $stmt->bindValue(2, $tema_curso);
            $stmt->bindValue(3, $ponente_curso);
            $stmt->bindValue(4, $archivo_curso);
            $stmt->bindValue(5, $descripcion_curso);
    
            // Ejecutar la consulta
            $stmt->execute();
    }

    public function ActualizarCurso($id_curso, $fecha_curso, $tema_curso, $ponente_curso, $archivo_curso, $descripcion_curso)
    {
        // Conexión a la base de datos
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();
    
        $sql = "UPDATE cat_cursos_tapje SET 
                    fecha_curso = ?, 
                    tema_curso = ?, 
                    ponente_curso = ?, 
                    archivo_curso = ?, 
                    descripcion_curso = ?
                WHERE id_curso = ?";
        $stmt = $conectar->prepare($sql);
        
        // Enlazar valores
        $stmt->bindValue(1, $fecha_curso);
        $stmt->bindValue(2, $tema_curso);
        $stmt->bindValue(3, $ponente_curso);
        $stmt->bindValue(4, $archivo_curso);
        $stmt->bindValue(5, $descripcion_curso);
        $stmt->bindValue(6, $id_curso); // Aquí enlazas el id_curso
        
        // Ejecutar la consulta
        $stmt->execute();
    }

    public function EliminarCurso($id)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "DELETE FROM cat_cursos_tapje WHERE id_curso = ?";
        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $id);
        return $stmt->execute();
    }

    public function CursoXid($id)
    {
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        $sql = "SELECT 
                    id_curso,
                    fecha_curso,
                    tema_curso,
                    ponente_curso,
                    archivo_curso,
                    descripcion_curso
                FROM cat_cursos_tapje
                Where id_curso=?";

        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $id);
        $stmt->execute();
        return $stmt->fetchAll();
    }

}
?>
