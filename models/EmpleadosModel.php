<?php
    
    class Empleados extends Conectar
    {

        public function EmpleadosActivos()
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT id_emp_empleado,
                                pla_numero AS Plaza, 
                                emp_enlace AS Enlace, 
                                CONVERT(CONCAT(pre_descripcion, ' ', emp_nombres, ' ', emp_paterno, ' ', emp_materno) USING utf8) AS Empleado, 
                                cat_nombre AS Categoria, 
                                ads_descripcion AS AREA 
                        FROM pri_empleado 
                        INNER JOIN pri_plantilla p ON p.fk_emp_empleado = id_emp_empleado 
                        INNER JOIN pri_plaza ON fk_pla_plaza = id_pla_plaza 
                        INNER JOIN pri_adscripcion ON fk_ads_adscripcion = id_ads_adscripcion 
                        INNER JOIN pri_categoria ON fk_cat_categoria = id_cat_categoria 
                        INNER JOIN cat_prefijo ON fk_pre_prefijo = id_pre_prefijo 
                        WHERE p.pla_estado = 1 ORDER BY Plaza";


            $stmt = $conectar->prepare($sql);   
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        
        public function EmpleadoXid($idEmpleado)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT id_emp_empleado, 
                                pla_numero AS Plaza, 
                                emp_enlace AS Enlace, 
                                CONVERT(CONCAT(pre_descripcion, ' ', emp_nombres, ' ', emp_paterno, ' ', emp_materno) USING utf8) AS Empleado, 
                                cat_nombre AS Categoria, 
                                ads_descripcion AS AREA 
                        FROM pri_empleado 
                        INNER JOIN pri_plantilla p ON p.fk_emp_empleado = id_emp_empleado 
                        INNER JOIN pri_plaza ON fk_pla_plaza = id_pla_plaza 
                        INNER JOIN pri_adscripcion ON fk_ads_adscripcion = id_ads_adscripcion 
                        INNER JOIN pri_categoria ON fk_cat_categoria = id_cat_categoria 
                        INNER JOIN cat_prefijo ON fk_pre_prefijo = id_pre_prefijo 
                        WHERE p.pla_estado = 1 and id_emp_empleado=? ORDER BY Plaza";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $idEmpleado);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

    }
?>
