ALTER TABLE pri_notificacion 
    ADD COLUMN fk_user_crea INT(10),
    ADD COLUMN fk_area_crea INT(10),
    ADD COLUMN fecha_programado DATE;