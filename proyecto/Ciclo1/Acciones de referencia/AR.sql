ALTER TABLE PERTENECE_GRUPO DROP CONSTRAINT FK_PERTENECE_GRUPO_USUARIO;
ALTER TABLE PERTENECE_EQUIPO DROP CONSTRAINT FK_PERTENECE_EQUIPO_USUARIO;
ALTER TABLE COMENTARIOS DROP CONSTRAINT FK_COMENTARIOS_USUARIO;

ALTER TABLE PERTENECE_GRUPO ADD CONSTRAINT FK_PERTENECE_GRUPO_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(USERNAME) ON DELETE CASCADE;
ALTER TABLE PERTENECE_EQUIPO ADD CONSTRAINT FK_PERTENECE_EQUIPO_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(USERNAME) ON DELETE CASCADE;
ALTER TABLE COMENTARIOS ADD CONSTRAINT FK_COMENTARIOS_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIOS(USERNAME) ON DELETE CASCADE;