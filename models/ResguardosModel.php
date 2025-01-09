<?php
    class Resguardos extends Conectar
    {

    public function ResguardosEmpleadoXid($Enlace)
        {
            $conectar = parent::conexion("siai");
            parent::set_names();

            $sql = "SELECT 
                        id_equipo, 
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
   

        public function Historial($id_resguardo)
        {
            $conectar = parent::conexion("siai");
            parent::set_names();
        
            $sql = "SELECT  
                        id_resguardo, 
                        fk_empleado,
                        DATE_FORMAT(fecha_alta, '%d/%m/%Y') AS 'Alta', 
                        DATE_FORMAT(fecha_baja, '%d/%m/%Y') AS 'Baja', 
                        IF(estado = 1, 'Activo', 'Historial') AS Estado, 
                        observacion,
                        observacion_baja,
                        fk_ubicacion 
                    FROM pri_resguardo_equipo 
                    WHERE fk_equipo = ?
                    ORDER BY fecha_alta DESC";
        
        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $id_resguardo);
        $stmt->execute();
        $Resultado = $stmt->fetchAll();
        return $Resultado;
    }

    
    public function DetalleXid($Enlace)
    {
        $conectar = parent::conexion("siai");
        parent::set_names();
    
        $sql = "SELECT 
                         id_detalle_recepcion, 
                         folio_recepcion,
                     	 fecha_recepcion,
                     	 fk_resguardante,
                    	 observaciones
                     FROM pri_detalles_recepcion
                     INNER JOIN pri_recepcion_equipos ON fk_recepcion = id_recepcion
                     WHERE fk_equipo_recepcion =?";
    
    $stmt = $conectar->prepare($sql);
    $stmt->bindValue(1, $Enlace);
    $stmt->execute();
    $Resultado = $stmt->fetchAll();
    return $Resultado;
}


}
?>
