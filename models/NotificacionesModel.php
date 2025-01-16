<?php

    class Notificacion extends Conectar 
    {

        public function LlamarNotificacion($fkArea, $fkUser) 
        {
            // Crear conexión a la base de datos
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            // Definir consulta SQL
            $sql = "
                   SELECT 
                        idnotificacion,
                        mensaje_notificacion AS Mensaje,
                        imagen_notificacion AS Imagen,
                        fk_usuario_se_notifica AS UsuarioNotificado,
                        fk_area AS AREA,
                        fecha_notificacion AS Fecha,
                        Nombre_notificcion AS TipoNotificacion
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=1
                    AND estado_notificacion=1
                UNION
                    SELECT 
                        idnotificacion,
                        mensaje_notificacion AS Mensaje,
                        imagen_notificacion AS Imagen,
                        fk_usuario_se_notifica AS UsuarioNotificado,
                        fk_area AS AREA,
                        fecha_notificacion AS Fecha,
                        Nombre_notificcion AS TipoNotificacion
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion= 2
                    AND fk_area=?
                    AND estado_notificacion=1
                UNION 
                    SELECT 
                        idnotificacion,
                        mensaje_notificacion AS Mensaje,
                        imagen_notificacion AS Imagen,
                        fk_usuario_se_notifica AS UsuarioNotificado,
                        fk_area AS AREA,
                        fecha_notificacion AS Fecha,
                        Nombre_notificcion AS TipoNotificacion
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=3
                    AND fk_usuario_se_notifica=?
                    AND estado_notificacion=1
                 UNION 
                    SELECT 
                        idnotificacion,
                        mensaje_notificacion AS Mensaje,
                        imagen_notificacion AS Imagen,
                        fk_usuario_se_notifica AS UsuarioNotificado,
                        fk_area AS AREA,
                        fecha_notificacion AS Fecha,
                        Nombre_notificcion AS TipoNotificacion
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=4
                    AND fk_usuario_se_notifica=?
                    AND estado_notificacion=1";

            // Preparar y ejecutar la consulta
            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $fkArea); 
            $stmt->bindValue(2, $fkUser);
            $stmt->bindValue(3, $fkUser);
            $stmt->execute();

            // Obtener resultados
            $resultado = $stmt->fetchAll();
            return $resultado;
        }
    }

    