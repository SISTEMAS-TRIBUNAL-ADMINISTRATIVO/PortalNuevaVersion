SET NAMES utf8mb4;
SET COLLATION_CONNECTION = 'utf8mb4_spanish2_ci';

CREATE TABLE cat_tipo_notificacion 
(
    idtiponotificacion INT(10) AUTO_INCREMENT PRIMARY KEY,
    Nombre_notificcion VARCHAR(100) NOT NULL,
    comentarios_tiponotificacion VARCHAR(100) NOT NULL
);



