<?php
    require_once("../config/conexion.php");
    require_once("../models/LoginModel.php");
    require_once("../models/EnviarCodigoVerificacionModel.php");

    $conexion = new Conectar();
    $Login = new CLogin();
    $EnviorCodigo = new CodigoVerificacion();
    header('Content-Type: application/json');


    switch ($_GET["opcion"]) 
    {
        case "login":
                    $datos = $Login->login($_POST["email"], $_POST['password']);
                    $DatosDeRespuesta = array(); 

                    if (is_array($datos) && count($datos) > 0) 
                    {
                        foreach ($datos as $resultado) 
                        {
                            $_SESSION["id_usuario"] = $resultado["id_usuario"];
                            $_SESSION["nombre"] = $resultado["nombres"];
                            $_SESSION["paterno"] = $resultado["paterno"];
                            $_SESSION["materno"] = $resultado["materno"];
                            $_SESSION["email"] = $resultado["email"];
                            $_SESSION["siglas"] = $resultado["siglas"];
                            $_SESSION["CURP"] = $resultado["curp"];
                            $_SESSION["Enlace"] = $resultado["Enlace"];
                            $_SESSION["id_rol"] = $resultado["id_rol"];
                            $_SESSION["fk_area_pertenece_siga "] = $resultado["fk_area_pertenece_siga"];
                            $_SESSION["autorizacion"] = $resultado["autorizacion"];
                            $datos_foto = $Login->ObtenerFoto($_SESSION["Enlace"]);

                            if($resultado["sexo"] == 'HOMBRE')
                            {
                                $_SESSION["Mensaje"] = "Bienvenido";
                            }
                            else
                            {
                                $_SESSION["Mensaje"] = "Bienvenida";
                            }


                            if (isset($resultado) && $resultado["imagen_user"] != null) 
                            {
                                $_SESSION["fotoBase64"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_user"]);
                            } else 
                            {
                                $_SESSION["fotoBase64"] = 'https://static.vecteezy.com/system/resources/previews/027/728/804/non_2x/faceless-businessman-user-profile-icon-business-leader-profile-picture-portrait-user-member-people-icon-in-flat-style-circle-button-with-avatar-photo-silhouette-free-png.png';
                            }


                            if($resultado["primer_inicio"] == 1)
                            {
                                $DatosDeRespuesta["Validar"] = 1; //Vista de cambio de contraseña
                            }
                            else
                            {
                                $DatosDeRespuesta["Validar"] = 2; //Vista dashboard
                            }
                        }
                        
                    } else 
                    {
                        $DatosDeRespuesta["Validar"] = 0;
                    }
                    echo json_encode($DatosDeRespuesta);
        break;

        case "Registro":

                    $datosCURP = $Login->ValidarExisteCURP($_POST["curp"]);
                    $DatosDeRespuesta = array(); 

                    if (is_array($datosCURP) && count($datosCURP) > 0) 
                    {
                        $DatosDeRespuesta["Validar"] = 1; // el usuario ya existe
                    }
                    else
                    {
                        $datos = $Login->DatosDelEmpleadoEnSiga($_POST["curp"], $_POST['correo']);
                        if (is_array($datos) && count($datos) > 0) 
                        {
                            foreach ($datos as $resultado) 
                            {
                                $Login->RegistrarUsuario(
                                                            $resultado["emp_enlace"], 
                                                            $resultado["emp_nombres"], 
                                                            $resultado["emp_paterno"], 
                                                            $resultado["emp_materno"], 
                                                            $resultado["emp_curp"],
                                                            $resultado["emp_correoper"],
                                                            $resultado["emp_telmovil"],
                                                            $resultado["sex_descripcion"],
                                                            md5($resultado["emp_enlace"]) . hash('sha256', $resultado["emp_curp"]),
                                                            $resultado["pre_descripcion"],
                                                            $resultado["pre_descdelprefijo"],
                                                            $resultado["fot_foto"]
                                                        );
                                $DatosDeRespuesta["Autorizacion"] = md5($resultado["emp_enlace"]) . hash('sha256', $resultado["emp_curp"]);
                                $DatosDeRespuesta["PassTemp"] = md5($resultado["emp_correoper"]) . hash('sha256', $resultado["emp_curp"]);
                                $DatosDeRespuesta["Enlace"] = $resultado["emp_enlace"];

                                $EnviorCodigo->EnviarCodigoACorreo($resultado["emp_correoper"], $resultado["emp_nombres"]);
                            }
                            $DatosDeRespuesta["Validar"] = 2; // el usuario se registro correctamente
                            
                        } else 
                        {
                            $DatosDeRespuesta["Validar"] = 3; // contactar al area de recursos humanos para que registren al empleado
                        }
                    }
                    
                    echo json_encode($DatosDeRespuesta);
        break;

        case "verificarCodigo":

                    $datos = $EnviorCodigo->verificarCodigo($_POST["validacion"], $_POST["codigover"]);
                    $DatosDeRespuesta = array(); 

                    if (is_array($datos) && count($datos) > 0) 
                    {
                        $DatosDeRespuesta["Validar"] = 1; // Codigo correcto
                        $Login->ActualziarCodigoVerificado($_POST["validacion"], $_POST["token"]);

                        // Agregar permisos al usuario portal de las personas servidoras publicas
                        $Login->AgregarPermisosUsuario($_POST["Enlace"], 4,7);

                        //agregar persmisos al usuario al sistema de nomina
                        $Login->AgregarPermisosUsuario($_POST["Enlace"], 8,6);

                        //agregar persmisos al usuario al sistema de declaraciones patrimoniales
                        $Login->AgregarPermisosUsuario($_POST["Enlace"], 10,2);
                    }
                    else
                    {
                        $DatosDeRespuesta["Validar"] = 2; // codigo incorrecto
                    }
                    
                    echo json_encode($DatosDeRespuesta);
        break;
    }
?>
