<?php
    require_once("../../models/sec_01_05_Model.php");

    
    function ExperianciaLaboral($IdDeclaracion)
    {
        $sec_01_05 = new sec_01_05();
        $sec_01_05_ExperianciaLaboral = $sec_01_05->ExperianciaLaboral($IdDeclaracion);

        $resultado = [];
        $Observaciones = "";


        if (is_array($sec_01_05_ExperianciaLaboral) && count($sec_01_05_ExperianciaLaboral) > 0) 
        {
            foreach ($sec_01_05_ExperianciaLaboral as $item) 
            {
                $resultado[] = 
                [
                    "Clave_ambito" => $item["Clave_ambito"],
                    "Ambito" => $item["Ambito"],
                    "nivelOrdenGobierno" => $item["nivelOrdenGobierno"],
                    "ambitoPublico" => $item["ambitoPublico"],
                    "nombreEntePublico" => $item["nombreEntePublico"],
                    "area_adscripcion" => $item["area_adscripcion"],
                    "cargo_puesto" => $item["cargo_puesto"],
                    "fecha_ingreso" => $item["fecha_ingreso"],
                    "fecha_salida" => $item["fecha_salida"],
                    "Clave_pais" => $item["Clave_pais"]
                ];

                $Observaciones .= $item["observaciones"] . ", ";
            }

            return 
            [
                "ninguno" => false,
                "laboral" => $resultado,
                "Observaciones" => $Observaciones
            ];
        }
        else
        {
            return
            [
                "ninguno" => true,
                "laboral" => [],
                "Observaciones" => $Observaciones
            ];
        }
}
?>
