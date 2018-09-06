CREATE TABLE zonas(zona VARCHAR(10)NOT NULL,incidente NUMBER(5)NOT NULL);
CREATE TABLE es_causa(cod_incidente NUMBER(5) NOT NULL, aci_incidente NUMBER(5) NOT NULL);
CREATE TABLE tiene(numero NUMBER(5)NOT NULL,codigo VARCHAR(3) NOT NULL);
CREATE TABLE investigacion(area CHAR(1) NOT NULL,fecha DATE NULL,objetivo VARCHAR(5) NOT NULL,impacto NUMBER(1) NOT NULL ,accidente NUMBER(5) NOT NULL,profesor NUMBER(5) NOT NULL);
CREATE table es_resultado(accidente NUMBER(5)NOT NULL,codigo VARCHAR(3)NOT NULL,explica NUMBER(3) NOT NULL);
CREATE TABLE riesgo(codigo varchar(3) NOT NULL,nombre varchar(20) NOT NULL,probabilidad NUMBER(3) NOT NULL);
CREATE TABLE condiciones(riesgo NUMBER(1) NOT NULL,incidentes NUMBER(5) NOT NULL);
CREATE TABLE accidentes(estado CHAR(2) NOT NULL,investigado NUMBER(3) NOT NULL,detalle varchar(100) NULL,incidente NUMBER(5) NOT NULL);
CREATE TABLE incidentes(numero NUMBER(5) NOT NULL,fecha DATE NOT NULL, descripcion VARCHAR(200) NOT NULL);
CREATE TABLE esta_involucrado(consecuencia VARCHAR(50) NOT NULL,codigo NUMBER(5)NOT NULL,accidente NUMBER(5)NOT NULL);
CREATE TABLE administrativo(contrato CHAR(1) NOT NULL,codigo NUMBER(5)NOT NULL);
CREATE TABLE estudiantes(codigo NUMBER(5) NOT NULL,semestre NUMBER(2) NOT NULL,profesor NUMBER(5) NULL);
CREATE TABLE profesores(formacion VARCHAR(10) NOT NULL,codigo NUMBER(5)NOT NULL);
CREATE TABLE areas(area CHAR(1)NOT NULL,codigo NUMBER(5)NOT NULL);
CREATE TABLE personas(codigo NUMBER(5)NOT NULL,nombre VARCHAR(50) NOT NULL,correo VARCHAR(50)NOT NULL);
CREATE TABLE causas(codigo VARCHAR(3)NOT NULL,tipo VARCHAR(30) NOT NULL,nombre VARCHAR(50) NOT NULL);

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
ALTER TABLE investigacion ADD CONSTRAINT PK_investigacion PRIMARY KEY(accidente,profesor);
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


/*El correo tiene que contener el nombre*/
CREATE OR REPLACE TRIGGER T0
BEFORE INSERT ON personas
FOR EACH ROW
DECLARE xCorreo varchar(50);
Existe NUMBER;
BEGIN
	xCorreo := CONCAT((REPLACE(TRIM(:new.nombre),' ','.')),'@escuelaing.edu.co');
  SELECT count(*) INTO  Existe from personas WHERE xCorreo=correo;
  IF Existe=0   THEN 
     :new.correo := xCorreo;
  ELSE
    RAISE_APPLICATION_ERROR(-20986,'No se puede ingreasar un correo asociado  a su nombre, ya existe');
  END IF;  
END;

/*ok*/
INSERT INTO personas(codigo,nombre) VALUES(10401,'Joh Ibañez');
/*NO OK*/
INSERT INTO personas(codigo,nombre) VALUES(10501,'Joh Ibañez');

/*LAB 04
PUNTO 1:
	(1)Revise su modelo lógico y perfecciónenlo. ¿Cuáles fueron los cambios realizados? 
		Hubo cambios en una clave primaria, en la tabla investigacion.
	(2)Revise el código actual del sistema y perfecciónenlo. ¿Cuáles fueron los cambios realizados?
		Se realizaron cambios en las tablas colocando los valores que no son nulos, cambiando primarias y 
		se coloco un trigger que no se pudo realizar la vez pasada.
*/

/*PUNTO 2:*/

/*GESTIONAR INVESTIGACIONES trigger(automatizacion)
Tener en cuenta que el atributo investigado de los accidentes debe mantenerse actualizado y que
cuanto se logra el 100% en los riesgos asociados a la investigación debe actualizarse inmediatamente
la fecha de fin de la misma*/

