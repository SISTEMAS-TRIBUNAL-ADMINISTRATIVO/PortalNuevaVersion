<?php
    
    class DatosDelEmpleado
    {   
        public $Respuesta='';
        public $Mensaje='';
        public $DatosNominas;
        public $DatosResguardosBienesInformaticos;
        public $DatosPermisos;
        public $TotalNominas;
        public $TotalInformatico;
        public $TotalMobiliario;
        public $TotalDeclaracion;
        public $ActividadesRecientes;

        
        public function Login($email, $password)
        {
            include('conexion.php');
            $PassEncryp = md5($email).hash('sha256', $password);
            $sql="  SELECT 
                        id_usuario,
                        nombre,
                        paterno,
                        materno,
                        email,
                        siglas,
                        PASSWORD,
                        token,
                        Enlace,
                        id_rol,
                        rol,
                        descripcion_rol,
                        id_sistema,
                        sistema,
                        alias,
                        IdPadreSistema,
                        url_declaracion
                    FROM bd_seguridad_sistemas.cat_usuario
                    INNER JOIN bd_seguridad_sistemas.pri_usuario_rol_sistema on(pri_usuario_rol_sistema.fk_usuario = cat_usuario.id_usuario and pri_usuario_rol_sistema.activo= 1)
                    INNER JOIN  bd_seguridad_sistemas.cat_sistema on(pri_usuario_rol_sistema.fk_sistema = cat_sistema.id_sistema)
                    INNER JOIN bd_seguridad_sistemas.cat_rol on(pri_usuario_rol_sistema.fk_rol = cat_rol.id_rol)
                    WHERE email = '$email'
                    AND password = '$PassEncryp'
                    AND bd_seguridad_sistemas.cat_usuario.activo = 1
                    AND bd_seguridad_sistemas.cat_sistema.id_sistema = 2";


            $Resultado = $mysqlLenovo->query($sql);
            $row= $Resultado->fetch_assoc();

            if($row>0)
            {
                    session_start();
                    $_SESSION['id_usuario']=$row['id_usuario'];
                    $_SESSION['nombre']=$row['nombre'];
                    $_SESSION['paterno']=$row['paterno'];
                    $_SESSION['materno']=$row['materno'];
                    $_SESSION['email']=$row['email'];
                    $_SESSION['siglas']=$row['siglas'];
                    $_SESSION['PASSWORD']=$row['PASSWORD'];
                    $_SESSION['token']=$row['token'];
                    $_SESSION['Enlace']=$row['Enlace'];
                    $_SESSION['id_rol']=$row['id_rol'];
                    $_SESSION['rol']=$row['rol'];
                    $_SESSION['descripcion_rol']=$row['descripcion_rol'];
                    $_SESSION['id_sistema']=$row['id_sistema'];
                    $_SESSION['sistema']=$row['sistema'];
                    $_SESSION['alias']=$row['alias'];
                    $_SESSION['url_declaracion']=$row['url_declaracion'];
                    $_SESSION['IdPadreSistema']=$row['IdPadreSistema'];
                    header("Location: view/Home/home.php");

            }else
            {   
                $this->Respuesta='False';
                $this->Mensaje='El Usuario y/o Correo no existen o son incorrectos'; 
            }
        }
        public function Permisos($enlace)
        {
            include('conexion.php');
            $sql=" SELECT
                        id_permiso,
                        permiso
                    FROM bd_seguridad_sistemas.cat_permiso
                    INNER JOIN bd_seguridad_sistemas.pri_sistema_rol_permiso on(bd_seguridad_sistemas.pri_sistema_rol_permiso.fk_permiso = bd_seguridad_sistemas.cat_permiso.id_permiso)
                    INNER JOIN bd_seguridad_sistemas.pri_usuario_rol_sistema on(bd_seguridad_sistemas.pri_usuario_rol_sistema.fk_rol = bd_seguridad_sistemas.pri_sistema_rol_permiso.fk_rol)
                    WHERE bd_seguridad_sistemas.pri_usuario_rol_sistema.fk_usuario = '$enlace'
                    AND bd_seguridad_sistemas.pri_usuario_rol_sistema.fk_sistema = 2
                    AND bd_seguridad_sistemas.pri_usuario_rol_sistema.activo = 1
                    ORDER BY id_permiso";
    
            $this->DatosPermisos= $mysqlLenovo->query($sql);
           // $this->Nominas($_SESSION['Enlace']);
            $this->ResguardoBienesInformaticos($_SESSION['Enlace']);
            //$this->TotalNominas($_SESSION['Enlace']);
            $this->TotalInformatico($_SESSION['Enlace']);
            $this->GuardarActividadReciente(2, $_SESSION['id_usuario'], 1);
            $this->ObtenerActividadesRecientes($_SESSION['id_usuario']);
        }




        
        public function Nominas($enlace)
        {
            include('conexion.php');
            $sql= "SELECT id_cfdi, emp_rfc AS RFC, fk_empleado, CONVERT(CONCAT(emp_nombres, ' ', emp_paterno, ' ', emp_materno) USING utf8) 
            AS Empleado, cfdi_fecha_timbrado, cfdi_mensaje, nom_concepto, cfdi_xml_cfdi, cfdi_pdf_timbrado FROM pri_cfdi 
            INNER JOIN pri_nomina  ON fk_nomina = id_nom_nomina 
            INNER JOIN pri_empleado ON fk_empleado = id_emp_empleado where cfdi_cancelado=0 AND fk_empleado=$enlace  AND cfdi_pdf_timbrado IS NOT NULL ORDER BY id_nom_nomina DESC";
    
            $this->DatosNominas= $mysqlDell->query($sql);
        }
        public function ResguardoBienesInformaticos($enlace)
        {
            include('conexion.php');
            $sql= " SELECT 
                        id_equipo, 
                        descripcion_tipoequipo AS Descripcion, 
                        nombre_marca AS Marca, 
                        Modelo, 
                        Serie, 
                        Inventario, 
                        Observacion, 
                        fecha_alta AS Alta, 
                        origen_nombre AS 'Origen del Equipo', 
                        id_resguardo 
                    FROM cat_equipos_informaticos 
                    INNER JOIN cat_tipo_equipos ON fk_tipo = id_tip_tipoequipo 
                    INNER JOIN cat_marca_equipo ON  fk_marca = id_mar_marca 
                    INNER JOIN pri_resguardo_equipo ON  fk_equipo = id_equipo 
                    INNER JOIN cat_origen_equipo ON  id_origen_equipo = fk_origen_equipo 
                    WHERE estado = 1 AND fk_empleado = $enlace ORDER BY id_resguardo";

            $this->DatosResguardosBienesInformaticos=$mysqlLenovo->query($sql);
        }
        public function TotalNominas($enlace)
        {
            include('conexion.php');
            $sql= "SELECT count(*) As Total FROM pri_cfdi 
            INNER JOIN pri_nomina  ON fk_nomina = id_nom_nomina 
            INNER JOIN pri_empleado ON fk_empleado = id_emp_empleado where cfdi_cancelado=0 AND fk_empleado=$enlace  AND cfdi_pdf_timbrado IS NOT NULL ORDER BY id_nom_nomina DESC";

            $Resultado = $mysqlDell->query($sql);
            $row= $Resultado->fetch_assoc();
            $this->TotalNominas= $row['Total'];
        }
        public function TotalInformatico($enlace)
        {
            include('conexion.php');
            $sql= "SELECT count(*) as Total
                   FROM cat_equipos_informaticos 
                   iNNER JOIN pri_resguardo_equipo ON  fk_equipo = id_equipo 
                   WHERE estado = 1 AND fk_empleado =$enlace ORDER BY id_resguardo";

            $Resultado = $mysqlLenovo->query($sql);
            $row= $Resultado->fetch_assoc();
            $this->TotalInformatico= $row['Total'];
        }
        public function ObtenerActividadesRecientes($IdUsuario)
        {
            include('conexion.php');
            $sql="SELECT 
                        titulo,
                        descripcion,
                        comentarios_actividad,
                        fecha,
                        observaciones,
                        sistema,
                        alias
                  FROM bd_seguridad_sistemas.pri_actividad_usuario
                  INNER JOIN bd_seguridad_sistemas.cat_actividad ON fk_catactividad = id_catactividad
                  INNER JOIN bd_seguridad_sistemas.cat_sistema ON fk_sistema = id_sistema
                  WHERE fk_usuario=$IdUsuario"." ORDER BY id_actividad DESC LIMIT 5";
    
            $this->ActividadesRecientes= $mysqlLenovo->query($sql);
        }
        public function GuardarActividadReciente($IdSistema, $IdUsuario, $IdActividad)
        {
            include('conexion.php');

            $ip_address = $_SERVER['REMOTE_ADDR'];
            $windows_username = getenv('USERNAME');
            $hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);
            $Observaciones= 'IP: '.$ip_address.',  Usuario Windows: '.$windows_username.',  Equipo: '.$hostname;


            $sql= "INSERT INTO bd_seguridad_sistemas.pri_actividad_usuario
                    SET 
                        fk_sistema=2,
                        fk_usuario=1,
                        fk_catactividad=1,
                        fecha=now(),
                        observaciones='$Observaciones'";
            $resultado = $mysqlLenovo->query($sql);
        }
    }
?>
