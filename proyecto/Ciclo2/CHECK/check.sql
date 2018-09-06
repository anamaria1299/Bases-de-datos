/*ck*/

ALTER TABLE Envios MODIFY
	(LENGUAGE  
		CHECK( LENGUAGE IN('C++','JAVA','Python','ANSI C','C','PASCAL'))
	);

ALTER TABLE Veredictos MODIFY
	(LENGUAGE  
		CHECK( LENGUAGE IN('C++','JAVA','Python','ANSI C','C','PASCAL'))
	);
ALTER TABLE Veredictos MODIFY
	(resultado
		CHECK( resultado IN('A','T','R','W','P','M','C','r') )
	);
ALTER TABLE EVENTOS MODIFY
	(CLASE  
		CHECK( CLASE IN('Conferencia','Train Camp','Maraton') )
	);
	
ALTER TABLE EVENTOS MODIFY
	(CANTIDAD_EQUIPOS  
		CHECK(CANTIDAD_EQUIPOS>=0)
	);
	
ALTER TABLE INSCRIPCIONES MODIFY
	( VALOR  
		CHECK( VALOR>0)
	);
ALTER TABLE ASOCIACIONES MODIFY
	(ACREDITACION  
		CHECK( ACREDITACION>=1 AND ACREDITACION<6)
	);	
ALTER TABLE EVENTOS MODIFY
	(COSTO  	
		CHECK( COSTO>0)
	);
ALTER TABLE EVENTOS MODIFY 
	(NIVEL 
		CHECK(NIVEL IN('Facil','Medio','Dificil','Experto') )
	);