<?php
    class Declaraciones extends Conectar
    {
        public function TodasLasDeclaracionesFirmadas()
        {
            $conectar = parent::conexion("declarachiapas");
            parent::set_names();

            $sql = "SELECT 
                        declaraciones.id,
                        personal.nombre,
                        personal.apellido1,
                        personal.apellido2,
                        c_tipo_declaracion.nombre AS TipoDeclaracion,
                        declaraciones.sendPDN,
                        declaraciones.errorPDN
                    FROM declaraciones
                    INNER JOIN c_tipo_declaracion ON c_tipo_declaracion.id = declaraciones.id_tipo_declaracion
                    INNER JOIN personal ON personal.id = declaraciones.id_persona
                    WHERE declaraciones.fecha_firma IS NOT NULL";

            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function DetallesXid($idDeclaracion)
        {
            $conectar = parent::conexion("declarachiapas");
            parent::set_names();

            $sql = "SELECT 
                            id,
                            id_persona,
                            id_persona_aux,
                            curp_aux,
                            id_declarachiapas,
                            id_tipo_declaracion,
                            id_c_declaracion,
                            dependencia,
                            fecha_inicio,
                            fecha_fin,
                            id_tipo_publicacion,
                            sec_01_01,
                            sec_01_01_p,
                            sec_01_02,
                            sec_01_02_p,  
                            sec_01_03,  
                            sec_01_03_p,  
                            sec_01_03_ninguno,
                            sec_01_04,  
                            sec_01_04_p,  
                            sec_01_05,  
                            sec_01_05_p,  
                            sec_01_05_ninguno,  
                            sec_01_06,  
                            sec_01_06_p,  
                            sec_01_06_ninguno,  
                            sec_01_07,  
                            sec_01_07_p,  
                            sec_01_07_ninguno,  
                            sec_01_08,  
                            sec_01_08_p,  
                            sec_01_09,  
                            sec_01_09_p,  
                            sec_01_10,  
                            sec_01_10_p,  
                            sec_01_10_ninguno,  
                            sec_01_11,  
                            sec_01_11_p,  
                            sec_01_11_ninguno  
                            sec_01_12,  
                            sec_01_12_p,  
                            sec_01_12_ninguno,  
                            sec_01_13,  
                            sec_01_13_p,  
                            sec_01_13_ninguno,  
                            sec_01_14,  
                            sec_01_14_p,  
                            sec_01_14_ninguno,  
                            sec_01_15,  
                            sec_01_15_p,  
                            sec_01_15_ninguno,  
                            sec_02_01,  
                            sec_02_01_p,  
                            sec_02_01_ninguno,  
                            sec_02_02,  
                            sec_02_02_p,  
                            sec_02_02_ninguno,  
                            sec_02_03,  
                            sec_02_03_p,  
                            sec_02_03_ninguno,  
                            sec_02_04,  
                            sec_02_04_p,  
                            sec_02_04_ninguno,  
                            sec_02_05,  
                            sec_02_05_p,  
                            sec_02_05_ninguno,  
                            sec_02_06,
                            sec_02_06_p,  
                            sec_02_06_ninguno,  
                            sec_02_07,  
                            sec_02_07_p,  
                            sec_02_07_ninguno,  
                            sec_03_01,  
                            sec_03_01_p,  
                            sec_03_01_ninguno,  
                            observaciones,  
                            es_extemporanea,
                            vobo,
                            serie_certificado,
                            secuencia_firma,  
                            fecha_firma,  
                            firma_electronica,  
                            cadena_original,
                            UUID,   
                            noOficio,  
                            fechaSellado,  
                            cadenaSello,  
                            xml,     
                            campo,   
                            sendPDN,
                            dateSendPDN,  
                            errorPDN,  
                            created_at,  
                            updated_at,  
                            deleted_at,  
                            anio_anual,  
                            complementaria,  
                            comodin 
                    FROM declaraciones";

            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function Tipo_Declaracion($IdTipo)
        {
            $conectar = parent::conexion("declarachiapas");
            parent::set_names();

            $sql = "SELECT 
                        id,
                        nombre
                    FROM c_tipo_declaracion
                    WHERE id=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $IdTipo);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado[0]['nombre'];
        }
    }
?>
