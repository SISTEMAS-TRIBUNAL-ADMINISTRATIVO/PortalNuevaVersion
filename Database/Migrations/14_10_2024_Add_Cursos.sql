CREATE TABLE cat_cursos_tapje 
(
    id_curso int(10) NOT NULL AUTO_INCREMENT,
    fecha_curso date DEFAULT NULL,
    tema_curso mediumtext,
    ponente_curso mediumtext DEFAULT NULL,
    archivo_curso longblob DEFAULT NULL,
    descripcion_curso mediumtext DEFAULT NULL,
    PRIMARY KEY (id_curso)
) 
