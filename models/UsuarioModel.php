<?php
    class Usuario extends Conectar
    {
        public function CambiarPassword($idEmpleado,$Email, $Password)
        {
            $conectar = parent::conexion("portal_empleado");
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
                        emp_enlace,	 
                        emp_nombres, 
                        emp_paterno, 
                        emp_materno, 
                        emp_curp, 
                        emp_rfc,
                        sex_descripcion,
                        emp_domicilio,
                        MUN.mun_nombre as mun_domicilio,
                        col_descripcion,
                        emp_telpart,
                        civ_descripcion,
                        san_descripcion,
                        nac_descripcion,
                        emp_correoper,
                        MN.mun_nombre AS mun_nacimiento,
                        emp_cp_sat,
                        col_postal,
                        pre_descripcion,
                        pla_numero
                        cat_nombre,
                        ads_descripcion,
                        ban_descripcion,
                        emp_cuenta,
                        emp_clabe,
                        emp_ingresogobierno,
                        emp_altass,
                        emp_numeross,
                        viv_descripcion,
                        pla_numero
                    FROM pri_empleado 
                    INNER JOIN cat_civil ON fk_civ_civil = id_civ_civil 
                    INNER JOIN cat_sangre ON fk_san_sangre = id_san_sangre
                    INNER JOIN cat_Sexo ON fk_sex_sexo = id_sex_sexo
                    INNER JOIN cat_municipio MUN ON fk_mun_municipio = MUN.id_mun_municipio
                    INNER JOIN cat_nacionalidad ON fk_nac_nacionalidad = id_nac_nacionalidad
                    INNER JOIN cat_municipio MN ON fk_mun_nacimiento = MN.id_mun_municipio
                    INNER JOIN cat_colonia ON fk_col_colonia = id_col_colonia
                    INNER JOIN cat_vivienda ON fk_viv_vivienda = id_viv_vivienda
                    INNER JOIN pri_plantilla p ON p.fk_emp_empleado = id_emp_empleado 
                    INNER JOIN pri_plaza ON fk_pla_plaza = id_pla_plaza 
                    INNER JOIN pri_adscripcion ON fk_ads_adscripcion = id_ads_adscripcion 
                    INNER JOIN pri_categoria ON fk_cat_categoria = id_cat_categoria 
                    INNER JOIN cat_prefijo ON fk_pre_prefijo = id_pre_prefijo 
                    INNER JOIN cat_banco ON id_ban_banco = fk_ban_banco
                    WHERE emp_enlace=?";


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

        public function Todos()
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT * FROM cat_usuario";

            $stmt = $conectar->prepare($sql);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function DetallesUsuarioXid($Enlace)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT * FROM cat_usuario WHERE enlace = ?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function ListaDePermisosDeSistemas($Enlace)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT 
                    Enlace_rol_sistema,
                    fk_rol,
                    fk_sistema,
                    fecha_asignacion,
                    activo,
                    rol,
                    alias
                FROM pri_usuario_rol_sistema
                INNER JOIN cat_rol ON fk_rol = id_rol
                INNER JOIN cat_sistema ON fk_sistema = id_sistema 
                WHERE Enlace_rol_sistema=?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function ListaDePermisosExtras($Enlace)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT 
                        fk_permiso_extra,
                        fk_enlace_user,
                        fk_sistema_permiso,
                        permiso_extra,
                        fecha_asigancion_permiso,
                        activo_permiso_extra,
                        alias
                    FROM pri_permisoextra_usuario_sistema
                    INNER JOIN cat_permiso_extra ON fk_sistema_permiso = id_permiso_extra
                    INNER JOIN cat_sistema ON fk_sistema_permiso = id_sistema
                    WHERE fk_enlace_user=?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $Enlace);
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }

        public function BuscarUsuarios($query) 
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT enlace, CONCAT(nombres, ' ', paterno, ' ', materno) AS nombre_completo
                    FROM cat_usuario
                    WHERE nombres LIKE ? OR paterno LIKE ? OR email LIKE ?
                    LIMIT 10";

            $stmt = $conectar->prepare($sql);
            $searchTerm = "%$query%";
            $stmt->bindParam(1, $searchTerm);
            $stmt->bindParam(2, $searchTerm);
            $stmt->bindParam(3, $searchTerm);
            $stmt->execute();

            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

    }
?>
