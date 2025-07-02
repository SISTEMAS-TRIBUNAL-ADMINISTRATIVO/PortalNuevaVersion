<?php
    class Permisos extends Conectar
    {
        public function get_permisosPadre($Enlace)
        {
            $conectar= parent::conexion("portal_empleado");
            parent::set_names();


            $sql="SELECT
                        id_permiso,
                        permiso,
                        url_permiso,
                        icon
                    FROM cat_permiso
                    INNER JOIN pri_sistema_rol_permiso ON(pri_sistema_rol_permiso.fk_permiso = cat_permiso.id_permiso)
                    INNER JOIN pri_usuario_rol_sistema ON(pri_usuario_rol_sistema.fk_rol = pri_sistema_rol_permiso.fk_rol)
                    WHERE pri_usuario_rol_sistema.fk_usuario = '$Enlace'
                    AND pri_usuario_rol_sistema.fk_sistema = 2
                    AND pri_usuario_rol_sistema.activo = 1
                    AND cat_permiso.permiso_padre=0
                    ORDER BY id_permiso";


            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function get_permisosHijos($IdPadre, $Enlace)
        {
            $conectar= parent::conexion("portal_empleado");
            parent::set_names();


            $sql="SELECT
                        id_permiso,
                        permiso,
                        url_permiso,
                        icon
                    FROM cat_permiso
                    INNER JOIN pri_sistema_rol_permiso ON(pri_sistema_rol_permiso.fk_permiso = cat_permiso.id_permiso)
                    INNER JOIN pri_usuario_rol_sistema ON(pri_usuario_rol_sistema.fk_rol = pri_sistema_rol_permiso.fk_rol)
                    WHERE pri_usuario_rol_sistema.fk_usuario = ?
                    AND  pri_usuario_rol_sistema.fk_sistema = 2
                    AND pri_usuario_rol_sistema.activo = 1
                    AND cat_permiso.permiso_padre =?
                    ORDER BY id_permiso";


            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $Enlace);
            $sql->bindValue(2, $IdPadre);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

    }
?>