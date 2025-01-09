<?php
    class Catalogo extends Conectar
    {

    public function Cat_Ubicaciones($id)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT 
                    id_ads_adscripcion,
                    ads_descripcion
                FROM pri_adscripcion
                WHERE id_ads_adscripcion=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $id);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
   
?>
