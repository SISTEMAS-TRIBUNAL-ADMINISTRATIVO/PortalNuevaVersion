SET NAMES utf8mb4;
SET COLLATION_CONNECTION = 'utf8mb4_spanish2_ci';

INSERT INTO cat_usuario
    (nombre, paterno, materno, email, siglas, password, token, enlace, url_declaracion)
VALUES
    ('Diego', 'Gonzalez', 'Carpio','diego@unach.mx','DGC','2a702dfb65f39082850fe3724b67c7255994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','122','122',''),
    ('Administrador', 'Gonzalez', 'Carpio','administrador@unach.mx','AGC','54167e48920aeae223c50d5da855b8c35994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','122','122','');


INSERT INTO pri_usuario_rol_sistema
(fk_usuario, fk_rol, fk_sistema, activo)
    VALUES
    (171, 4, 2,1),
    (172, 3, 2,1);