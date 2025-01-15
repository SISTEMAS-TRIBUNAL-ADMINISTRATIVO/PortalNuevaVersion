SET NAMES utf8mb4;
SET COLLATION_CONNECTION = 'utf8mb4_spanish2_ci';

CREATE TABLE cat_tipo_notificacion 
(
    idtiponotificacion INT(10) AUTO_INCREMENT PRIMARY KEY,
    Nombre_notificcion VARCHAR(100) NOT NULL,
    comentarios_tiponotificacion VARCHAR(100) NOT NULL
);


INSERT INTO cat_tipo_notificacion (Nombre_notificcion, comentarios_tiponotificacion)
VALUES 
('Notificación a todo el personal', 'Notificación enviada a todos los empleados'),
('Notificación por áreas', 'Notificación enviada por áreas específicas'),
('Felicitaciones por cumpleaños', 'Notificación para felicitar a los empleados en su cumpleaños'),
('Notificación personal directo', 'Notificación enviada a un empleado de forma directa');



