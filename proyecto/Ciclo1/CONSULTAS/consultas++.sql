/*CONSULTAS*/

/*CONSULTAR LOS USUARIOS QUE  HAN CREADO ALGUN GRUPO*/
SELECT DISTINCT USERNAME,U.NOMBRE,ID_GRUPO,G.NOMBRE  FROM USUARIOS U,GRUPOS  G
WHERE G.CREADOR= USERNAME;

/*CONSULTAR LOS USUARIOS QUE  HAN CREADO ALGUN PROBLEMA*/
SELECT DISTINCT USERNAME,U.NOMBRE,ID_PROBLEMA,P.NOMBRE  FROM USUARIOS U,PROBLEMAS  P
WHERE P.CREADOR= USERNAME;

/*CONSULTAR LOS INTEGRANTES DEL EQUIPO AL QUE PERTENECE CrkJohn*/
SELECT * FROM USUARIOS,(SELECT * FROM PERTENECE_EQUIPO
WHERE ID_EQUIPO= (SELECT ID_EQUIPO FROM PERTENECE_EQUIPO WHERE ID_USUARIO= 'CrkJohn' AND ROWNUM <= 1)) 
WHERE USERNAME= ID_USUARIO;

/*CONSULTAR LOS COMENTARIOS QUE HA HECHO Pedro Guerreiro Y SI HA HECHO UN COMENTARIO DE PROBLEMAS QUE HAYA CREADO ESTE NO SALE*/
SELECT DISTINCT * FROM COMENTARIOS C,PROBLEMAS P
WHERE ID_PROBLEMA = PROBLEMA AND CREADOR <>'Pedro Guerreiro' AND USUARIO= 'Pedro Guerreiro';

/*CONSULTAR CUALES PERSONAS HAN HECHO MAS PROBLEMAS QUE EL PROMEDIO DE PROBLEMAS RESUELTOS*/
SELECT * FROM (SELECT DISTINCT(ID_NOMBRE) FROM SOLUCIONA S1
WHERE (SELECT COUNT(ID_PROBLEMA)FROM SOLUCIONA S WHERE S.ID_NOMBRE= S1.ID_NOMBRE) >= (SELECT AVG(COUNT(ID_PROBLEMA)) CONT FROM SOLUCIONA 
GROUP BY ID_NOMBRE)), USUARIOS
WHERE USERNAME= ID_NOMBRE;

/*CONSULTAR LOS COMENTARIOS DE UN PROBLEMA*/
SELECT DISTINCT * FROM PROBLEMAS,COMENTARIOS 
WHERE ID_PROBLEMA= PROBLEMA;

/*CONSULTAR PROBLEMAS DEL USUARIO srd98*/
SELECT * FROM PROBLEMAS,(SELECT DISTINCT(ID_PROBLEMA) FROM SOLUCIONA
WHERE ID_NOMBRE= 'srd98') S
WHERE PROBLEMAS.ID_PROBLEMA= S.ID_PROBLEMA;

/*CONSULTAR CUAL USUARIO A SOLUCIONADO MAS PROBLEMAS*/
SELECT * FROM (SELECT DISTINCT(ID_NOMBRE) FROM SOLUCIONA S2
WHERE (SELECT COUNT(ID_PROBLEMA) FROM SOLUCIONA S1 WHERE S1.ID_NOMBRE= S2.ID_NOMBRE) = (SELECT MAX(COUNT(ID_PROBLEMA))  FROM SOLUCIONA 
GROUP BY ID_NOMBRE)),USUARIOS
WHERE USERNAME= ID_NOMBRE;

/*CONSULTAR LAS PERSONAS QUE TIENEN COMO ESTUDIO 'INGENIERIA DE SISTEMAS'*/
SELECT * FROM (SELECT username,nombre,correo,ocupacion,lugar,fecha,telefono
	FROM  usuarios, XMLTABLE('/Perfil/estudios/estudio[@nombre = "Ingeniería de sistemas"]'
						passing perfil
						columns temp NUMBER PATH  '@nombre')) ;
/*CONSULTAR LAS PERSONAS QUE PERTENECEN AL PROYECTO 'TEAM' */
SELECT * FROM (SELECT username,nombre,correo,ocupacion,lugar,fecha,telefono
	FROM  usuarios, XMLTABLE('/Perfil/proyectos/proyecto[@nombre = "TEAM"]'
						passing perfil
						columns temp NUMBER PATH  '@nombre')) ;