CREATE TABLE cat_formatos_informatica_tapje 
(
    id_formato int(10) NOT NULL AUTO_INCREMENT,
    fecha_formato date DEFAULT NULL,
    nombre mediumtext,
    archivo_formato longblob DEFAULT NULL,
    extencion_formato mediumtext DEFAULT NULL,
    PRIMARY KEY (id_formato)
) 