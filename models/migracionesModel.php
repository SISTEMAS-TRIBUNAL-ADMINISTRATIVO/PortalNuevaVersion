<?php
    class Migraciones extends Conectar
    {

        public function BuscarMigraciones()
        {
            $conectar= parent::conexion("portal_empleado");
            parent::set_names();

            $sql="SELECT * FROM cat_migraciones";

            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function GuardarMigraciones($NombreMigracion)
        {
            $conectar= parent::conexion("portal_empleado");
            parent::set_names();


            $sql="INSERT INTO cat_migraciones
                  SET
                    nombre_migracion=?";


            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $NombreMigracion);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function InsertMigraciones($sqlMigracion)
        {
            $conectar= parent::conexion("portal_empleado");
            parent::set_names();

            $sql=$conectar->prepare($sqlMigracion);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
    }
?>