<?php
    class Permisos_extras extends Conectar
    {
        public function Permisos_extras_Portal($Enlace)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT 
                        fk_permiso_extra,
                        permiso_extra
                    FROM pri_permisoextra_usuario_sistema
                    INNER JOIN cat_permiso_extra ON fk_permiso_extra = id_permiso_extra
                    WHERE fk_enlace_user =?
                    AND fk_sistema_permiso=7";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
?>