CREATE TRIGGER T1
BEFORE INSERT ON es_resultado
FOR EACH ROW
DECLARE sumaT  NUMBER;
BEGIN
  UPDATE accidentes SET investigado = :new.explica + investigado WHERE :new.accidente = accidentes.incidente;
END;

CREATE TRIGGER T2
AFTER UPDATE ON accidentes
FOR EACH ROW
BEGIN
  IF :new.investigado= 100 THEN
    UPDATE investigacion SET fecha= TO_DATE(sysdate,'DD-MM-YYYY') WHERE :old.incidente= investigacion.accidente;
  END IF;
END;
/*OK*/
INSERT INTO es_resultado VALUES (002,'020',054);
INSERT INTO es_resultado VALUES (002,'030',040);
/*NO OK
No hay ya que nunca se genera un error, teniendo como excepcion las resgtricciones de intgridad de las llaver primarias*/

DROP TRIGGER T1;
DROP TRIGGER T2;

/*La adición sólo la puede hacer el Director SST.
El profesor lider debe ser experto en al área de la investigación.*/

CREATE TRIGGER T14
BEFORE INSERT ON investigacion
FOR EACH ROW
DECLARE xarea VARCHAR(1);
BEGIN
  SELECT COUNT(*) INTO xarea FROM profesores,areas WHERE profesores.codigo= areas.codigo AND profesores.codigo= :new.profesor AND area= :new.area;
  IF xarea < 1 THEN
    RAISE_APPLICATION_ERROR(-20034,'No puede tener profesor que no sea experto para el area de investigacion');
  END IF;
END;

/*OK*/ 
INSERT INTO incidentes VALUES (005,TO_DATE('2016/10/17','yyyy/mm/dd'),'ventas');
INSERT INTO accidentes VALUES ('RI',0,'ventas',005);
INSERT INTO investigacion VALUES ('P',null,'IM',1,005,1006);
/*NO OK*/
INSERT INTO incidentes VALUES (006,TO_DATE('2016/10/17','yyyy/mm/dd'),'ventas');
INSERT INTO accidentes VALUES ('RI',0,'ventas',006);
INSERT INTO investigacion VALUES ('C',null,'IMPO',1,006,1006);

DROP TRIGGER T14;

/*El profesor líder actualiza  los resultados de la investigación. NO SE HACE*/

