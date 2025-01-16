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
