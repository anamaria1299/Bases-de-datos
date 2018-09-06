CREATE TABLE zonas(zona VARCHAR(10)NOT NULL,incidente NUMBER(5)NOT NULL);
CREATE TABLE es_causa(cod_incidente NUMBER(5) NOT NULL, aci_incidente NUMBER(5) NOT NULL);
CREATE TABLE tiene(numero NUMBER(5)NOT NULL,codigo VARCHAR(3) NOT NULL);
CREATE TABLE investigacion(area CHAR(1),fecha DATE NULL,objetivo VARCHAR(5),impacto NUMBER(1) ,accidente NUMBER(5) NOT NULL,profesor NUMBER(5));
CREATE table es_resultado(accidente NUMBER(5)NOT NULL,codigo VARCHAR(3)NOT NULL,explica NUMBER(3));
CREATE TABLE riesgo(codigo varchar(3) NOT NULL,nombre varchar(20),probabilidad NUMBER(3));
CREATE TABLE condiciones(riesgo NUMBER(1) ,incidentes NUMBER(5) NOT NULL);
CREATE TABLE accidentes(estado CHAR(2) ,investigado NUMBER(3),detalle varchar(100) NULL,incidente NUMBER(5) NOT NULL);
CREATE TABLE incidentes(numero NUMBER(5) NOT NULL,fecha DATE, descripcion VARCHAR(200));
CREATE TABLE esta_involucrado(consecuencia VARCHAR(50),codigo NUMBER(5)NOT NULL,accidente NUMBER(5)NOT NULL);
CREATE TABLE administrativo(contrato CHAR(1),codigo NUMBER(5)NOT NULL);
CREATE TABLE estudiantes(codigo NUMBER(5) NOT NULL,semestre NUMBER(2),profesor NUMBER(5) NULL);
CREATE TABLE profesores(formacion VARCHAR(10),codigo NUMBER(5)NOT NULL);
CREATE TABLE areas(area CHAR(1)NOT NULL,codigo NUMBER(5)NOT NULL);
CREATE TABLE personas(codigo NUMBER(5)NOT NULL,nombre VARCHAR(50),correo VARCHAR(50)NOT NULL);
CREATE TABLE causas(codigo VARCHAR(3)NOT NULL,tipo VARCHAR(30) ,nombre VARCHAR(50));

/*poblar*/
INSERT INTO incidentes VALUES (001,TO_DATE('2001/07/12','yyyy/mm/dd'),'caida de un arbol en el campus');
INSERT INTO incidentes VALUES (002,TO_DATE('2005/09/20','yyyy/mm/dd'),'accidente en el edificio de la parte administrativa');
INSERT INTO incidentes VALUES (003,TO_DATE('2016/10/17','yyyy/mm/dd'),'ventas ilegales en el campus');

INSERT INTO zonas VALUES ('zona 1',001);
INSERT INTO zonas VALUES ('zona 1',002);
INSERT INTO zonas VALUES ('zona 4',001);

INSERT INTO accidentes VALUES ('AR',20,null,003);
INSERT INTO accidentes VALUES ('RI',50,'fuertes lluvias',001);
INSERT INTO accidentes VALUES ('EI',6,null,002);

