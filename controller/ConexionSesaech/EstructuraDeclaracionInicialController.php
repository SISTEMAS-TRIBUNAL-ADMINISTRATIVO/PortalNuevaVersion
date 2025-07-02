<?php
//LSC. JOSE FERNANDO VALDES NANDUCA 
//30/06/2025
session_start();
require_once("../config/conexion.php");
require_once("../models/ConexionSesaech/DeclaracionesModel.php");
require_once("../models/ConexionSesaech/sec_01_01.php");
require_once("../models/ConexionSesaech/sec_01_02.php");
require_once("../models/ConexionSesaech/sec_01_03.php");
require_once("../models/ConexionSesaech/sec_01_04.php");
require_once("../models/ConexionSesaech/sec_01_05.php");
require_once("../models/ConexionSesaech/sec_01_06.php");
require_once("../models/ConexionSesaech/sec_01_07.php");
require_once("../models/ConexionSesaech/sec_01_08.php");
require_once("../models/ConexionSesaech/sec_01_09.php");
require_once("../models/ConexionSesaech/sec_01_10.php");
require_once("../models/ConexionSesaech/sec_01_11.php");
require_once("../models/ConexionSesaech/sec_01_12.php");
require_once("../models/ConexionSesaech/sec_01_13.php");
require_once("../models/ConexionSesaech/sec_01_14.php");
require_once("../models/ConexionSesaech/sec_01_15.php");



$Declaraciones = new Declaraciones();
$sec_01_01 = new sec_01_01();
$sec_01_02 = new sec_01_02();
$sec_01_03 = new sec_01_03();
$sec_01_04 = new sec_01_04();
$sec_01_04_otros_empleos = new sec_01_04_otros_empleos();
$sec_01_05 = new sec_01_05();
$sec_01_06 = new sec_01_06();
$sec_01_07 = new sec_01_07();
$sec_01_08 = new sec_01_08();
$sec_01_09 = new sec_01_09();
$sec_01_10 = new sec_01_10();
$sec_01_11 = new sec_01_11();
$sec_01_12 = new sec_01_12();
$sec_01_13 = new sec_01_13();
$sec_01_14 = new sec_01_14();
$sec_01_15 = new sec_01_15();

$sec_02_01 = new sec_02_01();

$JsonReturn = '';



