<?php
    class Resguardos extends Conectar
    {

        public function ResguardosEmpleadoXid($Enlace)
        {
            $conectar = parent::conexion("siai");
            parent::set_names();

            $sql = "SELECT 
                        id_equipo, 
                        imagen_equipo AS Imagen,
                        descripcion_tipoequipo AS Descripcion, 
                        nombre_marca AS Marca, 
                        Modelo, 
                        Serie, 
                        Inventario, 
                        Observacion, 
                        fecha_alta AS Alta, 
                        origen_nombre AS 'Origen_del_Equipo', 
                        id_resguardo 
                FROM cat_equipos_informaticos 
                INNER JOIN cat_tipo_equipos ON fk_tipo = id_tip_tipoequipo 
                INNER JOIN cat_marca_equipo ON  fk_marca = id_mar_marca 
                INNER JOIN pri_resguardo_equipo ON  fk_equipo = id_equipo 
                INNER JOIN cat_origen_equipo ON  id_origen_equipo = fk_origen_equipo 
                WHERE estado = 1 AND fk_empleado = ?   ORDER BY id_resguardo";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function ResguardosxEmpleadoPDF($Enlace)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT pdf_resguardo FROM cat_usuario 
                    WHERE enlace = ?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
   }
?>