INSERT INTO personas VALUES (1001,'Santiago Rocha','santiago.rocha@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1002,'Santiago Bermudez','santiago.bermudez@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1003,'Santiago Rocha Duran','santiago.rocha-d@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1004,'John David Ibañez','david.ibanez@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1005,'Ana Maria Rincon','Ana.rincon@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1006,'Yohanna Toro','yohanna.toro@mail.escuelaing.edu.co');

INSERT INTO administrativo VALUES ('F',1001);
INSERT INTO administrativo VALUES ('I',1004);
INSERT INTO administrativo VALUES ('F',1006);

INSERT INTO profesores VALUES ('Maestria',1001);
INSERT INTO profesores VALUES ('Doctorado',1006);
INSERT INTO profesores VALUES ('Posgrado',1004);

INSERT INTO areas VALUES ('P',1006);
INSERT INTO areas VALUES ('I',1006);
INSERT INTO areas VALUES ('C',1004);

INSERT INTO estudiantes VALUES (1002,9,null);
INSERT INTO estudiantes VALUES (1003,5,1006);
INSERT INTO estudiantes VALUES (1005,1,null);

INSERT INTO causas VALUES ('101','Incidente grave','condiciones ambientales');
INSERT INTO causas VALUES ('102','Estado laboral','conflictos laborales');
INSERT INTO causas VALUES ('103','Incidente grave','bienestar universitario');

INSERT INTO tiene VALUES (001,'101');
INSERT INTO tiene VALUES (002,'102');
INSERT INTO tiene VALUES (003,'103');

INSERT INTO condiciones VALUES (4,001);
INSERT INTO condiciones VALUES (5,003);
INSERT INTO condiciones VALUES (3,002);

INSERT INTO es_causa VALUES (001,001);
INSERT INTO es_causa VALUES (002,002);
INSERT INTO es_causa VALUES (003,003);

INSERT INTO investigacion VALUES ('I',null,'URG',3,001,1001);
INSERT INTO investigacion VALUES ('P',TO_DATE('2001/07/12','yyyy/mm/dd'),'URGE',5,003,1006);
INSERT INTO investigacion VALUES ('C',null,'IMP',2,002,1004);

INSERT INTO riesgo VALUES ('010','Accidente estudiante',40);
INSERT INTO riesgo VALUES ('020','Disturbios',20);
INSERT INTO riesgo VALUES ('030','Meteorológicos',60);

INSERT INTO es_resultado VALUES (001,'030',100);
INSERT INTO es_resultado VALUES (002,'010',099);
INSERT INTO es_resultado VALUES (003,'020',098);

INSERT INTO esta_involucrado VALUES ('lesion',1001,002);
INSERT INTO esta_involucrado VALUES ('Sancion',1003,003);
INSERT INTO esta_involucrado VALUES ('Un estudiante lesionado',1006,001);

/*poblar no ok*/

INSERT INTO personas VALUES('Str',1,0);/*El atributo codigo es NUMBER, nombre VARCHAR igualmente correo*/
INSERT INTO areas VALUES(NULL,NULL);/*Los atributos de 'areas' tienen que ser NOT NULL*/
INSERT INTO riesgo VALUES(NULL,NULL,3);/*El atributo codigo de riesgo es un VARCHAR no un NUMBER*/
INSERT INTO tiene VALUES(null,null);/*Los atributos de 'tiene' tienen que ser NOT NULL*/
INSERT INTO causas VALUES('*',#,NULL);/*El atributo tipo es varchar de 'causas'*/

INSERT INTO personas VALUES(12346,'John David','John@gmail.com');/*El correo no lleva mail.escuela.ing.edu.co*/
INSERT INTO personas VALUES(12346,'Ana Maria','Ana@hotmail.com');/*El codigo de Ana Maria es el mismo que John David,Codigo es PK*/
INSERT INTO investigacion VALUES('X',TO_DATE('1991/01/01','yyyy/mm/dd'),'Impot',1,10241,12314);/*El tipo de area X no esta definida*/
INSERT INTO administrativo VALUES('M',21445);/*El contrato 'M' no esta definido*/
INSERT INTO causas VALUES('AAA','No comienza con E ni I','John David');

/*despoblar*/

DELETE FROM personas;
DELETE FROM incidentes;
DELETE FROM investigacion;
DELETE FROM accidentes;
DELETE FROM administrativo;
DELETE FROM areas;
DELETE FROM causas;
DELETE FROM condiciones;
DELETE FROM es_causa;
DELETE FROM es_resultado;
DELETE FROM esta_involucrado;
DELETE FROM estudiantes;
DELETE FROM profesores;
DELETE FROM riesgo;
DELETE FROM tiene;
DELETE FROM zonas;

/*Atributos*/

ALTER TABLE personas MODIFY (correo CHECK(correo LIKE '%escuelaing.edu.co' ));
ALTER TABLE causas MODIFY (tipo CHECK(tipo LIKE 'E%' OR tipo LIKE 'I%'));
ALTER TABLE areas MODIFY(area CHECK (area='I' OR area='P' OR area='C' ));
ALTER TABLE estudiantes MODIFY (semestre CHECK(semestre>=1));
ALTER TABLE administrativo MODIFY(contrato CHECK(contrato='F' OR contrato ='I'));
ALTER TABLE accidentes MODIFY (investigado CHECK(investigado>-1 AND investigado<101));
ALTER TABLE accidentes MODIFY(estado CHECK (estado = 'AR' OR estado='EI' OR estado='RI'));
ALTER TABLE incidentes MODIFY(numero CHECK (numero>0));
ALTER TABLE condiciones MODIFY (riesgo CHECK(riesgo<6 AND riesgo>0));
ALTER TABLE investigacion MODIFY (area  CHECK (area='I' OR area='P' OR area='C'));
ALTER TABLE investigacion MODIFY(impacto CHECK(impacto<6 AND impacto>0));
ALTER TABLE riesgo MODIFY (probabilidad CHECK(probabilidad>-1 AND probabilidad<101));
ALTER TABLE es_resultado MODIFY (explica CHECK(explica>-1 AND explica<101));
/*ALTER TABLE es_causa MODIFY(cod_incidente CHECK (cod_incidente > 0));
ALTER TABLE es_causa MODIFY(aci_incidente CHECK (aci_incidente > 0));*/
ALTER TABLE zonas MODIFY (zona CHECK(zona LIKE '% %'));

/*PK*/

ALTER TABLE incidentes ADD CONSTRAINT PK_incidentes PRIMARY KEY(numero);
ALTER TABLE zonas ADD CONSTRAINT PK_zonas PRIMARY KEY(zona,incidente);
ALTER TABLE condiciones ADD CONSTRAINT PK_condiciones PRIMARY KEY(incidentes);
ALTER TABLE tiene ADD CONSTRAINT PK_tiene PRIMARY KEY(numero,codigo);
ALTER TABLE causas ADD CONSTRAINT PK_causa PRIMARY KEY(codigo);
ALTER TABLE accidentes ADD CONSTRAINT PK_accidente PRIMARY KEY(incidente);
ALTER TABLE es_causa ADD CONSTRAINT PK_esCausa PRIMARY KEY(cod_incidente,aci_incidente);
ALTER TABLE es_resultado ADD CONSTRAINT PK_esResultado PRIMARY KEY(codigo,accidente); 
ALTER TABLE esta_involucrado ADD CONSTRAINT PK_estaInvolucrado PRIMARY KEY(codigo,accidente);
AlTER TABLE administrativo ADD CONSTRAINT PK_administrativo PRIMARY KEY(codigo);
ALTER TABLE personas ADD CONSTRAINT PK_personas PRIMARY KEY(codigo);
ALTER TABLE investigacion ADD CONSTRAINT PK_investigacion PRIMARY KEY(accidente);
ALTER TABLE riesgo ADD CONSTRAINT PK_riesgo PRIMARY KEY(codigo);
ALTER TABLE areas ADD CONSTRAINT PK_areas PRIMARY KEY(area,codigo);
ALTER TABLE estudiantes ADD CONSTRAINT PK_estudiantes PRIMARY KEY(codigo);
ALTER TABLE profesores ADD CONSTRAINT PK_profesores PRIMARY KEY(codigo);

/*UK*/
  
ALTER TABLE investigacion ADD CONSTRAINT UK_investigacion UNIQUE (objetivo);
ALTER TABLE personas ADD CONSTRAINT UK_personas UNIQUE (correo);

/*FK*/

ALTER TABLE tiene ADD CONSTRAINT FK_numero FOREIGN KEY (numero) 
REFERENCES incidentes(numero);
ALTER TABLE tiene ADD CONSTRAINT FK_codigo FOREIGN KEY(codigo)
REFERENCES causas(codigo);
ALTER TABLE zonas ADD CONSTRAINT FK_incidentes FOREIGN KEY(incidente)
REFERENCES incidentes(numero);
ALTER TABLE condiciones ADD CONSTRAINT FK_incidente_condic FOREIGN KEY(incidentes)
REFERENCES incidentes(numero);
ALTER TABLE es_causa ADD CONSTRAINT FK_codigoincidente FOREIGN KEY(cod_incidente)
REFERENCES condiciones(incidentes);
ALTER TABLE es_causa ADD CONSTRAINT FK_acincidente FOREIGN KEY(aci_incidente)
REFERENCES accidentes(incidente);
ALTER TABLE accidentes ADD CONSTRAINT FK_accincidentes FOREIGN KEY(incidente) 
REFERENCES incidentes(numero);
ALTER TABLE es_resultado ADD CONSTRAINT FK_resulcodigo FOREIGN KEY(codigo)
REFERENCES riesgo(codigo);
ALTER TABLE es_resultado ADD CONSTRAINT FK_resaccidente FOREIGN KEY(accidente)
REFERENCES investigacion(accidente);
ALTER TABLE investigacion ADD CONSTRAINT FK_accidente FOREIGN KEY(accidente)
REFERENCES accidentes(incidente);
ALTER TABLE investigacion ADD CONSTRAINT FK_invprofesor FOREIGN KEY(profesor)
REFERENCES profesores(codigo);
ALTER TABLE profesores ADD CONSTRAINT FK_profesor FOREIGN KEY(codigo)
REFERENCES administrativo(codigo);
ALTER TABLE esta_involucrado ADD CONSTRAINT FK_adminis FOREIGN KEY(codigo)
REFERENCES personas(codigo);
ALTER TABLE esta_involucrado ADD CONSTRAINT FK_adminisacc FOREIGN KEY(accidente)
REFERENCES accidentes(incidente);
ALTER TABLE administrativo ADD CONSTRAINT FK_peradmin FOREIGN KEY(codigo)
REFERENCES personas(codigo);
ALTER TABLE estudiantes ADD CONSTRAINT FK_estcodigo FOREIGN KEY(codigo)
REFERENCES personas(codigo);
ALTER TABLE estudiantes ADD CONSTRAINT FK_estprofesor FOREIGN KEY(profesor)
REFERENCES profesores(codigo);
ALTER TABLE areas ADD CONSTRAINT FK_area FOREIGN KEY(codigo)
REFERENCES profesores(codigo);

/*CONSTRUCCION PROTEGIDA*/
/*
INSERT INTO personas VALUES(12346,'John David','John@gmail.com');
ALTER TABLE personas MODIFY (correo CHECK(correo LIKE '%escuelaing.edu.co' ));

INSERT INTO personas VALUES(12346,'Ana Maria','Ana@hotmail.com');
ALTER TABLE personas MODIFY (correo CHECK(correo LIKE '%escuelaing.edu.co' ));

INSERT INTO investigacion VALUES('X',TO_DATE('1991/01/01','yyyy/mm/dd'),'Impot',1,10241,12314);
ALTER TABLE investigacion MODIFY (area  CHECK (area='I' OR area='P' OR area='C'));

INSERT INTO administrativo VALUES('M',21445);
ALTER TABLE administrativo MODIFY(contrato CHECK(contrato='F' OR contrato ='I'));

INSERT INTO causas VALUES('AAA','No comienza con E ni I','John David');
ALTER TABLE causas MODIFY (tipo CHECK(tipo LIKE 'E%' OR tipo LIKE 'I%'));

*/

/*restricciones de pk
INSERT INTO incidentes VALUES (001,TO_DATE('2001/07/12','yyyy/mm/dd'),'caida de un arbol en el campus');
INSERT INTO incidentes VALUES (001,TO_DATE('2001/07/12','yyyy/mm/dd'),'caida de un arbol en el campus');

INSERT INTO personas VALUES (1002,'Santiago Bermudez','santiago.bermudez@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1002,'Santiago Bermudez','santiago.bermudez@mail.escuelaing.edu.co');
*/


/*restricciones null
INSERT INTO zonas VALUES(NULL,NULL);
*/
/*restricciones CK
INSERT INTO zonas VALUES ('zona1',001);
ALTER TABLE zonas MODIFY (zona CHECK(zona LIKE '% %'));


ALTER TABLE riesgo MODIFY (probabilidad CHECK(probabilidad>-1 AND probabilidad<101));
INSERT INTO riesgo VALUES(1,'Ramiro',200);
*/


/*POBLAR OK1*/
INSERT INTO incidentes VALUES (001,TO_DATE('2001/07/12','yyyy/mm/dd'),'caida de un arbol en el campus');
INSERT INTO incidentes VALUES (002,TO_DATE('2005/09/20','yyyy/mm/dd'),'accidente en el edificio de la parte administrativa');
INSERT INTO incidentes VALUES (003,TO_DATE('2016/10/17','yyyy/mm/dd'),'ventas ilegales en el campus');

INSERT INTO zonas VALUES ('zona 1',001);
INSERT INTO zonas VALUES ('zona 1',002);
INSERT INTO zonas VALUES ('zona 4',001);

INSERT INTO accidentes VALUES ('AR',20,null,003);
INSERT INTO accidentes VALUES ('RI',50,'fuertes lluvias',001);
INSERT INTO accidentes VALUES ('EI',6,null,002);

INSERT INTO personas VALUES (1001,'Alejo Rocha','Alejo.rocha@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1002,'Javier Bermudez','javier.bermudez@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1003,'Andres  Duran','andres.duran@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1004,'David Rodriguez','david.rodriguez@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1005,'Maria Casallas','maria.casallas@mail.escuelaing.edu.co');
INSERT INTO personas VALUES (1006,'Andrea Toro','andrea.toro@mail.escuelaing.edu.co');

INSERT INTO administrativo VALUES ('I',1001);
INSERT INTO administrativo VALUES ('I',1004);
INSERT INTO administrativo VALUES ('F',1006);

INSERT INTO profesores VALUES ('Doctorado',1001);
INSERT INTO profesores VALUES ('Maestria',1006);
INSERT INTO profesores VALUES ('Posgrado',1004);

INSERT INTO areas VALUES ('P',1006);
INSERT INTO areas VALUES ('I',1001);
INSERT INTO areas VALUES ('C',1004);

INSERT INTO estudiantes VALUES (1002,9,null);
INSERT INTO estudiantes VALUES (1003,5,1006);
INSERT INTO estudiantes VALUES (1005,1,null);

INSERT INTO causas VALUES ('101','Incidente leve','condiciones ambientales');
INSERT INTO causas VALUES ('102','Estado estudiantil','conflictos laborales');
INSERT INTO causas VALUES ('103','Incidente grave','bienestar universitario');

INSERT INTO tiene VALUES (001,'101');
INSERT INTO tiene VALUES (002,'102');
INSERT INTO tiene VALUES (003,'103');

INSERT INTO condiciones VALUES (4,001);
INSERT INTO condiciones VALUES (5,003);
INSERT INTO condiciones VALUES (3,002);

INSERT INTO es_causa VALUES (001,001);
INSERT INTO es_causa VALUES (002,002);
INSERT INTO es_causa VALUES (003,003);

INSERT INTO riesgo VALUES ('010','Accidente profesor',40);
INSERT INTO riesgo VALUES ('020','Disturbios',20);
INSERT INTO riesgo VALUES ('030','Meteorológicos',60);

INSERT INTO esta_involucrado VALUES ('lesion',1001,002);
INSERT INTO esta_involucrado VALUES ('Sancion',1003,003);
INSERT INTO esta_involucrado VALUES ('Un estudiante lesionado',1006,001); 

INSERT INTO investigacion VALUES ('I',null,'URGEN',3,001,1001);
INSERT INTO investigacion VALUES ('P',TO_DATE('2001/07/12','yyyy/mm/dd'),'URG',5,003,1006);
INSERT INTO investigacion VALUES ('C',null,'IMPOR',2,002,1004);

INSERT INTO es_resultado VALUES (001,'030',100);
INSERT INTO es_resultado VALUES (002,'010',099);
INSERT INTO es_resultado VALUES (003,'020',098);

/*consutas*/

SELECT zona,descripcion FROM zonas,incidentes 
WHERE numero= incidente;

SELECT riesgo,descripcion FROM incidentes,condiciones
WHERE incidentes= numero;

SELECT nombre,probabilidad FROM riesgo
ORDER BY probabilidad;

SELECT numero,incidentes.FECHA,area,objetivo,explica
FROM investigacion,accidentes,incidentes,es_resultado 
WHERE  accidentes.INCIDENTE= investigacion.ACCIDENTE AND incidentes.NUMERO= accidentes.INCIDENTE
       AND es_resultado.ACCIDENTE= investigacion.ACCIDENTE
ORDER BY (explica) DESC;



/*BORRAR TABLAS*/
DROP TABLE zonas CASCADE CONSTRAINTS;
DROP TABLE es_causa CASCADE CONSTRAINTS;
DROP TABLE tiene CASCADE CONSTRAINTS;
DROP TABLE investigacion CASCADE CONSTRAINTS;
DROP TABLE es_resultado CASCADE CONSTRAINTS;
DROP TABLE riesgo CASCADE CONSTRAINTS;
DROP TABLE condiciones CASCADE CONSTRAINTS;
DROP TABLE accidentes CASCADE CONSTRAINTS;
DROP TABLE incidentes CASCADE CONSTRAINTS;
DROP TABLE esta_involucrado CASCADE CONSTRAINTS;
DROP TABLE administrativo CASCADE CONSTRAINTS;
DROP TABLE estudiantes CASCADE CONSTRAINTS;
DROP TABLE profesores CASCADE CONSTRAINTS;
DROP TABLE areas CASCADE CONSTRAINTS;
DROP TABLE personas CASCADE CONSTRAINTS;
DROP TABLE causas CASCADE CONSTRAINTS;









