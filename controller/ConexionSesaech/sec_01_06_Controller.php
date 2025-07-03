<?php
    require_once("../../models/sec_01_06_Model.php");

    
    function DatosDeLaPareja($IdDeclaracion)
    {
        $sec_01_06 = new sec_01_06();
        $sec_01_02_DatosDeLaPareja = $sec_01_06->DatosDeLaPareja($IdDeclaracion);
        $_DatosDeLaPareja = [];
        $_Domicilio_Mexico = [];
        $_Domicilio_Extranjero = [];


        $_DatosDeLaPareja[] = 
         [
            "nombre" => $sec_01_02_DatosDeLaPareja["nombre"],
            "apellido1" => $sec_01_02_DatosDeLaPareja["apellido1"],
            "apellido2" => $sec_01_02_DatosDeLaPareja["apellido2"],
            "fecha_nacimiento" => $sec_01_02_DatosDeLaPareja["fecha_nacimiento"],
            "rfc" => $sec_01_02_DatosDeLaPareja["rfc"],
            "curp" => $sec_01_02_DatosDeLaPareja["curp"],
            "relacionConDeclarante" => $sec_01_02_DatosDeLaPareja["relacionConDeclarante"],
            "ciudadanoExtranjero" => $sec_01_02_DatosDeLaPareja["ciudadanoExtranjero"],
            "esDependienteEconomico" => $sec_01_02_DatosDeLaPareja["esDependienteEconomico"],
            "habitaDomicilioDeclarante" => $sec_01_02_DatosDeLaPareja["habitaDomicilioDeclarante"],
            "apelllugarDondeResideido1" => $sec_01_02_DatosDeLaPareja["lugarDondeReside"],
            "Clave_ActividadLAboral" => $sec_01_02_DatosDeLaPareja["Clave_ActividadLAboral"],
            "AmbitoLaboral" => $sec_01_02_DatosDeLaPareja["AmbitoLaboral"],
            "proveedorContratistaGobierno" => $sec_01_02_DatosDeLaPareja["proveedorContratistaGobierno"],
            "observaciones" => $sec_01_02_DatosDeLaPareja["observaciones"],
            "apellido1" => $sec_01_02_DatosDeLaPareja["apellido1"]
        ];








/*

        $_DatosDelCargo = [];



        //Datos generales del cargo
        $_DatosDelCargo [] = 
         [
            "id_padron" => $sec_01_02_DatosDelCargo["id_padron"],
            "nivelOrdenGobierno" => $sec_01_02_DatosDelCargo["calnivelOrdenGobiernole"],
            "ambitoPublico" => $sec_01_02_DatosDelCargo["ambitoPublico"],
            "nombreEntePublico" => $sec_01_02_DatosDelCargo["nombreEntePublico"],
            "areaAdscripcion" => $sec_01_02_DatosDelCargo["areaAdscripcion"],
            "empleoCargoComision" => $sec_01_02_DatosDelCargo["empleoCargoComision"],
            "contratadoPorHonorarios" => $sec_01_02_DatosDelCargo["contratadoPorHonorarios"],
            "nivelEmpleoCargoComision" => $sec_01_02_DatosDelCargo["nivelEmpleoCargoComision"],
            "fechaTomaPosesion" => $sec_01_02_DatosDelCargo["fechaTomaPosesion"],
            "observaciones" => $sec_01_02_DatosDelCargo["observaciones"],
            "funciones_principales" => $sec_01_02_DatosDelCargo["funciones_principales"]
         ];


        //Si es Mexicano
        if($sec_01_02_DatosDelCargo["IdPais"] == 37)
        {
            $_Domicilio_Mexico[] = 
            [
                //Domicilio México Con datos
                "calle_Mexico" => $sec_01_02_DatosDelCargo["calle"],
                "num_exterior_Mexico" => $sec_01_02_DatosDelCargo["num_exterior"],
                "num_interior_Mexico" => $sec_01_02_DatosDelCargo["num_interior"],
                "colonia_Mexico" => $sec_01_02_DatosDelCargo["colonia"],
                "Clave_municipio_Mexico" => $sec_01_02_DatosDelCargo["Clave_municipio"],
                "Municipio_Mexico" => $sec_01_02_DatosDelCargo["Municipio"],
                "Clave_Estado_Mexico" => $sec_01_02_DatosDelCargo["Clave_Estado"],
                "Estado_Mexico" => $sec_01_02_DatosDelCargo["Estado"],
                "codigo_postal_Mexico" => $sec_01_02_DatosDelCargo["codigo_postal"],
                "pais_Mexico" => $sec_01_02_DatosDelCargo["pais"],

            ];

            $_Domicilio_Extranjero[] = 
            [
                //Domicilio Extranjero vacío 
                "calle_Extranjero" => "",
                "num_exterior_Extranjero" => "",
                "num_interior_Extranjero" => "",
                "colonia_Extranjero" => "",
                "Clave_municipio_Extranjero" => "",
                "Municipio_Extranjero" => "",
                "Clave_Estado_Extranjero" => "",
                "Estado_Extranjero" => "",
                "codigo_postal_Extranjero" => "",
                "Clave_pais_Extranjero" => "",

            ];

        }   

        //Si es Extranjero
        else
        {
            $_Domicilio_Mexico[] = 
            [
                 //Domicilio México vacío 
                "calle_Mexico" => "",
                "num_exterior_Mexico" =>"",
                "num_interior_Mexico" => "",
                "colonia_Mexico" => "",
                "Clave_municipio_Mexico" => "",
                "Municipio_Mexico" => "",
                "Clave_Estado_Mexico" => "",
                "Estado_Mexico" =>"",
                "codigo_postal_Mexico" => "",
                "pais_Mexico" => "",
            ];

            $_Domicilio_Extranjero[] = 
            [
                //Domicilio declarante Extranjero Con datos
                "calle_Extranjero" => $sec_01_02_DatosDelCargo["calle"],
                "num_exterior_Extranjero" => $sec_01_02_DatosDelCargo["num_exterior"],
                "num_interior_Extranjero" => $sec_01_02_DatosDelCargo["num_interior"],
                "colonia_Extranjero" => $sec_01_02_DatosDelCargo["colonia"],
                "Clave_municipio_Extranjero" => $sec_01_02_DatosDelCargo["Clave_municipio"],
                "Municipio_Extranjero" => $sec_01_02_DatosDelCargo["Municipio"],
                "Clave_Estado_Extranjero" => $sec_01_02_DatosDelCargo["Clave_Estado"],
                "Estado_Extranjero" => $sec_01_02_DatosDelCargo["Estado"],
                "codigo_postal_Extranjero" => $sec_01_02_DatosDelCargo["codigo_postal"],
                "pais_Extranjero" => $sec_01_02_DatosDelCargo["pais"],

            ];
        }

        
        return
        [
            "_DatosDelCargo" => $_DatosDelCargo,
            "_Domicilio_Mexico" => $_Domicilio_Mexico,
            "_Domicilio_Extranjero" => $_Domicilio_Extranjero
        ];
*/
    }

?>




