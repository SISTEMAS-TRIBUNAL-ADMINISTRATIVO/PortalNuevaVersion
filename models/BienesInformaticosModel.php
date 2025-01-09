<?php
    
    class BienesInformaticos extends Conectar
    {

        public function VerBienesInformaticos()
        {
            $conectar = parent::conexion("siai");
            parent::set_names();

            $sql = " SELECT 
                                  id_equipo,
                                  descripcion_tipoequipo AS Descripcion,  
                                  nombre_marca AS Marca,  
                                  Modelo,  
                                  Serie,  
                                  Inventario, 
                                  origen_nombre AS 'Origen_del_Equipo',  
                                  Folio as Factura,  
                                  fecha_emision AS 'Fecha_Adsquisicion', 
                                  Costo_Original, 
                                  Estado_equipo AS 'Disponibilidad',
                                  equipo_ubicacion AS fk_ubicacion
                         FROM cat_equipos_informaticos 
                         INNER JOIN cat_tipo_equipos ON fk_tipo = id_tip_tipoequipo 
                         INNER JOIN cat_marca_equipo ON  fk_marca = id_mar_marca
                         INNER JOIN cat_origen_equipo ON  id_origen_equipo = fk_origen_equipo 
                         INNER JOIN cat_estado_equipos ON id_estadoequipo = fk_disponibilidad_equipo 
                         INNER JOIN pri_facturas on id_factura = fk_factura 
                         WHERE fk_disponibilidad_equipo<> 2 ORDER BY Inventario ASC ";


            $stmt = $conectar->prepare($sql);   
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }


        public function DetallesBienInfXid($id_equipo)
        {
            $conectar = parent::conexion("siai");
            parent::set_names();

            $sql = " SELECT 
                        id_equipo, 
                        id_licencia_antivirus,
                        id_licencia_office,
                        descripcion_tipoequipo AS Descripcion,  
                        nombre_marca AS Marca,
                        Modelo, 
                        Serie, 
                        Inventario, 
                        origen_nombre AS 'Origen_del_Equipo',  
                        fk_factura,                                                              
                        Folio AS Factura, 
                        folio_fiscal AS 'Folio_Fiscal',
                        fecha_emision AS 'Fecha_Adsquisicion',
                        uso_cfdi, 
                        observaciones_factura AS 'Observaciones_Factura',
                        Estado_equipo AS 'Disponibilidad', 
                        equipo_observaciones, 
                        costo_original, 
                        costo_actual, 
                        Caracteristicas,
                        licencia_privada_office,
                        fecha_caducidad_office,
                        licencia_publica,
                        licencia_privada,
                        fecha_registro,
                        fecha_caducidad,
                        MAC, 
                        Nombre_proveedor, 
                        siglas_proveedor, 
                        fk_resguardante,
                        fk_marca,
                        tiene_garantia, 
                        fecha_inicial_garantia, 
                        fecha_final_garantia,
                        tiene_cuenta_contable,
                        cuenta,
                        subcuenta,
                        sub_subcuenta,
                        comentarios_cuenta_contable,
                        imagen_equipo,
                        equipo_ubicacion,
                        pdf_anexo,
                        imagen_anexo
                        FROM cat_equipos_informaticos
                        INNER JOIN cat_tipo_equipos ON fk_tipo = id_tip_tipoequipo
                        INNER JOIN cat_marca_equipo ON  fk_marca = id_mar_marca
                        INNER JOIN cat_origen_equipo ON  id_origen_equipo = fk_origen_equipo
                        INNER JOIN cat_estado_equipos ON id_estadoequipo = fk_disponibilidad_equipo
                        INNER JOIN pri_facturas F ON id_factura = fk_factura
                        INNER JOIN mobiliario.cat_proveedor ON id_proveedor = F.fk_proveedor
                        INNER JOIN cat_licencia_antivirus ON fk_antivirus = id_licencia_antivirus
                        INNER JOIN cat_licencia_office ON fk_office = id_licencia_office
                        INNER JOIN cat_usocfdi ON id_usocfdi = fk_usocfdi
                        WHERE id_equipo = ?";

            $stmt = $conectar->prepare($sql); 
            $stmt->bindValue(1, $id_equipo); 
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

    }
        
    ?>
    