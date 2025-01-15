<?php
    class Usuario extends Conectar
    {
        public function login($Email, $Password)
        {
            $conectar = parent::conexion("seguridad");
            parent::set_names();

            $PassEncryp = md5($Email) . hash('sha256', $Password);

            $sql = "SELECT 
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
                url_declaracion,
                fot_foto
            FROM bd_seguridad_sistemas.cat_usuario
            INNER JOIN bd_seguridad_sistemas.pri_usuario_rol_sistema ON (pri_usuario_rol_sistema.fk_usuario = cat_usuario.id_usuario AND pri_usuario_rol_sistema.activo = 1)
            INNER JOIN bd_seguridad_sistemas.cat_sistema ON (pri_usuario_rol_sistema.fk_sistema = cat_sistema.id_sistema)
            INNER JOIN bd_seguridad_sistemas.cat_rol ON (pri_usuario_rol_sistema.fk_rol = cat_rol.id_rol)
<<<<<<< HEAD
            inner join siga_administrativo.pri_foto on (siga_administrativo.pri_foto.fk_emp_empleado = bd_seguridad_sistemas.cat_usuario.enlace)
=======
            INNER JOIN siga_administrativo.pri_foto ON (siga_administrativo.pri_foto.fk_emp_empleado = bd_seguridad_sistemas.cat_usuario.enlace)
>>>>>>> origin/ServicioSocial
            WHERE email = ?
            AND password = ?
            AND cat_usuario.activo = 1
            AND cat_sistema.id_sistema = 2";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Email);
            $stmt->bindValue(2, $PassEncryp);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function CambiarPassword($idEmpleado,$Email, $Password)
        {
            $conectar = parent::conexion("seguridad");
            parent::set_names();

            $PassEncryp = md5($Email) . hash('sha256', $Password);
            $sql = "UPDATE cat_usuario 
                    SET 
                        PASSWORD =?
                    WHERE id_usuario = ?";



            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $PassEncryp);
            $stmt->bindValue(2, $idEmpleado);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function Miperfil($Enlace)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT  id_emp_empleado, 
                           emp_nombres AS Nombre, 
                           emp_paterno AS Paterno, 
                           emp_materno AS Materno, 
                           emp_curp AS Curp, 
                           emp_rfc AS Rfc,
                           emp_correoper AS Correo,
                           emp_telmovil AS Telefono,
                           civ_descripcion AS Civil,
                           san_descripcion AS Sangre,
                           emp_domicilio AS Domicilio,
                           emp_cp_sat AS CP_SAT,
                           col_postal AS CP
                         FROM pri_empleado 
                         INNER JOIN cat_civil ON fk_civ_civil = id_civ_civil 
                         INNER JOIN cat_sangre ON fk_san_sangre = id_san_sangre
                         INNER JOIN cat_colonia ON fk_col_colonia =id_col_colonia
                         WHERE id_emp_empleado=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function DatosLaborales($Enlace)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT id_emp_empleado, 
			               pre_descripcion,
                           CONVERT(CONCAT(pre_descripcion, ' ', emp_nombres, ' ', emp_paterno, ' ', emp_materno) USING utf8) AS Empleado, 
                           emp_curp AS Curp, 
                           emp_enlace AS Enlace, 
                           pla_numero AS Plaza, 
                           cat_nombre AS Categoria, 
                           ads_descripcion AS 'Area_de_Adscripcion' , 
                           id_pla_plantilla,
                           ban_descripcion AS Banco,
                           emp_cuenta,
                           emp_clabe,
                           emp_ingresogobierno AS Fecha_alta,
                           emp_altass,
                           emp_numeross
                         FROM pri_empleado 
                         INNER JOIN pri_plantilla p ON p.fk_emp_empleado = id_emp_empleado 
                         INNER JOIN pri_plaza ON fk_pla_plaza = id_pla_plaza 
                         INNER JOIN pri_adscripcion ON fk_ads_adscripcion = id_ads_adscripcion 
                         INNER JOIN pri_categoria ON fk_cat_categoria = id_cat_categoria 
                         INNER JOIN cat_prefijo ON fk_pre_prefijo = id_pre_prefijo 
                         INNER JOIN cat_banco ON id_ban_banco = fk_ban_banco
                         WHERE id_emp_empleado=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
        
        public function DatosAcademicos($Enlace)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

            $sql = "SELECT 
                        esc_descripcion as ESCOLARIDAD, 
                        pro_descripcion as PROFESION, 
                        rec_descripcion as DOCUMENTO, 
                        aca_generacion as AÑO 
                    FROM pri_academica 
                    join cat_profesion on fk_pro_profesion=id_pro_profesion 
                    join cat_escolaridad on fk_esc_escolaridad=id_esc_escolaridad 
                    join cat_reconocimiento on fk_rec_reconocimiento = id_rec_reconocimiento
                    where aca_activa=1 and fk_emp_empleado=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function DatosGenerales($Enlace)
        {
            $conectar = parent::conexion("siga");
            parent::set_names();

           /* $sql = "SELECT fot_foto AS Foto 
                    FROM pri_foto 
                    WHERE fk_emp_empleado=?";*/

                 $sql = "SELECT fot_foto AS Foto 
                    FROM pri_foto 
                    WHERE fk_emp_empleado=?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

    }
?>
