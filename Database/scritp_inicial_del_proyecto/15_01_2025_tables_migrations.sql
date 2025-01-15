SET NAMES utf8mb4;
SET COLLATION_CONNECTION = 'utf8mb4_spanish2_ci';

CREATE TABLE cat_migraciones 
(
    id_migracion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_migracion VARCHAR(255) NOT NULL,
    fecha_de_migracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

