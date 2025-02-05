<?php
class Avisos extends Conectar
{
    public function ObtenerTodosLosAvisos($fkArea, $fkUser) 
    {
        // Crear conexión a la base de datos
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        // Definir consulta SQL
        $sql = "
               SELECT 
                idnotificacion,
                Nombre_notificcion,
                mensaje_notificacion,
                imagen_notificacion,
                fk_usuario_se_notifica,
                fk_area,
                fecha_notificacion,
                IF(estado_notificacion= 1, 'Activo', 'Cerrado') AS nombre_estado,
                estado_notificacion,
                mensaje_corto_notificacion,
                Titulo_notificacion,
                vigencia_notificacion,
                IF(esta_programado= 1, 'SI', 'No') AS esta_programado,
                fk_user_crea,
                fk_area_crea,
                fecha_programado
            FROM pri_notificacion
            INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
            WHERE fk_user_crea=?
            OR fk_area_crea=?";

        // Preparar y ejecutar la consulta
        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $fkUser); 
        $stmt->bindValue(2, $fkArea);
        $stmt->execute();

        // Obtener resultados
        $resultado = $stmt->fetchAll();
        return $resultado;
    }

    public function ObtenerTipoDeAvisos() 
    {
        // Crear conexión a la base de datos
        $conectar = parent::conexion("portal_empleado");
        parent::set_names();

        // Definir consulta SQL
        $sql = " SELECT * 
	            FROM cat_tipo_notificacion";

        // Preparar y ejecutar la consulta
        $stmt = $conectar->prepare($sql);
        $stmt->execute();

        // Obtener resultados
        $resultado = $stmt->fetchAll();
        return $resultado;
    }
}
?>
