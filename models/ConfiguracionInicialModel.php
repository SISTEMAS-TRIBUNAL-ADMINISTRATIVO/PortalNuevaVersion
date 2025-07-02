<?php
    class PrimerInicio extends Conectar
    {

    public function GuardarConfiguracion($siglas, $area_pertenece, $password, $enlace, $Email, $piso)
    {
        
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "UPDATE cat_usuario SET 
                    fk_area_pertenece_siga=?,
                    siglas=?,
                    password=?,
                    primer_inicio=0,
                    fk_piso_ubicacion=?
                WHERE enlace=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $area_pertenece);
            $stmt->bindValue(2, $siglas);
            $stmt->bindValue(3, md5($Email) . hash('sha256', $password));
            $stmt->bindValue(4, $piso);
            $stmt->bindValue(5, $enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
   
?>
