<?php
    class sec_01_06 extends Conectar
    {

        public function DatosDeLaPareja($idDeclaracion)
        {
            $conectar = parent::conexion("declarachiapas");
            parent::set_names();

            $sql = " SELECT	
                        sec_01_06.nombre,
                        sec_01_06.apellido1,
                        sec_01_06.apellido2,
                        sec_01_06.fecha_nacimiento,
                        sec_01_06.rfc,
                        c_relacion_declarante.nombre AS relacionConDeclarante,
                        if(sec_01_06.id_nacionalidad <> 37, 'true', 'false') AS ciudadanoExtranjero,
                        sec_01_06.curp,
                        if(sec_01_06.dependiente_economico = "."b'1'"." , 'true', 'false') AS esDependienteEconomico,
                        if(sec_01_06.habita_con_declarante = "."b'1'"." , 'true', 'false') AS habitaDomicilioDeclarante,
                        c_pais.nombre AS lugarDondeReside,
                        c_ambito.clave AS Clave_ActividadLAboral,
                        c_ambito.nombre AS AmbitoLaboral,
                        IF(sec_01_06.es_proveedor_contratista = "."b'1'".", 'true', 'false') AS proveedorContratistaGobierno,
                        sec_01_06.observaciones
                    FROM sec_01_06
                    INNER JOIN c_relacion_declarante ON c_relacion_declarante.id = sec_01_06.id_relacion_declarante
                    INNER JOIN c_pais ON c_pais.id = sec_01_06.id_pais_residencia
                    INNER JOIN c_ambito ON c_ambito.id = sec_01_06.id_ambito
                    WHERE sec_01_06.id_declaracion = ?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $idDeclaracion);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }


        public function DomicilioExtranjero($idDeclaracion)
        {
            $conectar = parent::conexion("declarachiapas");
            parent::set_names();

            $sql = " SELECT 
                        domicilios.calle,
                        domicilios.num_exterior,
                        domicilios.num_interior,
                        domicilios.colonia,
                        c_municipio.clave AS Clave_municipio,
                        c_municipio.nombre AS Municipio,
                        c_estado.clave AS Clave_Estado,
                        c_estado.nombre AS Estado,
                        domicilios.codigo_postal,
                        c_pais.nombre AS Pais
                    FROM sec_01_06
                    INNER JOIN domicilios ON domicilios.id = sec_01_06.id_domicilio
                    INNER JOIN c_estado ON c_estado.id = domicilios.id_estado
                    INNER JOIN c_municipio ON c_municipio.id = domicilios.id_municipio
                    INNER JOIN c_pais ON c_pais.id = domicilios.id_pais
                    WHERE sec_01_06.id_declaracion=? AND domicilios.id_pais <> 37";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $idDeclaracion);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
?>
