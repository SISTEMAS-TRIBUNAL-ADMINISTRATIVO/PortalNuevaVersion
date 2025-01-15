<?php

    class Notificacion extends Conexion 
    {

        public function LlamarNotificacion() 
        {
            // Crear conexión a la base de datos
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            // Definir consulta SQL
            $sql = "SELECT 
                        idnotificacion,
                        mensaje_notificacion AS Mensaje,
                        imagen_notificacion AS Imagen,
                        fk_usuario_se_notifica AS UsuarioNotificado,
                        fk_area AS Area,
                        fecha_notificacion AS Fecha,
                        tipo.descripcion AS TipoNotificacion
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion tipo ON fk_tipo_notificacion = tipo.idtiponotificacion
                    ORDER BY fecha_notificacion DESC";

            // Preparar y ejecutar la consulta
            $stmt = $conectar->prepare($sql);
            $stmt->execute();

            // Obtener resultados
            $resultado = $stmt->fetchAll();
            return $resultado;
        }
    }

    