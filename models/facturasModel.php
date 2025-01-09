<?php
    class Facturas extends Conectar
    {

        public function get_facturas()
        {
            $conectar = parent::conexion("siai");
            parent::set_names();

            $sql = "SELECT 
                        id_factura,
                        fecha_emision,
                        folio,
                        folio_fiscal,
                        nombre_proveedor,
                        uso_cfdi,
                        observaciones_factura 
                    FROM pri_facturas
                    INNER JOIN mobiliario.cat_proveedor ON fk_proveedor = id_proveedor
                    INNER JOIN cat_usocfdi ON fk_usocfdi = id_usocfdi";

            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function get_facturasXid($IdFactura)
        {
            $conectar = parent::conexion("siai");
            parent::set_names();

            $sql = "SELECT 
                    id_factura,
                    fecha_emision,
                    folio,
                    folio_fiscal,
                    nombre_proveedor,
                    uso_cfdi,
                    observaciones_factura 
                FROM pri_facturas
                INNER JOIN mobiliario.cat_proveedor ON fk_proveedor = id_proveedor
                INNER JOIN cat_usocfdi ON fk_usocfdi = id_usocfdi
                WHERE id_factura=?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1,$IdFactura);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
?>