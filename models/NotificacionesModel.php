<?php

    class Notificacion extends Conectar 
    {

        public function LlamarNotificacion($fkArea, $fkUser) 
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();
            $FechaDeHoy = date('Y-m-d');

            $sql = "
                   SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=1
                    AND vigencia_notificacion >= '".$FechaDeHoy."'
                UNION
                    SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion= 2
                    AND fk_area=?
                    AND vigencia_notificacion >= '".$FechaDeHoy."'
                UNION 
                    SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=4
                    AND fk_usuario_se_notifica=?
                    AND vigencia_notificacion >= '".$FechaDeHoy."'
                ORDER BY idnotificacion DESC";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $fkArea); 
            $stmt->bindValue(2, $fkUser);
            $stmt->execute();
            $resultado = $stmt->fetchAll();
            return $resultado;
        }

        public function LlamarNotificacionCumpleaños($fkUser) 
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();
            $FechaDeHoy = date('Y-m-d');

            $sql = "SELECT *
                    FROM pri_notificacion
                    INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                    WHERE fk_tipo_notificacion=3
                    AND fk_usuario_se_notifica=?
                    AND estado_notificacion=1                 
                    AND vigencia_notificacion >= '".$FechaDeHoy."'";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $fkUser); 
            $stmt->execute();
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

        public function TodasLasNotificaciones() 
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = " SELECT 
                        nombre_notificacion,
                        fk_usuario_se_notifica,
                        fecha_notificacion,
                        mensaje_corto_notificacion,
                        fk_user_crea,
                        esta_programado
                     FROM pri_notificacion
                     INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion";

            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $resultado = $stmt->fetchAll();
            return $resultado;
        }

        public function TodasLasNotificacionesPorAreas($IdArea) 
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = " SELECT 
                        nombre_notificacion,
                        fk_usuario_se_notifica,
                        fecha_notificacion,
                        mensaje_corto_notificacion,
                        fk_user_crea,
                        esta_programado
                     FROM pri_notificacion
                     INNER JOIN cat_tipo_notificacion ON fk_tipo_notificacion = idtiponotificacion
                     WHERE fk_area_crea = ?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $IdArea);
            $stmt->execute();
            $resultado = $stmt->fetchAll();
            return $resultado;
        }

        public function ObtenerTipoDeAvisos() 
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = " SELECT * 
                    FROM cat_tipo_notificacion";

            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $resultado = $stmt->fetchAll();
            return $resultado;
        }
    }

    