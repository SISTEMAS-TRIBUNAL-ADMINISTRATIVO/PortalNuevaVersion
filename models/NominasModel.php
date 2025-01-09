<?php
class Nominas extends Conectar
{
    public function obtenerNominas($enlace)
    {
        $conectar = parent::conexion("siga");
        parent::set_names();

        $sql = "SELECT 
            id_cfdi, emp_rfc AS RFC, 
            fk_empleado, CONVERT(CONCAT(emp_nombres, ' ', emp_paterno, ' ', emp_materno) USING utf8) AS Empleado,
            cfdi_fecha_timbrado, cfdi_mensaje, nom_concepto, cfdi_xml_cfdi, cfdi_pdf_timbrado 
            FROM pri_cfdi 
            INNER JOIN pri_nomina ON fk_nomina = id_nom_nomina 
            INNER JOIN pri_empleado ON fk_empleado = id_emp_empleado 
            WHERE cfdi_cancelado=0 AND fk_empleado=? AND cfdi_pdf_timbrado IS NOT NULL 
            ORDER BY id_nom_nomina DESC";

        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $enlace);
        $stmt->execute();
        $resultado = $stmt->fetchAll();
        return $resultado;
    }
}
?>
