<?php

    class Notificacion extends Conectar 
    {

        public function LlamarNotificacion($fkArea, $fkUser) 
        {
            // Crear conexión a la base de datos
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();
            $FechaDeHoy = date('Y-m-d');

            // Definir consulta SQL
            $sql = "
                   SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=1
                    AND estado_notificacion=1
                    AND vigencia_notificacion >= '".$FechaDeHoy."'
                UNION
                    SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion= 2
                    AND fk_area=?
                    AND estado_notificacion=1
                    AND vigencia_notificacion >= '".$FechaDeHoy."'
                UNION 
                    SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=4
                    AND fk_usuario_se_notifica=?
                    AND estado_notificacion=1
                    AND vigencia_notificacion >= '".$FechaDeHoy."'
                ORDER BY idnotificacion DESC";

            // Preparar y ejecutar la consulta
            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $fkArea); 
            $stmt->bindValue(2, $fkUser);
            $stmt->execute();

            // Obtener resultados
            $resultado = $stmt->fetchAll();
            return $resultado;
        }

        public function LlamarNotificacionCumpleaños($fkUser) 
        {
            // Crear conexión a la base de datos
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();
            $FechaDeHoy = date('Y-m-d');

            // Definir consulta SQL
            $sql = "SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=3
                    AND fk_usuario_se_notifica=?
                    AND estado_notificacion=1                 
                    AND vigencia_notificacion >= '".$FechaDeHoy."'";

            // Preparar y ejecutar la consulta
            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $fkUser); 
            $stmt->execute();

            // Obtener resultados
            $resultado = $stmt->fetchAll();
            return $resultado;
        }

        public function LlamarNotificacionXid($IdNotificacion) 
        {

            $conectar = parent::conexion("portal_empleado");
            parent::set_names();


            $sql = "SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE idnotificacion=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $IdNotificacion); 
            $stmt->execute();
            $resultado = $stmt->fetchAll();
            return $resultado;
        }
    }

    