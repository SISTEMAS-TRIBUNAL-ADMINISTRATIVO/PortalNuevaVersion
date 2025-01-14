<?php
    require_once("../config/conexion.php");
    require_once("../models/UsuarioModel.php");
    require_once("encryptController.php");
    $conexion = new Conectar();

       
    $usuario = new Usuario();
    header('Content-Type: application/json');


        switch ($_GET["opcion"]) 
        {
            case "login":
                        $datos = $usuario->login($_POST["email"], $_POST['password']);

                        $DatosDeRespuesta = array(); 

                        if (is_array($datos) && count($datos) > 0) 
                        {
                            foreach ($datos as $resultado) 
                            {
                                $_SESSION["id_usuario"] = $resultado["id_usuario"];
                                $_SESSION["nombre"] = $resultado["nombre"];
                                $_SESSION["paterno"] = $resultado["paterno"];
                                $_SESSION["materno"] = $resultado["materno"];
                                $_SESSION["email"] = $resultado["email"];
                                $_SESSION["siglas"] = $resultado["siglas"];
                                $_SESSION["PASSWORD"] = $resultado["PASSWORD"];
                                $_SESSION["token"] = $resultado["token"];
                                $_SESSION["Enlace"] = $resultado["Enlace"];
                                $_SESSION["id_rol"] = $resultado["id_rol"];
                                $_SESSION["rol"] = $resultado["rol"];
                                $_SESSION["descripcion_rol"] = $resultado["descripcion_rol"];
                                $_SESSION["id_sistema"] = $resultado["id_sistema"];
                                $_SESSION["sistema"] = $resultado["sistema"];
                                $_SESSION["alias"] = $resultado["alias"];
                                $_SESSION["IdPadreSistema"] = $resultado["IdPadreSistema"];
                                $_SESSION["url_declaracion"] = $resultado["url_declaracion"];
                                $UrlAutorizacion = $conexion->rutaHelpdesk()."controller/autorizacionController.php?Session_start=".$_SESSION['Enlace'];
                                $_SESSION["UrlAutorizacion"] = $UrlAutorizacion;

                                if ($resultado["fot_foto"] != null) {

                                    $DatosDeRespuesta["FOTO"] = 'data:image/jpeg;base64,' . base64_encode($resultado["fot_foto"]);

                                } 
                                else {

                                    $DatosDeRespuesta["FOTO"] = ''; // Ruta a una imagen de reemplazo   
                    }

                                
                            }
                            $DatosDeRespuesta["Validar"] = 1;
                        } else 
                        {
                            $DatosDeRespuesta["Validar"] = 0;
                        }
                        echo json_encode($DatosDeRespuesta);
            break;

            case "CambiarPassword":
                //$resultado = $usuario->CambiarContraseña(171,'diego@unach.mx', '54321');
                $resultado = $usuario->CambiarPassword($_SESSION['id_usuario'], $_SESSION['email'], $_POST['NewPassword']);
                $DatosDeRespuesta["Validar"] = 1;

                echo json_encode($DatosDeRespuesta);
            break;

                

            case "DatosLaborales":
                        $datos = $usuario->DatosLaborales($_SESSION['Enlace']);
                        $DatosDeRespuesta = array();
   
                        foreach ($datos as $resultado) 
                        {
                            $DatosDeRespuesta["prefijo"] = $resultado["pre_descripcion"];
                            $DatosDeRespuesta["fecha_de_alta"] = $resultado["Fecha_alta"];
                            $DatosDeRespuesta["numero_de_plaza"] = $resultado["Plaza"];
                            $DatosDeRespuesta["numero_de_enlace"] = $resultado["Enlace"];
                            $DatosDeRespuesta["categoria"] = $resultado["Categoria"];
                            $DatosDeRespuesta["banco"] = $resultado["Banco"];
                            $DatosDeRespuesta["numero_de_cuenta_bancaria"] = $resultado["emp_cuenta"];
                            $DatosDeRespuesta["clabe_interbancaria"] = $resultado["emp_clabe"];
                            $DatosDeRespuesta["fecha_de_alta_del_seguro_social"] = $resultado["emp_altass"];
                            $DatosDeRespuesta["numero_de_seguro_social"] = $resultado["emp_numeross"];
                        }
                        echo json_encode($DatosDeRespuesta);   
            break;


            case "Miperfil":
                        $datos = $usuario->Miperfil($_SESSION['Enlace']);
                        $DatosDeRespuesta = array(); 
   
                        foreach ($datos as $resultado) 
                        {
                            $DatosDeRespuesta["Nombre"] = $resultado["Nombre"];
                            $DatosDeRespuesta["Paterno"] = $resultado["Paterno"];
                            $DatosDeRespuesta["Materno"] = $resultado["Materno"];
                            $DatosDeRespuesta["Curp"] = $resultado["Curp"];
                            $DatosDeRespuesta["Rfc"] = $resultado["Rfc"];
                            $DatosDeRespuesta["Civil"] = $resultado["Civil"];
                            $DatosDeRespuesta["Telefono"] = $resultado["Telefono"];
                            $DatosDeRespuesta["Sangre"] = $resultado["Sangre"];
                            $DatosDeRespuesta["Domicilio"] = $resultado["Domicilio"];
                            $DatosDeRespuesta["CP"] = $resultado["CP"];
                            $DatosDeRespuesta["CP_SAT"] = $resultado["CP_SAT"];
                            $DatosDeRespuesta["Correo"] = $resultado["Correo"];
                        }
                        echo json_encode($DatosDeRespuesta);   
            break;


            case "DatosAcademicos":
                        $datos = $usuario->DatosAcademicos($_SESSION['Enlace']);
                        $data = array(); 
                
                        foreach ($datos as $resultado) 
                        {
                            $DatosDeRespuesta = array();
                            $DatosDeRespuesta[] = $resultado["ESCOLARIDAD"];
                            $DatosDeRespuesta[] = $resultado["PROFESION"];
                            $DatosDeRespuesta[] = $resultado["DOCUMENTO"];
                            $DatosDeRespuesta[] = $resultado["AÑO"];
                            $data[] = $DatosDeRespuesta;
                        }
                   
                        $results = array
                        (
                            "sEcho" => 1,
                            "iTotalRecords" => count($data),
                            "iTotalDisplayRecords" => count($data),
                            "aaData" => $data
                        );
                         echo json_encode($results);
            break;


            case "DatosGenerales":
                    //$datos = $usuario->DatosGenerales($_SESSION['Enlace']);
                    //$datos = $usuario->DatosGenerales(122);
                    /*$DatosDeRespuesta = array();

                    if (is_array($datos) && count($datos) > 0) 
                    {
                        foreach ($datos as $resultado) 
                        {
                            $DatosDeRespuesta["Foto"] = $resultado["Foto"];
                        }
                        $DatosDeRespuesta["Validar"]= "Si_tiene_foto";
                    }
                    else
                    {
                        $DatosDeRespuesta["Validar"]= "No_tiene_foto";
                    }

                   // $DatosDeRespuesta["Nombre"] = $_SESSION['nombre']; 
                    //$DatosDeRespuesta["Email"] = $_SESSION['email']; 
                    //$DatosDeRespuesta["Rol"] = $_SESSION['id_rol']; 
*/
                   // echo json_encode($DatosDeRespuesta);

            break;
        }
?>
