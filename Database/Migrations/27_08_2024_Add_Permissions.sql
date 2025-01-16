ALTER TABLE bd_seguridad_sistemas.cat_permiso
    DROP COLUMN descripcion,
    DROP COLUMN activo_permiso;


ALTER TABLE bd_seguridad_sistemas.cat_permiso 
    ADD COLUMN permiso_padre INT(10) DEFAULT 0,
    ADD COLUMN url_permiso VARCHAR(100) DEFAULT NULL,
    ADD COLUMN icon VARCHAR(100) DEFAULT NULL;


INSERT INTO bd_seguridad_sistemas.cat_permiso
    (permiso, permiso_padre, url_permiso,icon)
VALUES
    ('Resguardos', 0, '',''),
    ('Calendario', 0, '',''),
    ('Ayuda y soporte tecnico', 0, '',''),
    ('Token', 0, '',''),
    ('Avisos', 0, '',''),
    ('Datos Personales', 10, '',''),
    ('Datos Laborales', 10, '',''),
    ('Ver Nóminas', 20, '',''),
    ('Mis declaraciones', 21, '',''),
    ('Equipos informáticos', 25, '',''),
    ('Mobiliario', 25, '',''),
    ('Avisos Calendario', 26, '',''),
    ('Sugerencias del sistema', 27, '',''),
    ('Reportar un error', 27, '',''),
    ('Solicitar asistencia tecnica', 27, '',''),
    ('Todos los usuarios', 9, '',''),      
    ('Registro portal empleado', 28, '',''),
    ('Registro sistema de sentencias', 28, '',''),
    ('Lista de Avisos', 29, '',''),
    ('Notificaciones', 29, '',''),
    ('Informática', 0, '',''),
    ('Ip equipos informaticos', 45, '','');

INSERT INTO bd_seguridad_sistemas.pri_sistema_rol_permiso
    (fk_sistema, fk_rol, fk_permiso)
VALUES
    (2, 4, 10),
    (2, 4, 25),
    (2, 4, 26),
    (2, 4, 27),
    (2, 3, 10),
    (2, 3, 25),
    (2, 3, 26),
    (2, 3, 27),
    (2, 3, 9),
    (2, 3, 28),
    (2, 3, 29),
    (2, 3, 45);





