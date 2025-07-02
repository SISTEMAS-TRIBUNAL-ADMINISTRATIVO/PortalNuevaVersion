<?php
    class Catalogo extends Conectar
    {

        public function Cat_Ubicaciones()
         {
                $conectar = parent::conexion("siga");
                parent::set_names();

                $sql = "SELECT 
                        id_ads_adscripcion,
                        ads_descripcion
                    FROM pri_adscripcion";


                $stmt = $conectar->prepare($sql);
                $stmt->execute();
                $Resultado = $stmt->fetchAll();
                return $Resultado;
            }

        public function cat_Pisos()
        {
            $conectar = parent::conexion("siai");
            parent::set_names();

            $sql = "SELECT * FROM CAT_PISO";


            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function Cat_area_x_id($Enlace)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT 
                    id_ads_adscripcion,
                    ads_descripcion
                FROM pri_adscripcion
                WHERE id_ads_adscripcion =?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function cat_Tipo_de_aviso()
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT * FROM cat_tipo_notificacion";

            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
   
?>