/*No se pueden incluir resultados hasta el que el accidente no esté en investigación. */
CREATE TRIGGER T12
BEFORE INSERT ON es_resultado
FOR EACH ROW
DECLARE xestado VARCHAR(2);
BEGIN
  SELECT estado INTO xestado FROM accidentes WHERE incidente= :new.accidente;
  IF xestado <> 'EI' THEN
    RAISE_APPLICATION_ERROR(-20055,'No se puede insertar resultados en un
                            accidente que no esta en investigación');
  END IF;
END;

INSERT INTO incidentes VALUES (004,TO_DATE('2016/10/17','yyyy/mm/dd'),'ventas');
INSERT INTO accidentes VALUES ('RI',0,'fuertes lluvias',004);
/*ok*/
INSERT INTO es_resultado VALUES (001,'010',050);
INSERT INTO es_resultado VALUES (004,'010',050);
/*No ok*/
INSERT INTO investigacion VALUES ('C',null,'IMP',2,004,1004);
UPDATE accidentes SET estado= 'EI' WHERE incidente= 4;
INSERT INTO es_resultado VALUES (004,'020',020);

DROP TRIGGER T12;

/*Al registrar el primer resultado,  si el porcentaje de este resultado hace que se logre el 100% 
investigado el estado cambia a riesgos investigados.*/
CREATE TRIGGER T13
BEFORE INSERT ON es_resultado
FOR EACH ROW
DECLARE xporce NUMBER;
BEGIN
  SELECT COUNT(*) INTO xporce FROM es_resultado WHERE accidente= :new.accidente;
  IF xporce < 1 AND :new.explica = 100 THEN
    UPDATE accidentes SET estado= 'RI' WHERE incidente= :new.accidente;
  END IF;
END;


/*ok*/
INSERT INTO incidentes VALUES (006,TO_DATE('2016/10/17','yyyy/mm/dd'),'ventas');
INSERT INTO accidentes VALUES ('EI',0,null,006);
INSERT INTO investigacion VALUES ('P',null,'IMPE',1,006,1006);
INSERT INTO es_resultado VALUES (006,'010',100);
/*No ok NO HAY*/
DROP TRIGGER T13;

/*No se pueden definir resultados que hagan que el porcentaje en investigaciones del accidente sea mayor a 100. 
Si no se da porcentaje, se asume que se espera que este resultado cubra el porcentaje restante.*/

ALTER TABLE es_resultado MODIFY(explica null);

CREATE TRIGGER T11
BEFORE INSERT ON es_resultado
FOR EACH ROW
DECLARE sumaT  NUMBER;
BEGIN
  SELECT distinct investigado INTO sumaT FROM accidentes WHERE :new.accidente = accidentes.incidente;
  IF :new.explica IS NULL THEN 
      :new.explica := 100-sumaT;
  END IF;
  UPDATE accidentes SET investigado = :new.explica + investigado WHERE :new.accidente = accidentes.incidente;
END;

CREATE TRIGGER T22
BEFORE UPDATE ON accidentes
FOR EACH ROW
BEGIN
  IF :new.investigado= 100 THEN
    UPDATE investigacion SET fecha= TO_DATE(sysdate,'DD-MM-YYYY') WHERE :old.incidente= investigacion.accidente;
  END IF;
  IF  :new.investigado > 100 THEN
    RAISE_APPLICATION_ERROR(-20003,'No se puede tener mas de un 100%');
  END IF;
END;
 
DELETE FROM es_resultado WHERE accidente= 2;
UPDATE accidentes SET investigado= 0 WHERE incidente= 2;
/*OK*/
INSERT INTO es_resultado VALUES (002,'010',020);
INSERT INTO es_resultado VALUES (002,'020',null);

/*No ok*/
INSERT INTO es_resultado VALUES (002,'020',020);

DROP TRIGGER T11;
DROP TRIGGER T22;


/*Mantener riesgo*/ 

/*El código debe ser el prefijo del nombre y debe estar compuesto únicamente por letras.*/

CREATE OR REPLACE TRIGGER T17
BEFORE INSERT ON riesgo
FOR EACH ROW
BEGIN
  IF SUBSTR(:new.nombre,0,3)<>:new.codigo THEN
  RAISE_APPLICATION_ERROR(-20077,'No se puede ingresar');
  END IF;
END;
/*ok*/
INSERT INTO riesgo VALUES('ANA','ANA es una niña fea',79); 
/*no ok*/
INSERT INTO riesgo VALUES('JON','DAVID es un niño feo',79); 

DROP TRIGGER T17;

/*El único dato que se puede modificar es la probabilidad pero únicamente se puede incrementar.*/

CREATE TRIGGER T15
BEFORE UPDATE ON riesgo
FOR EACH ROW
BEGIN 
  IF (:new.codigo <> :old.codigo OR :new.nombre <> :old.nombre) OR :new.probabilidad < :old.probabilidad THEN
    RAISE_APPLICATION_ERROR(-20076,'No se puede actualizar si el nombre o el codigo es diferente del que ya tiene
                            ademas, no se puede cambiar la probabilidad por una menor a la que ya tiene');
  END IF;
END;
/*ok*/
UPDATE riesgo SET probabilidad = 60 WHERE codigo= '010';
/*no ok*/
UPDATE riesgo SET probabilidad = 30 WHERE codigo= '010';

DROP TRIGGER T15;

/*No se pueden eliminar riesgos que se han evaluado con más de 80% de probabilidad.*/

UPDATE RIESGO SET PROBABILIDAD= 81 WHERE codigo= '010';
ALTER TABLE es_resultado DROP CONSTRAINT FK_resulcodigo;
ALTER TABLE es_resultado ADD CONSTRAINT FK_resulcodigo FOREIGN KEY(codigo)
REFERENCES riesgo(codigo) ON DELETE CASCADE;

CREATE TRIGGER T16
BEFORE DELETE ON riesgo
FOR EACH ROW
BEGIN 
  IF :old.probabilidad >= 80 THEN
    RAISE_APPLICATION_ERROR(-20076,'No se pueden eliminar riesgo con mas de 80% de probabilidad');
  END IF;
END;

/*No ok*/
DELETE FROM riesgo WHERE codigo = '010';
/*OK*/
DELETE FROM riesgo WHERE codigo = '020';

DROP TRIGGER T16;

/*Registrar incidente*/
/*se pueden eliminar los incidentes que esten en accidentes*/


ALTER TABLE accidentes DROP CONSTRAINT FK_accincidentes;
ALTER TABLE es_causa DROP CONSTRAINT FK_acincidente;
ALTER TABLE investigacion DROP CONSTRAINT FK_accidente;
ALTER TABLE esta_involucrado DROP CONSTRAINT FK_adminisacc;
ALTER TABLE es_resultado DROP CONSTRAINT FK_resaccidente;
ALTER TABLE es_resultado DROP CONSTRAINT FK_resulcodigo;
ALTER TABLE zonas DROP CONSTRAINT FK_incidentes;
ALTER TABLE condiciones DROP CONSTRAINT FK_incidente_condic;
ALTER TABLE tiene DROP CONSTRAINT FK_numero;


ALTER TABLE accidentes ADD CONSTRAINT FK_accidentes FOREIGN KEY (incidente )
REFERENCES incidentes(numero) ON DELETE CASCADE;

ALTER TABLE es_causa ADD CONSTRAINT FK_accidente_es_causa FOREIGN KEY(aci_incidente)
REFERENCES accidentes(incidente) ON DELETE CASCADE;

ALTER TABLE investigacion ADD CONSTRAINT FK_accidente_investigacion FOREIGN KEY(accidente)
REFERENCES accidentes(incidente) ON DELETE CASCADE;

ALTER TABLE esta_involucrado ADD CONSTRAINT FK_accidente_esta_involucrado FOREIGN KEY(accidente)
REFERENCES accidentes(incidente) ON DELETE CASCADE;

ALTER TABLE es_resultado ADD CONSTRAINT FK_accidente_es_resultado FOREIGN KEY(accidente)
REFERENCES investigacion(accidente) ON DELETE CASCADE;

ALTER TABLE zonas ADD CONSTRAINT FK_incidentes FOREIGN KEY(incidente)
REFERENCES incidentes(numero) ON DELETE CASCADE;

ALTER TABLE condiciones ADD CONSTRAINT FK_incidente_condic FOREIGN KEY(incidentes)
REFERENCES incidentes(numero) ON DELETE CASCADE;

ALTER TABLE tiene ADD CONSTRAINT FK_numero FOREIGN KEY (numero) 
REFERENCES incidentes(numero) ON DELETE CASCADE;

/*ok*/
DELETE FROM INCIDENTES WHERE NUMERO= 5;
/*no ok
NO HAY*/

/*no se puede modificar la fecha del incidente*/
CREATE TRIGGER incidente
BEFORE UPDATE ON INCIDENTES
FOR EACH ROW
BEGIN
  IF :old.fecha <> :new.fecha THEN
    RAISE_APPLICATION_ERROR(-20045,'No se puede modificar fecha de un incidente');
  END IF;
END;
/*OK*/
UPDATE INCIDENTES SET fecha= TO_DATE('2005/09/20','yyyy/mm/dd') WHERE NUMERO= 1;
/*NO OK*/
UPDATE INCIDENTES SET fecha= TO_DATE('2005/09/20','yyyy/mm/dd') WHERE NUMERO= 2;



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

/* PUNTO 3:
	Revisen su modelo conceptual general y perfecciónenlo. ¿Cuáles fueron los cambios
	realizados?
		Se realizo cambio en la tabla es resultado, cambiando el explica a nulo.
		
	RETROSPECTIVA
	1. ¿Cuál fue el tiempo total invertido en el laboratorio por cada uno de ustedes?
	(Horas/Hombre)
		Ana/ 10 horas
		John/ 10 horas
	2. ¿Cuál es el estado actual del laboratorio? ¿Por qué?
		Completo
	3. ¿Cuál consideran fue el mayor logro? ¿Por qué?
		Realizar algunos Triggers que no sabiamos como plantearlos.
	4. ¿Cuál consideran que fue el mayor problema técnico? ¿Qué hicieron para resolverlo?
		Algunos Triggers mandaban error de tabla mutante y toco replantearlo.
	5. ¿Qué hicieron bien como equipo? ¿Qué se comprometen a hacer para mejorar los
	resultados? 
		Plantear las cosas entre los dos, tratar de tener mas tiempo disponible para	
		realizar los laboratorios.
*/



















