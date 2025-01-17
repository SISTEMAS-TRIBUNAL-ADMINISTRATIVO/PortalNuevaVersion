CREATE TABLE cat_tipo_notificacion 
(
    idtiponotificacion INT(10) AUTO_INCREMENT PRIMARY KEY,
    Nombre_notificcion VARCHAR(100) NOT NULL,
    comentarios_tiponotificacion VARCHAR(100) NOT NULL
);

CREATE TABLE pri_notificacion 
(
    idnotificacion INT(10) AUTO_INCREMENT PRIMARY KEY,
    fk_tipo_notificacion INT(10),
    mensaje_notificacion TEXT,
    imagen_notificacion LONGBLOB,
    fk_usuario_se_notifica INT(10),
    fk_area INT(10),
    fecha_notificacion DATE,
    estado_notificacion int(10),
    FOREIGN KEY (fk_tipo_notificacion) REFERENCES cat_tipo_notificacion(idtiponotificacion)
);

INSERT INTO cat_tipo_notificacion (Nombre_notificcion, comentarios_tiponotificacion)
VALUES 
('Notificación a todo el personal', 'Notificación enviada a todos los empleados'),
('Notificación por áreas', 'Notificación enviada por áreas específicas'),
('Felicitaciones por cumpleaños', 'Notificación para felicitar a los empleados en su cumpleaños'),
('Notificación personal directo', 'Notificación enviada a un empleado de forma directa');