switch ($_GET["opcion"]) 
{
    case "Inicial":

        //SECCIÓN METADATA
        $DatosDeclaracion = $Declaraciones->DetallesXid($_POST['Id']);
        $JsonReturn .= '{
                            "metadata": {
                                "id_organismo": 74,
                                "organismo": "TRIBUNAL DE JUSTICIA ADMINISTRATIVA DEL ESTADO DE CHIAPAS",
                                "formato": "COMPLETA",
                                "tipo": "' .mb_strtoupper($Declaraciones->Tipo_Declaracion($DatosDeclaracion[0]['id_tipo_declaracion']), 'UTF-8').'",
                                "fechaPresentacion": "'.$DatosDeclaracion[0]['fecha_fin'].'",
                                "anio": '.$DatosDeclaracion[0]['anio_anual'].',
                                "actualizacionConflictoInteres": false 
                            },';


        //SECCIÓN 01_01 DATOS GENERALES
        $sec_01_01 = $sec_01_01->DatosGenerales($DatosDeclaracion[0]['id']);
        $JsonReturn .='"declaracion": {
                            "situacionPatrimonial": {
                                "datosGenerales": {
                                    "nombre": "'.$sec_01_01[0]['nombre'].'",
                                    "primerApellido": "'.$sec_01_01[0]['apellido1'].'",
                                    "segundoApellido": "'.$sec_01_01[0]['apellido2'].'",
                                    "curp": "'.$sec_01_01[0]['curp'].'",
                                    "rfc": {
                                        "rfc": "'.$sec_01_01[0]['rfc'].'",
                                        "homoClave": "'.$sec_01_01[0]['homoclave'].'"
                                    },
                                    "correoElectronico": {
                                        "institucional": "'.$sec_01_01[0]['correo_institucional'].'",
                                        "personal": "'.$sec_01_01[0]['correo_personal'].'"
                                    },
                                    "telefono": {
                                        "casa": "",
                                        "celularPersonal": "'.$sec_01_01[0]['telefono_celular'].'"
                                    },
                                    "situacionPersonalEstadoCivil": {
                                        "clave": "'.$sec_01_01[0]['Estado_civil_clave'].'",
                                        "valor": "'.$sec_01_01[0]['Estado_civil'].'"
                                    },
                                    "regimenMatrimonial": {
                                        "clave": "'.$sec_01_01[0]['Regimen_matrimonial_clave'].'",
                                        "valor": "'.$sec_01_01[0]['RegimenMatrominial'].'"
                                    },
                                    "paisNacimiento": "'.$sec_01_01[0]['Pais_Nacimiento'].'",
                                    "nacionalidad": "'.$sec_01_01[0]['Pais_Nacionalidad'].'",
                                    "aclaracionesObservaciones": "'.$sec_01_01[0]['observaciones'].'"
                                },';


        //SECCIÓN 01_02 DOMICILIO DEL DECLARANTE
        $sec_01_02 = $sec_01_02->DatosDelDomicilionDeclarante($DatosDeclaracion[0]['id']);
        $JsonReturn .= '"domicilioDeclarante": {
                            "domicilioMexico": {
                                "calle": "'.$sec_01_02[0]['calle'].'",
                                "numeroExterior": "'.$sec_01_02[0]['num_exterior'].'",
                                "numeroInterior": "'.$sec_01_02[0]['num_interior'].'",
                                "coloniaLocalidad": "'.$sec_01_02[0]['colonia'].'",
                                "municipioAlcaldia": {
                                    "clave": "'.$sec_01_02[0]['Clave_municipio'].'",
                                    "valor": "'.$sec_01_02[0]['Municipio'].'"
                                },
                                "entidadFederativa": {
                                    "clave": "'.$sec_01_02[0]['Clave_Estado'].'",
                                    "valor": "'.$sec_01_02[0]['Estado'].'"
                                },
                                "codigoPostal": "'.$sec_01_02[0]['codigo_postal'].'"
                            },
                            "domicilioExtranjero": {
                                "calle": "",
                                "numeroExterior": "",
                                "numeroInterior": "",
                                "ciudadLocalidad": "",
                                "estadoProvincia": "",
                                "pais": "MX",
                                "codigoPostal": ""
                            },
                            "aclaracionesObservaciones": "'.$sec_01_02[0]['observaciones'].'",
                            "domicilio": "'.$sec_01_02[0]['Clave_pais'].'"
                        },';


        //SECCIÓN 01_03 DATOS CURRICULAR
        $sec_01_03 = $sec_01_03->datosCurriculares($DatosDeclaracion[0]['id']);
        $JsonReturn .= '"datosCurricularesDeclarante": {
                            "ninguno": '.$sec_01_03->sec_01_03_ninguno($DatosDeclaracion[0]['id']).',
                            "escolaridad": [';

                            foreach($sec_01_03 as $sec_01_03_res)
                            {
                                $JsonReturn .= '
                                            {
                                                "tipoOperacion": "AGREGAR",
                                                "nivel": {
                                                    "clave": "'.$sec_01_03_res['Clave_Grado'].'",
                                                    "valor": "'.$sec_01_03_res['Grado_academico'].'"
                                                },
                                                "institucionEducativa": {
                                                    "nombre": "'.$sec_01_03_res['institucion_educativa'].'",
                                                    "ubicacion": "'.$sec_01_03_res['Clave_pais'].'"
                                                },
                                                "carreraAreaConocimiento": "'.$sec_01_03_res['carrera'].'",
                                                "estatus": "'.$sec_01_03_res['Estatus_academico'].'",
                                                "documentoObtenido": "'.$sec_01_03_res['Documento_obtenido'].'",
                                                "fechaObtencion": "'.$sec_01_03_res['fecha_obtencion_documento'].'"
                                            }';
                            }
                            $JsonReturn.= '],
                            "aclaracionesObservaciones": "'.$sec_01_03[0]['observaciones'].'"
                        },';


        //SECCIÓN 01_04 DATOS DEL CARGO O COMISIÓN PREGUNTAR POR LOS OTROS TRABAJOS
        $sec_01_04 = $sec_01_04->DatosDelCargo($DatosDeclaracion[0]['id']);
        $JsonReturn .= '"datosEmpleoCargoComision": {
                            "tipoOperacion": "AGREGAR",
                            "nivelOrdenGobierno": "'.$sec_01_04[0]['nivelOrdenGobierno'].'",
                            "ambitoPublico": "'.$sec_01_04[0]['ambitoPublico'].'",
                            "nombreEntePublico": "'.$sec_01_04[0]['nombreEntePublico'].'",
                            "areaAdscripcion": "'.$sec_01_04[0]['areaAdscripcion'].'",
                            "empleoCargoComision": "'.$sec_01_04[0]['empleoCargoComision'].'",
                            "contratadoPorHonorarios": '.$sec_01_04[0]['contratadoPorHonorarios'].',
                            "nivelEmpleoCargoComision": "'.$sec_01_04[0]['nivelEmpleoCargoComision'].'",
                            "funcionPrincipal": "'.$sec_01_04->FuncionesPrincipales($sec_01_04[0]['id_padron']).'",
                            "fechaTomaPosesion": "'.$sec_01_04[0]['fechaTomaPosesion'].'",
                            "telefonoOficina": {
                                "telefono": "",
                                "extension": ""
                            },
                            "domicilioMexico": {
                                "calle": "'.$sec_01_04[0]['calle'].'",
                                "numeroExterior": "'.$sec_01_04[0]['num_exterior'].'",
                                "numeroInterior": "'.$sec_01_04[0]['num_interior'].'",
                                "coloniaLocalidad": "'.$sec_01_04[0]['colonia'].'",
                                "municipioAlcaldia": {
                                    "clave": "'.$sec_01_04[0]['Clave_Municipio'].'",
                                    "valor": "'.$sec_01_04[0]['Municipio'].'"
                                },
                                "entidadFederativa": {
                                    "clave": "'.$sec_01_04[0]['Clave_Estado'].'",
                                    "valor": "'.$sec_01_04[0]['Estado'].'"
                                },
                                "codigoPostal": "'.$sec_01_04[0]['codigo_postal'].'"
                            },
                            "domicilioExtranjero": {
                                "calle": "",
                                "numeroExterior": "",
                                "numeroInterior": "",
                                "ciudadLocalidad": "",
                                "estadoProvincia": "",
                                "pais": "MX",
                                "codigoPostal": ""
                            },
                            "aclaracionesObservaciones": "'.$sec_01_04[0]['observaciones'].'",
                            "domicilio": "'.$sec_01_04[0]['pais'].'"
                        },';


        //SECCIÓN SEC_01_05 EXPERIENCIA LABORAL
        $sec_01_05 = $sec_01_05->ExperianciaLaboral($DatosDeclaracion[0]['id']);
        $JsonReturn .= '"experienciaLaboral": {
                            "ninguno": '.$sec_01_05->sec_01_05_ninguno($DatosDeclaracion[0]['id']).',
                            "experiencia": [';
                            
                            foreach($sec_01_05 as $sec_01_05_res)
                            {
                                $JsonReturn .='
                                            {
                                                "tipoOperacion": "AGREGAR",
                                                                "ambitoSector": {
                                                                    "clave": "'.$sec_01_05_res['Clave_ambito'].'",
                                                                    "valor": "'.$sec_01_05_res['Ambito'].'"
                                                                },
                                                                "nivelOrdenGobierno": "'.$sec_01_05_res['nivelOrdenGobierno'].'",
                                                                "ambitoPublico": "'.$sec_01_05_res['ambitoPublico'].'",
                                                                "nombreEntePublico": "'.$sec_01_05_res['nombreEntePublico'].'",
                                                                "areaAdscripcion": "'.$sec_01_05_res['area_adscripcion'].'",
                                                                "empleoCargoComision": "'.$sec_01_05_res['cargo_puesto'].'",
                                                                "funcionPrincipal": "'.$sec_01_05->FuncionesPrincipales($sec_01_05_res['id']).'", 
                                                                "fechaIngreso": "'.$sec_01_05_res['fecha_ingreso'].'",
                                                                "fechaEgreso": "'.$sec_01_05_res['fecha_salida'].'",
                                                                "ubicacion": "'.$sec_01_05_res['Clave_pais'].'"
                                            }';
                            }
                            $JsonReturn .='],
                            "aclaracionesObservaciones": "'.$sec_01_05_res['observaciones'].'"
                        },';


        //SECCIÓN  SEC_01_06 DATOS DE LA PAREJA
        $sec_01_06 = $sec_01_06->DatosDeLaPareja($DatosDeclaracion[0]['id']);
        $JsonReturn .= '"datosPareja": {
                            "ninguno": '.$sec_01_06->sec_01_06_ninguno($DatosDeclaracion[0]['id']).',
                            "tipoOperacion": "AGREGAR",
                            "nombre": "'.$sec_01_06[0]['nombre'].'",
                            "primerApellido": "'.$sec_01_06[0]['apellido1'].'",
                            "segundoApellido": "'.$sec_01_06[0]['apellido2'].'",
                            "fechaNacimiento": "'.$sec_01_06[0]['fecha_nacimiento'].'",
                            "rfc": "'.$sec_01_06[0]['rfc'].'",
                            "relacionConDeclarante": "'.$sec_01_06[0]['relacionConDeclarante'].'",
                            "ciudadanoExtranjero": '.$sec_01_06[0]['ciudadanoExtranjero'].',
                            "curp": "'.$sec_01_06[0]['curp'].'",
                            "esDependienteEconomico": '.$sec_01_06[0]['esDependienteEconomico'].',
                            "habitaDomicilioDeclarante": '.$sec_01_06[0]['habitaDomicilioDeclarante'].',
                            "lugarDondeReside": "'.$sec_01_06[0]['lugarDondeReside'].'",
                            "domicilioMexico": {
                                "calle": "",
                                "numeroExterior": "",
                                "numeroInterior": "",
                                "coloniaLocalidad": "",
                                "municipioAlcaldia": {
                                    "clave": "101",
                                    "valor": "Tuxtla Gutiérrez"
                                },
                                "entidadFederativa": {
                                    "clave": "07",
                                    "valor": "Chiapas"
                                },
                                "codigoPostal": "XXXXX"
                            },
                            "domicilioExtranjero": {
                                "calle": "",
                                "numeroExterior": "",
                                "numeroInterior": "",
                                "ciudadLocalidad": "",
                                "estadoProvincia": "",
                                "pais": "MX",
                                "codigoPostal": ""
                            },
                            "actividadLaboral": {
                                "clave": "'.$sec_01_06[0]['Clave_ActividadLAboral'].'",
                                "valor": "'.$sec_01_06[0]['AmbitoLaboral'].'"
                            },
                            "actividadLaboralSectorPublico": {
                                "nivelOrdenGobierno": "",
                                "ambitoPublico": "",
                                "nombreEntePublico": "",
                                "areaAdscripcion": "",
                                "empleoCargoComision": "",
                                "funcionPrincipal": "",
                                "salarioMensualNeto": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "fechaIngreso": "YYYY-MM-DD"
                            },
                            "actividadLaboralSectorPrivadoOtro": {
                                "nombreEmpresaSociedadAsociacion": "",
                                "empleoCargoComision": "",
                                "rfc": "",
                                "fechaIngreso": "YYYY-MM-DD",
                                "sector": {
                                    "clave": "AGRI",
                                    "valor": "AGRICULTURA"
                                },
                                "salarioMensualNeto": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "proveedorContratistaGobierno": '.$sec_01_06[0]['proveedorContratistaGobierno'].'
                            },
                            "aclaracionesObservaciones": "'.$sec_01_06[0]['observaciones'].'"
                        },';


        //SECCIÓN DEPENDIENTE ECONOMICO
        $JsonReturn .= '"datosDependienteEconomico": {
                            "ninguno": false,
                            "dependienteEconomico": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "nombre": "",
                                    "primerApellido": "",
                                    "segundoApellido": "",
                                    "fechaNacimiento": "YYYY-MM-DD",
                                    "rfc": "",
                                    "parentescoRelacion": {
                                        "clave": "MAD",
                                        "valor": "MADRE"
                                    },
                                    "extranjero": false,
                                    "curp": "",
                                    "habitaDomicilioDeclarante": true,
                                    "lugarDondeReside": "MÉXICO",
                                    "domicilioMexico": {
                                        "calle": "",
                                        "numeroExterior": "",
                                        "numeroInterior": "",
                                        "coloniaLocalidad": "",
                                        "municipioAlcaldia": {
                                            "clave": "",
                                            "valor": ""
                                        },
                                        "entidadFederativa": {
                                            "clave": "07",
                                            "valor": "CHIAPAS"
                                        },
                                        "codigoPostal": "00000"
                                    },
                                    "domicilioExtranjero": {
                                        "calle": "",
                                        "numeroExterior": "",
                                        "numeroInterior": "",
                                        "ciudadLocalidad": "",
                                        "estadoProvincia": "",
                                        "pais": "AF",
                                        "codigoPostal": ""
                                    },
                                    "actividadLaboral": {
                                        "clave": "PRI",
                                        "valor": "PRIVADO"
                                    },
                                    "actividadLaboralSectorPublico": {
                                        "nivelOrdenGobierno": "FEDERAL",
                                        "ambitoPublico": "EJECUTIVO",
                                        "nombreEntePublico": "",
                                        "areaAdscripcion": "",
                                        "empleoCargoComision": "",
                                        "funcionPrincipal": "",
                                        "salarioMensualNeto": {
                                            "valor": "",
                                            "moneda": "MXN"
                                        },
                                        "fechaIngreso": "YYYY-MM-DD"
                                    },
                                    "actividadLaboralSectorPrivadoOtro": {
                                        "nombreEmpresaSociedadAsociacion": "",
                                        "rfc": "",
                                        "empleoCargo": "",
                                        "fechaIngreso": "YYYY-MM-DD",
                                        "salarioMensualNeto": {
                                            "valor": "0",
                                            "moneda": "MXN"
                                        }
                                    },
                                    "proveedorContratistaGobierno": false,
                                    "sector": {
                                        "clave": "AGRI",
                                        "valor": "AGRICULTURA"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN INGRESOS 
        $JsonReturn .= '"ingresos": {
                            "remuneracionMensualCargoPublico": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "otrosIngresosMensualesTotal": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "actividadIndustrialComercialEmpresarial": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "actividades": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "nombreRazonSocial": "",
                                        "tipoNegocio": ""
                                    }
                                ]
                            },
                            "actividadFinanciera": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "actividades": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "tipoInstrumento": {
                                            "clave": "CAP",
                                            "valor": "CAPITAL"
                                        }
                                    }
                                ]
                            },
                            "serviciosProfesionales": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "servicios": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "tipoServicio": ""
                                    }
                                ]
                            },
                            "otrosIngresos": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "ingresos": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "tipoIngreso": ""
                                    }
                                ]
                            },
                            "ingresoMensualNetoDeclarante": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "ingresoMensualNetoParejaDependiente": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "totalIngresosMensualesNetos": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "aclaracionesObservaciones": ""
                        },
                        "actividadAnualAnterior": {
                            "servidorPublicoAnioAnterior": false,
                            "fechaIngreso": "YYYY-MM-DD",
                            "fechaConclusion": "YYYY-MM-DD",
                            "remuneracionNetaCargoPublico": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "otrosIngresosTotal": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "actividadIndustrialComercialEmpresarial": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "actividades": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "nombreRazonSocial": "",
                                        "tipoNegocio": ""
                                    }
                                ]
                            },
                            "actividadFinanciera": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "actividades": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "tipoInstrumento": {
                                            "clave": "VBU",
                                            "valor": "VALORES BURSÁTILES"
                                        }
                                    }
                                ]
                            },
                            "serviciosProfesionales": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "servicios": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "tipoServicio": ""
                                    }
                                ]
                            },
                            "enajenacionBienes": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "bienes": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "tipoBienEnajenado": ""
                                    }
                                ]
                            },
                            "otrosIngresos": {
                                "remuneracionTotal": {
                                    "valor": 0,
                                    "moneda": "MXN"
                                },
                                "ingresos": [
                                    {
                                        "remuneracion": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "tipoIngreso": ""
                                    }
                                ]
                            },
                            "ingresoNetoAnualDeclarante": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "ingresoNetoAnualParejaDependiente": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "totalIngresosNetosAnuales": {
                                "valor": 0,
                                "moneda": "MXN"
                            },
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN BIENES INMUEBLES
        $JsonReturn .= '"bienesInmuebles": {
                            "ninguno": false,
                            "bienInmueble": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "tipoInmueble": {
                                        "clave": "CASA",
                                        "valor": "CASA"
                                    },
                                    "titular": [
                                        {
                                            "clave": "DEC",
                                            "valor": "DECLARANTE"
                                        },
                                        {
                                            "clave": "CYG",
                                            "valor": "CÓNYUGE"
                                        }
                                    ],
                                    "porcentajePropiedad": "0",
                                    "superficieTerreno": {
                                        "valor": "0",
                                        "unidad": "m2"
                                    },
                                    "superficieConstruccion": {
                                        "valor": "0",
                                        "unidad": "m2"
                                    },
                                    "tercero": [
                                        {
                                            "tipoPersona": "FISICA",
                                            "nombreRazonSocial": "",
                                            "rfc": ""
                                        }
                                    ],
                                    "transmisor": [
                                        {
                                            "tipoPersona": "FISICA",
                                            "nombreRazonSocial": "",
                                            "rfc": "",
                                            "relacion": {
                                                "clave": "MAD",
                                                "valor": "MADRE"
                                            }
                                        }
                                    ],
                                    "formaAdquisicion": {
                                        "clave": "CPV",
                                        "valor": "COMPRAVENTA"
                                    },
                                    "formaPago": "CRÉDITO",
                                    "valorAdquisicion": {
                                        "valor": "0",
                                        "moneda": "MXN"
                                    },
                                    "fechaAdquisicion": "YYYY-MM-DD",
                                    "datoIdentificacion": "0",
                                    "valorConformeA": "ESCRITURA PÚBLICA",
                                    "motivoBaja": {
                                        "clave": "NA",
                                        "valor": "NO APLICA"
                                    },
                                    "ubicacionInmueble": "MX",
                                    "domicilioMexico": {
                                        "calle": "",
                                        "numeroExterior": "0",
                                        "numeroInterior": "0",
                                        "coloniaLocalidad": "",
                                        "municipioAlcaldia": {
                                            "clave": "101",
                                            "valor": "Tuxtla Gutiérrez"
                                        },
                                        "entidadFederativa": {
                                            "clave": "07",
                                            "valor": "Chiapas"
                                        },
                                        "codigoPostal": "00000"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN VEHICULOS
        $JsonReturn .= '"vehiculos": {
                            "ninguno": false,
                            "vehiculo": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "titular": [
                                        {
                                            "clave": "DEC",
                                            "valor": "DECLARANTE"
                                        },
                                        {
                                            "clave": "CYG",
                                            "valor": "CÓNYUGE"
                                        }
                                    ],
                                    "tipoVehiculo": {
                                        "clave": "AUMOT",
                                        "valor": "AUTOMÓVIL/MOTOCICLETA"
                                    },
                                    "transmisor": [
                                        {
                                            "tipoPersona": "FISICA",
                                            "nombreRazonSocial": "",
                                            "rfc": "",
                                            "relacion": {
                                                "clave": "HER",
                                                "valor": "HERMANO(A)"
                                            }
                                        }
                                    ],
                                    "tercero": [
                                        {
                                            "tipoPersona": "FISICA",
                                            "nombreRazonSocial": "",
                                            "rfc": ""
                                        }
                                    ],
                                    "marca": "FORD",
                                    "modelo": "SENTRA",
                                    "anio": "2020",
                                    "numeroSerieRegistro": "",
                                    "lugarRegistro": {
                                        "pais": "MX",
                                        "entidadFederativa": {
                                            "clave": "07",
                                            "valor": "Chiapas"
                                        }
                                    },
                                    "formaAdquisicion": {
                                        "clave": "CPV",
                                        "valor": "COMPRAVENTA"
                                    },
                                    "formaPago": "CRÉDITO",
                                    "valorAdquisicion": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    },
                                    "fechaAdquisicion": "YYYY-MM-DD",
                                    "motivoBaja": {
                                        "clave": "OTRO",
                                        "valor": "XXX"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN BIENES MUEBLES
        $JsonReturn .= '"bienesMuebles": {
                            "ninguno": false,
                            "bienMueble": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "titular": [
                                        {
                                            "clave": "DEC",
                                            "valor": "DECLARANTE"
                                        },
                                        {
                                            "clave": "CYG",
                                            "valor": "CÓNYUGE"
                                        }
                                    ],
                                    "tipoBien": {
                                        "clave": "MECA",
                                        "valor": "MENAJE DE CASA (MUEBLES Y ACCESORIOS DE CASA)"
                                    },
                                    "transmisor": [
                                        {
                                            "tipoPersona": "FISICA",
                                            "nombreRazonSocial": "",
                                            "rfc": "",
                                            "relacion": {
                                                "clave": "HER",
                                                "valor": "HERMANO(A)"
                                            }
                                        }
                                    ],
                                    "tercero": [
                                        {
                                            "tipoPersona": "FISICA",
                                            "nombreRazonSocial": "",
                                            "rfc": ""
                                        }
                                    ],
                                    "descripcionGeneralBien": "DEMO",
                                    "formaAdquisicion": {
                                        "clave": "STC",
                                        "valor": "SENTENCIA"
                                    },
                                    "formaPago": "NO APLICA",
                                    "valorAdquisicion": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    },
                                    "fechaAdquisicion": "YYYY-MM-DD",
                                    "motivoBaja": {
                                        "clave": "NA",
                                        "valor": "NO APLICA"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN INVERSIONES
        $JsonReturn .= '"inversiones": {
                            "ninguno": false,
                            "inversion": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "tipoInversion": {
                                        "clave": "BANC",
                                        "valor": "BANCARIA"
                                    },
                                    "subTipoInversion": {
                                        "clave": "CNOM",
                                        "valor": "CUENTA DE NÓMINA"
                                    },
                                    "titular": [
                                        {
                                            "clave": "DEC",
                                            "valor": "DECLARANTE"
                                        }
                                    ],
                                    "tercero": [],
                                    "numeroCuentaContrato": "",
                                    "localizacionInversion": {
                                        "pais": "MX",
                                        "institucionRazonSocial": "",
                                        "rfc": ""
                                    },
                                    "saldoSituacionActual": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN ADEUDOS
        $JsonReturn .= '"adeudos": {
                            "ninguno": false,
                            "adeudo": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "titular": [
                                        {
                                            "clave": "DEC",
                                            "valor": "DECLARANTE"
                                        },
                                        {
                                            "clave": "CYG",
                                            "valor": "CÓNYUGE"
                                        }
                                    ],
                                    "tipoAdeudo": {
                                        "clave": "CPER",
                                        "valor": "CRÉDITO PERSONAL"
                                    },
                                    "numeroCuentaContrato": "",
                                    "fechaAdquisicion": "YYYY-MM-DD",
                                    "montoOriginal": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    },
                                    "otorganteCredito": {
                                        "tipoPersona": "FISICA",
                                        "nombreInstitucion": "",
                                        "rfc": ""
                                    },
                                    "tercero": [
                                        {
                                            "tipoPersona": "FISICA",
                                            "nombreRazonSocial": "",
                                            "rfc": ""
                                        }
                                    ],
                                    "localizacionAdeudo": {
                                        "pais": "MX"
                                    },
                                    "saldoInsolutoSituacionActual": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN PRESTAMO O COMODATO
        $JsonReturn .= '"prestamoOComodato": {
                            "ninguno": false,
                            "prestamo": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "duenoTitular": {
                                        "tipoDuenoTitular": "FISICA",
                                        "nombreTitular": "",
                                        "rfc": "",
                                        "relacionConTitular": ""
                                    },
                                    "tipoBien": {
                                        "inmueble": {
                                            "tipoInmueble": {
                                                "clave": "CASA",
                                                "valor": "CASA"
                                            },
                                            "domicilioMexico": {
                                                "calle": "",
                                                "numeroExterior": "0",
                                                "numeroInterior": "0",
                                                "coloniaLocalidad": "",
                                                "municipioAlcaldia": {
                                                    "clave": "101",
                                                    "valor": "TUXTLA GUTIÉRREZ"
                                                },
                                                "entidadFederativa": {
                                                    "clave": "07",
                                                    "valor": "CHIAPAS"
                                                },
                                                "codigoPostal": "00000"
                                            }
                                        }
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        }
                    },';


        //SECCIÓN INTERES, PARTICIPACIÓN, TOMA DE DECISIONES.
        $JsonReturn .= '"interes": {
                            "participacion": {
                                "ninguno": false,
                                "participacion": [
                                    {
                                        "tipoOperacion": "AGREGAR",
                                        "tipoRelacion": "",
                                        "nombreEmpresaSociedadAsociacion": "",
                                        "rfc": "",
                                        "porcentajeParticipacion": "0",
                                        "tipoParticipacion": {
                                            "clave": "ACCI",
                                            "valor": "ACCIONISTA"
                                        },
                                        "recibeRemuneracion": true,
                                        "montoMensual": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "ubicacion": {
                                            "pais": "MX",
                                            "entidadFederativa": {
                                                "clave": "07",
                                                "valor": "Chiapas"
                                            }
                                        },
                                        "sector": {
                                            "clave": "AGRI",
                                            "valor": "AGRICULTURA"
                                        }
                                    }
                                ],
                                "aclaracionesObservaciones": ""
                            },
                            "participacionTomaDecisiones": {
                                "ninguno": false,
                                "participacion": [
                                    {
                                        "tipoOperacion": "AGREGAR",
                                        "tipoRelacion": "",
                                        "tipoInstitucion": {
                                            "clave": "OSC",
                                            "valor": "ORGANIZACIONES DE LA SOCIEDAD CIVIL"
                                        },
                                        "nombreInstitucion": "",
                                        "rfc": "",
                                        "puestoRol": "",
                                        "fechaInicioParticipacion": "YYYY-MM-DD",
                                        "recibeRemuneracion": true,
                                        "montoMensual": {
                                            "valor": 0,
                                            "moneda": "MXN"
                                        },
                                        "ubicacion": {
                                            "pais": "MX",
                                            "entidadFederativa": {
                                                "clave": "07",
                                                "valor": "CHIAPAS"
                                            }
                                        }
                                    }
                                ],
                                "aclaracionesObservaciones": ""
                            },';


        //SECCIÓN APOYOS 
        $JsonReturn .= '"apoyos": {
                            "ninguno": false,
                            "apoyo": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "tipoPersona": "FISICA",
                                    "beneficiarioPrograma": {
                                        "clave": "DC",
                                        "valor": "DECLARANTE"
                                    },
                                    "nombrePrograma": "",
                                    "institucionOtorgante": "",
                                    "nivelOrdenGobierno": "",
                                    "tipoApoyo": {
                                        "clave": "SUB",
                                        "valor": "SUBSIDIO"
                                    },
                                    "formaRecepcion": "",
                                    "montoApoyoMensual": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    },
                                    "especifiqueApoyo": ""
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';
        
        //SECCIÓN PRESTACIÓN
        $JsonReturn .= '"representacion": {
                            "ninguno": false,
                            "representacion": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "tipoRelacion": "DECLARANTE",
                                    "tipoRepresentacion": "REPRESENTANTE",
                                    "fechaInicioRepresentacion": "YYYY-MM-DD",
                                    "tipoPersona": "FISICA",
                                    "nombreRazonSocial": "",
                                    "rfc": "",
                                    "recibeRemuneracion": true,
                                    "montoMensual": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    },
                                    "ubicacion": {
                                        "pais": "MX",
                                        "entidadFederativa": {
                                            "clave": "07",
                                            "valor": "CHIAPAS"
                                        }
                                    },
                                    "sector": {
                                        "clave": "AGRI",
                                        "valor": "AGRICULTURA"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN CLIENTES PRINCIPALES
        $JsonReturn .= '"clientesPrincipales": {
                            "ninguno": false,
                            "cliente": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "realizaActividadLucrativa": true,
                                    "tipoRelacion": "DECLARANTE",
                                    "empresa": {
                                        "nombreEmpresaServicio": "",
                                        "rfc": ""
                                    },
                                    "clientePrincipal": {
                                        "tipoPersona": "FISICA",
                                        "nombreRazonSocial": "",
                                        "rfc": ""
                                    },
                                    "sector": {
                                        "clave": "AGRI",
                                        "valor": "AGRICULTURA"
                                    },
                                    "montoAproximadoGanancia": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    },
                                    "ubicacion": {
                                        "pais": "MX",
                                        "entidadFederativa": {
                                            "clave": "07",
                                            "valor": "CHIAPAS"
                                        }
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN BENEFICIOS PRINCIPALES
        $JsonReturn .= '"beneficiosPrivados": {
                            "ninguno": false,
                            "beneficio": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "tipoPersona": "FISICA",
                                    "tipoBeneficio": {
                                        "clave": "S",
                                        "valor": "SORTEO"
                                    },
                                    "beneficiario": [
                                        {
                                            "clave": "DC",
                                            "valor": "DECLARANTE"
                                        },
                                        {
                                            "clave": "HER",
                                            "valor": "HERMANO(A)"
                                        }
                                    ],
                                    "otorgante": {
                                        "tipoPersona": "FISICA",
                                        "nombreRazonSocial": "",
                                        "rfc": ""
                                    },
                                    "formaRecepcion": "MONETARIO",
                                    "especifiqueBeneficio": "",
                                    "montoMensualAproximado": {
                                        "valor": 0,
                                        "moneda": "MXN"
                                    },
                                    "sector": {
                                        "clave": "AGRI",
                                        "valor": "AGRICULTURA"
                                    }
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        },';


        //SECCIÓN FIDEICOMISOS
        $JsonReturn .= '"fideicomisos": {
                            "ninguno": false,
                            "fideicomiso": [
                                {
                                    "tipoOperacion": "AGREGAR",
                                    "tipoRelacion": "DECLARANTE",
                                    "tipoFideicomiso": "",
                                    "tipoParticipacion": "",
                                    "rfcFideicomiso": "",
                                    "fideicomitente": {
                                        "tipoPersona": "FISICA",
                                        "nombreRazonSocial": "",
                                        "rfc": ""
                                    },
                                    "fiduciario": {
                                        "nombreRazonSocial": "",
                                        "rfc": ""
                                    },
                                    "fideicomisario": {
                                        "tipoPersona": "FISICA",
                                        "nombreRazonSocial": "",
                                        "rfc": ""
                                    },
                                    "sector": {
                                        "clave": "AGRI",
                                        "valor": "AGRICULTURA"
                                    },
                                    "extranjero": "MX"
                                }
                            ],
                            "aclaracionesObservaciones": ""
                        }
                    },';


        //SECCIÓN FISCAL
        $JsonReturn .= '"fiscal": {
                            "presento": false,
                            "url":""
                        }
                    }
                }';

}
?>