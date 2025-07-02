<?php
    class Dashboard extends Conectar
    {
        public function Acceso_A_Sistemas($Enlace)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT 
                        id_sistema,
                        imagen_sistema,
                        sistema,
                        alias,
                        descripcion_sistema,
                        url_prueba,
                        url_produccion
                    FROM pri_usuario_rol_sistema 
                    INNER JOIN cat_sistema ON fk_sistema = id_sistema
                    WHERE Enlace_rol_sistema = ? AND id_sistema != 7";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
?>
