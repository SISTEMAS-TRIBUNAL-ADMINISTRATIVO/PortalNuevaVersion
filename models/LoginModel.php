<?php
    class CLogin extends Conectar
    {
        public function login($Email, $Password)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $PassEncryp = md5($Email) . hash('sha256', $Password);

            $sql = "SELECT 
                        id_usuario,
                        Enlace,
                        nombres,
                        paterno,
                        materno,
                        curp,
                        email,
                        telefono,
                        siglas,
                        PASSWORD,
                        autorizacion,
                        sexo,
                        prefijo,
                        descripcion_prefijo,
                        primer_inicio,
                        id_rol,
                        rol,
                        descripcion_rol,
                        id_sistema,
                        sistema,
                        alias,
                        fk_area_pertenece_siga,
                        primer_inicio,
                        imagen_user
                    FROM cat_usuario
                    INNER JOIN pri_usuario_rol_sistema ON (pri_usuario_rol_sistema.Enlace_rol_sistema = cat_usuario.enlace AND pri_usuario_rol_sistema.activo = 1)
                    INNER JOIN cat_sistema ON (pri_usuario_rol_sistema.fk_sistema = cat_sistema.id_sistema)
                    INNER JOIN cat_rol ON (pri_usuario_rol_sistema.fk_rol = cat_rol.id_rol)
                    WHERE email = ?
                    AND PASSWORD = ?
                    AND cat_usuario.activo = 1
                    AND cat_sistema.id_sistema = 7";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Email);
            $stmt->bindValue(2, $PassEncryp);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function RegistrarUsuario($enlace, $nombres, $paterno, $materno, $curp, $email, $telefono, $sexo, $autorizacion, $prefijo, $DesPre, $imagen)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "INSERT INTO cat_usuario 
                    SET 
                        enlace=?,
                        nombres=?, 
                        paterno=?,
                        materno=?,
                        curp=?,
                        email=?,
                        telefono=?,
                        sexo=?, 
                        autorizacion=?,
                        prefijo=?,
                        descripcion_prefijo=?,
                        imagen_user=?";
    
            $stmt = $conectar->prepare($sql);
            $stmt->bindParam(1, $enlace);
            $stmt->bindParam(2, $nombres);
            $stmt->bindParam(3, $paterno);
            $stmt->bindParam(4, $materno);
            $stmt->bindParam(5, $curp);
            $stmt->bindParam(6, $email);
            $stmt->bindParam(7, $telefono);
            $stmt->bindParam(8, $sexo);
            $stmt->bindParam(9, $autorizacion);
            $stmt->bindParam(10, $prefijo);
            $stmt->bindParam(11, $DesPre);
            $stmt->bindParam(12, $imagen);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

         public function ObtenerFoto($Enlace)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT fot_foto AS Foto 
                    FROM pri_foto 
                    WHERE fk_emp_empleado=?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function ValidarExisteCURP($curp)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT * FROM cat_usuario WHERE curp=?";
    
            $stmt = $conectar->prepare($sql);
            $stmt->bindParam(1, $curp);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function DatosDelEmpleadoEnSiga($CURP, $Email)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT
                        emp_curp,
                        emp_nombres,
                        emp_paterno,
                        emp_materno,
                        emp_telmovil,
                        sex_descripcion,
                        emp_correoper,
                        emp_enlace,
                        pre_descripcion,
                        pre_descdelprefijo,
                        fot_foto
                    FROM pri_empleado
                    INNER JOIN cat_sexo ON fk_sex_Sexo = id_sex_sexo
                    INNER JOIN cat_prefijo ON fk_pre_prefijo = id_pre_prefijo
                    INNER JOIN pri_foto ON fk_emp_empleado = id_emp_empleado
                    WHERE emp_curp=? AND emp_correoper=?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $CURP);
            $stmt->bindValue(2, $Email);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function ActualziarCodigoVerificado($autorizacion, $token)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "UPDATE cat_usuario 
                    SET 
                        correo_verificado=1,
                        password=?
                    WHERE autorizacion=?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $token);
            $stmt->bindValue(2, $autorizacion);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function AgregarPermisosUsuario($Enlace, $Rol, $Sistema)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "INSERT INTO pri_usuario_rol_sistema
                    SET 
                        Enlace_rol_sistema=?,
                        fk_rol=?,
                        fk_sistema=?,
                        activo=1,
                        fecha_asignacion=NOW()"; 

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->bindValue(2, $Rol);
            $stmt->bindValue(3, $Sistema);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
?>
