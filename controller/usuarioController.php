<?php
    require_once("../config/conexion.php");
    require_once("../models/UsuarioModel.php");

    $conexion = new Conectar();
    $usuario = new Usuario();
    $html = "";

    header('Content-Type: application/json');


    switch ($_GET["opcion"]) 
    {
        case "CambiarPassword":
                $resultado = $usuario->CambiarPassword($_SESSION['id_usuario'], $_SESSION['email'], $_POST['NewPassword']);
                $DatosDeRespuesta["Validar"] = 1;

            echo json_encode($DatosDeRespuesta);
        break;

        case "Miperfil":
                $datos = $usuario->Miperfil($_SESSION['Enlace']);
                $DatosDeRespuesta = array(); 

                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta["emp_enlace"] = $resultado["emp_enlace"];
                    $DatosDeRespuesta["emp_nombres"] = $resultado["emp_nombres"];
                    $DatosDeRespuesta["emp_paterno"] = $resultado["emp_paterno"];
                    $DatosDeRespuesta["emp_materno"] = $resultado["emp_materno"];
                    $DatosDeRespuesta["emp_curp"] = $resultado["emp_curp"];
                    $DatosDeRespuesta["emp_rfc"] = $resultado["emp_rfc"];
                    $DatosDeRespuesta["sex_descripcion"] = $resultado["sex_descripcion"];
                    $DatosDeRespuesta["emp_domicilio"] = $resultado["emp_domicilio"];
                    $DatosDeRespuesta["mun_domicilio"] = $resultado["mun_domicilio"];
                    $DatosDeRespuesta["col_descripcion"] = $resultado["col_descripcion"];
                    $DatosDeRespuesta["emp_telpart"] = $resultado["emp_telpart"];
                    $DatosDeRespuesta["civ_descripcion"] = $resultado["civ_descripcion"];
                    $DatosDeRespuesta["san_descripcion"] = $resultado["san_descripcion"];
                    $DatosDeRespuesta["nac_descripcion"] = $resultado["nac_descripcion"];
                    $DatosDeRespuesta["emp_correoper"] = $resultado["emp_correoper"];
                    $DatosDeRespuesta["mun_nacimiento"] = $resultado["mun_nacimiento"];
                    $DatosDeRespuesta["emp_cp_sat"] = $resultado["emp_cp_sat"];
                    $DatosDeRespuesta["col_postal"] = $resultado["col_postal"];
                    $DatosDeRespuesta["pre_descripcion"] = $resultado["pre_descripcion"];
                    $DatosDeRespuesta["pla_numero"] = $resultado["pla_numero"];
                    $DatosDeRespuesta["cat_nombre"] = $resultado["cat_nombre"];
                    $DatosDeRespuesta["ads_descripcion"] = $resultado["ads_descripcion"];
                    $DatosDeRespuesta["ban_descripcion"] = $resultado["ban_descripcion"];
                    $DatosDeRespuesta["emp_ingresogobierno"] = $resultado["emp_ingresogobierno"];
                    $DatosDeRespuesta["emp_altass"] = $resultado["emp_altass"];
                    $DatosDeRespuesta["emp_numeross"] = $resultado["emp_numeross"];
                    $DatosDeRespuesta["viv_descripcion"] = $resultado["viv_descripcion"];

                    if ($resultado["emp_cuenta"] == '') 
                    {
                        $DatosDeRespuesta["emp_clabe"] = $resultado["emp_clabe"];
                    }
                    else 
                    {
                        $DatosDeRespuesta["emp_clabe"] = $resultado["emp_cuenta"];
                    }
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

        case "TodoslosUsuarios":
                $datos = $usuario->Todos();
                $data = array(); 
        
                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta = array();
                    $DatosDeRespuesta[] = $resultado["enlace"];
                    $DatosDeRespuesta[] = $resultado["nombres"] . " " . $resultado["paterno"] . " " . $resultado["materno"];
                    $DatosDeRespuesta[] = $resultado["email"];

                    if ($resultado["activo"] == 1) 
                    {
                        $DatosDeRespuesta[] = '<span class="badge bg-success">Activo</span>';
                    } 
                    else 
                    {
                        $DatosDeRespuesta[] = '<span class="badge bg-danger">Inactivo</span>';
                    }

                    $DatosDeRespuesta[] = '<div class="text-center">
                                                <button class="btn btn-info btn-sm me-1" onclick="verUsuario('.$resultado['enlace'] .')">
                                                    <i class="bi bi-eye"></i>
                                                </button>

                                                <button class="btn btn-warning btn-sm me-1" onclick="editarUsuario('.$resultado['enlace'].')">
                                                    <i class="bi bi-pencil-square"></i>
                                                </button>

                                                <button class="btn btn-danger btn-sm" onclick="desactivarUsuario('.$resultado['enlace'].'">
                                                    <i class="bi bi-person-x"></i>
                                                </button>
                                        </div>';

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


        case "DetallesUsuarioXid":

            $datos = $usuario->DetallesUsuarioXid($_POST['Enlace']);

            foreach ($datos as $resultado) 
            {
                $html .= "
                        <div class='col-md-3 text-center'>
                            <img src='data:image/jpeg;base64," . base64_encode($resultado['imagen_user']) . "' alt='Foto del Usuario' 
                                class='img-fluid rounded-circle border border-3' 
                                style='width: 200px; height: 200px; object-fit: cover;'>
                        </div>
                        <div class='col-md-9'>
                            <div class='row g-3'>
                                <div class='col-md-6'><strong>Enlace:</strong> " . htmlspecialchars($resultado['enlace']) . "</div>
                                <div class='col-md-6'><strong>Área Pertenece:</strong> " . htmlspecialchars($resultado['nombres']) . "</div>
                                <div class='col-md-6'><strong>Nombre:</strong> " . htmlspecialchars($resultado['nombres']) . "</div>
                                <div class='col-md-6'><strong>Apellido Paterno:</strong> " . htmlspecialchars($resultado['paterno']) . "</div>
                                <div class='col-md-6'><strong>Apellido Materno:</strong> " . htmlspecialchars($resultado['materno']) . "</div>
                                <div class='col-md-6'><strong>CURP:</strong> " . htmlspecialchars($resultado['curp']) . "</div>
                                <div class='col-md-6'><strong>Correo:</strong> " . htmlspecialchars($resultado['email']) . "</div>
                                <div class='col-md-6'><strong>Teléfono:</strong> " . htmlspecialchars($resultado['telefono']) . "</div>
                                <div class='col-md-6'><strong>Siglas:</strong> " . htmlspecialchars($resultado['siglas']) . "</div>
                                <div class='col-md-6'><strong>Sexo:</strong> " . htmlspecialchars($resultado['sexo']) . "</div>
                                <div class='col-md-6'><strong>Prefijo:</strong> " . htmlspecialchars($resultado['prefijo']) . "</div>
                                <div class='col-md-6'><strong>Descripción del Prefijo:</strong> " . htmlspecialchars($resultado['descripcion_prefijo']) . "</div>
                            </div>
                        </div>";
            }

            echo $html;
        break;

        
        case "ListaDePermisosDeSistemas":
                $datos = $usuario->ListaDePermisosDeSistemas($_POST['Enlace']);
                $data = array(); 
        
                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta = array();
                    $DatosDeRespuesta[] = $resultado["alias"];
                    $DatosDeRespuesta[] = $resultado["rol"];
                    $DatosDeRespuesta[] = $resultado["fecha_asignacion"];

                    if ($resultado["activo"] == 1) 
                    {
                        $DatosDeRespuesta[] = '<span class="badge bg-success">Activo</span>';

                        $DatosDeRespuesta[] = '<div class="text-center">
                                                    <button class="btn btn-sm btn-warning" onclick="EditarPermisoSistema('.$resultado['Enlace_rol_sistema'].', '.$resultado['fk_rol'].', '.$resultado['fk_sistema'].')">
                                                        <i class="bi bi-pencil-square"></i>
                                                    </button>
                                                    <button class="btn btn-danger btn-sm" onclick="DesactivarPermisoSistema('.$resultado['Enlace_rol_sistema'].', '.$resultado['fk_rol'].', '.$resultado['fk_sistema'].')">
                                                        <i class="bi bi-x-circle"></i>
                                                    </button>
                                                </div>';
                    } 
                    else 
                    {
                        $DatosDeRespuesta[] = '<span class="badge bg-danger">Inactivo</span>';

                        $DatosDeRespuesta[] = '<div class="text-center">
                                                    <button class="btn btn-sm btn-warning" onclick="EditarPermisoSistema('.$resultado['Enlace_rol_sistema'].', '.$resultado['fk_rol'].', '.$resultado['fk_sistema'].')">
                                                        <i class="bi bi-pencil-square"></i>
                                                    </button>
                                                    <button class="btn btn-success btn-sm" onclick="ActivarPermisoSistema('.$resultado['Enlace_rol_sistema'].', '.$resultado['fk_rol'].', '.$resultado['fk_sistema'].')">
                                                        <i class="bi bi-check-circle"></i>
                                                    </button>
                                                </div>';
                    }


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

        case "ListaDePermisosExtras":
                $datos = $usuario->ListaDePermisosExtras($_POST['Enlace']);
                $data = array(); 
        
                foreach ($datos as $resultado) 
                {
                    $DatosDeRespuesta = array();
                    $DatosDeRespuesta[] = $resultado["permiso_extra"];
                    $DatosDeRespuesta[] = $resultado["alias"];
                    $DatosDeRespuesta[] = $resultado["fecha_asigancion_permiso"];

                    if ($resultado["activo_permiso_extra"] == 1) 
                    {
                        $DatosDeRespuesta[] = '<span class="badge bg-success">Activo</span>';

                        $DatosDeRespuesta[] = '<div class="text-center">
                                                    <button class="btn btn-sm btn-warning" onclick="EditarPermisoExtra('.$resultado['fk_permiso_extra'].', '.$resultado['fk_enlace_user'].', '.$resultado['fk_sistema_permiso'].')">
                                                        <i class="bi bi-pencil-square"></i>
                                                    </button>
                                                    <button class="btn btn-danger btn-sm" onclick="DesactivarPermisoExtra('.$resultado['fk_permiso_extra'].', '.$resultado['fk_enlace_user'].', '.$resultado['fk_sistema_permiso'].')">
                                                        <i class="bi bi-x-circle"></i>
                                                    </button>
                                                </div>';
                    } 
                    else 
                    {
                        $DatosDeRespuesta[] = '<span class="badge bg-danger">Inactivo</span>';

                        $DatosDeRespuesta[] = '<div class="text-center">
                                                    <button class="btn btn-sm btn-warning" onclick="EditarPermisoExtra('.$resultado['fk_permiso_extra'].', '.$resultado['fk_enlace_user'].', '.$resultado['fk_sistema_permiso'].')">
                                                        <i class="bi bi-pencil-square"></i>
                                                    </button>
                                                    <button class="btn btn-success btn-sm" onclick="ActivarPermisoExtra('.$resultado['fk_permiso_extra'].', '.$resultado['fk_fk_enlace_userrol'].', '.$resultado['fk_sistema_permiso'].')">
                                                        <i class="bi bi-check-circle"></i>
                                                    </button>
                                                </div>';
                    }


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


        case "UsuarioXid":
            $datos = $usuario->DetallesUsuarioXid($_POST['Enlace']);
            $DatosDeRespuesta = array(); 

            foreach ($datos as $resultado) 
            {
                $DatosDeRespuesta["enlace"] = $resultado["enlace"];
                $DatosDeRespuesta["nombres"] = $resultado["nombres"];
                $DatosDeRespuesta["paterno"] = $resultado["paterno"];
                $DatosDeRespuesta["materno"] = $resultado["materno"];
                $DatosDeRespuesta["curp"] = $resultado["curp"];
                $DatosDeRespuesta["email"] = $resultado["email"];
                $DatosDeRespuesta["telefono"] = $resultado["telefono"];
                $DatosDeRespuesta["siglas"] = $resultado["siglas"];
                $DatosDeRespuesta["sexo"] = $resultado["sexo"];
                $DatosDeRespuesta["prefijo"] = $resultado["prefijo"];
                $DatosDeRespuesta["descripcion_prefijo"] = $resultado["descripcion_prefijo"];
                $DatosDeRespuesta["imagen_user"] = 'data:image/jpeg;base64,' . base64_encode($resultado["imagen_user"]); 
                $DatosDeRespuesta["fk_area_pertenece_siga"] = $resultado["fk_area_pertenece_siga"];
            }
            echo json_encode($DatosDeRespuesta);
        break;


        case 'buscarUsuarios':
            $query = $_POST['criterio'];
            $datos = $usuario->BuscarUsuarios($query);
            foreach ($datos as $resultado) 
            {
               $html .= "<button type='button' class='list-group-item list-group-item-action'
                    onclick='seleccionarUsuario(\"{$resultado["enlace"]}\", \"".htmlspecialchars($resultado["nombre_completo"])."\")'>
                    ".htmlspecialchars($resultado["nombre_completo"])."
                </button>";
            }
            
            echo $html;
        break;
    }
?>
