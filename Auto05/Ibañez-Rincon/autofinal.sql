CREATE TABLE PLACE
	(PLACE_NO NUMBER(11) NOT NULL,
	PLACE_TOWN VARCHAR(20) NULL,
	PLACE_COUNTRY VARCHAR(20) NULL,
	DETALLES XMLTYPE NOT NULL);
	
ALTER TABLE PLACE ADD CONSTRAINT PK_PLACE
PRIMARY KEY (PLACE_NO);


/*Poblar*/
INSERT INTO PLACE VALUES (1,'Manchester','England',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "51" 
		longitud= "21414" 
		latidud= "532851">
	</ubicacion>
	<codigos
		codigo_postal= "M1" 
		area= "3">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "17"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "26"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "12"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "5"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "City Dreams" estrellas= "4">
			<habitacion 
				nombre= "Suit sencilla" 
				precio= "1200"
				tipo= "simple">
			</habitacion>
			<habitacion 
				nombre= "Suit precidencial" 
				precio= "1400"
				tipo= "simple">
			</habitacion>
		</hotel>
		<hotel nombre= "Holiday Inn Express Manchester City Centre" estrellas= "3">
			<habitacion 
				nombre= "Habitacion sencilla" 
				precio= "300" 
				servicio= "Conexión WiFi gratuita, Habitaciones no fumadores, Adaptado personas de movilidad reducida, Recepción 24 horas"
				tipo= "simple">
			</habitacion>
			<habitacion
				nombre= "Habitacion doble"
				precio= "560"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Teatro The Palace" 
			importancia= "media" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Barrio gay de Mánchester" 
			importancia= "media" 
			tipo= "Cultural">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (2,'Edinburgh','Scotland',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "66" 
		longitud= "31147" 
		latidud= "555707">
	</ubicacion>
	<codigos
		codigo_postal= "EH1" 
		area= "2">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "15"
            mes_inicio= "marzo"
            mes_fin= "julio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25"
            mes_inicio= "julio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "7"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "2"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Morningside Apartments" estrellas= "5">
			<habitacion 
				nombre="Apartamento Deluxe" 
				precio= "3416860"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Balfour House Apt-Arthurs Seat view" estrellas= "4">
			<habitacion 
				nombre= "Apartamento con vistas a las montañas" 
				precio= "3616900" 
				servicio= "Tv pantalla plana, bañera, lavavajillas, wifi gratis"
				tipo= "simple">
			</habitacion>
			<habitacion
				nombre= "Habitacion simple"
				precio= "45000"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Royal Mile" 
			importancia= "baja" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Puente de Forth" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (3,'Salzburg','Austria',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "435" 
		longitud= "130238" 
		latidud= "474757">
	</ubicacion>
	<codigos
		codigo_postal= "5020" 
		area= "662">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "10"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "21"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "14"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "3"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "MEININGER Hotel" estrellas= "3">
			<habitacion 
				nombre="Sencilla" 
				precio= "35000"
				tipo= "sencilla">
			</habitacion>
			<habitacion 
				nombre= "Habitacion doble" 
				precio= "45000"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Crowne Plaza" estrellas= "4">
			<habitacion 
				nombre= "Habitacion sencilla" 
				precio= "7000" 
				servicio= "wifi gratis, tv pantalla plana, lavanderia"
				tipo= "sencilla">
			</habitacion>
			<habitacion
				nombre= "Habitacion doble"
				precio= "18000"
				tipo= "sencilla">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Monasterio Capuchino" 
			importancia= "media" 
			tipo= "Historico">
		</atraccion>
		<atraccion
			nombre= "Lugar de nacimiento de Mozart" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (4,'New York','USA',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "57" 
		longitud= "740021" 
		latidud= "404251">
	</ubicacion>
	<codigos
		codigo_postal= "10001" 
		area= "718">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "7"
            mes_inicio= "marzo"
            mes_fin= "julio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25"
            mes_inicio= "julio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "17"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "0"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Row NYC" estrellas= "4">
			<habitacion 
				nombre="Habitacion simple" 
				precio= "700000"
				tipo= "simple">
			</habitacion>
			<habitacion 
				nombre= "Habitacion doble" 
				precio= "1600000"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "The Manhattan" estrellas= "4">
			<habitacion 
				nombre= "Habitacion simple" 
				precio= "650000" 
				servicio= "wifi gratis, tv pantalla plana"
				tipo= "simple">
			</habitacion>
			<habitacion
				nombre= "Habitacion doble"
				precio= "1300000"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Time Square" 
			importancia= "alta" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Rockefeller Center" 
			importancia= "media" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (5,'Birmingham','England','<?xml version="1.0"?>
<detalle>
	<ubicacion
		altitud= "149" 
		longitud= "15359" 
		latitud= "522853">
	</ubicacion>
	<codigos 
		codigo_postal= "B1" 
		area= "2">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "15"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "20"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "10"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "5"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Jurys Inn Birmingham" estrellas= "3">
			<habitacion 
			  nombre="Habitación Superior con cama extragrande" 
			  precio= "10161220"
			  tipo= "doble">
			</habitacion>
		    <habitacion 
			  nombre= "Habitación Executive con cama extragrande" 
			  precio= "14240880"
			  tipo= "doble">
		    </habitacion>
		</hotel>
		<hotel nombre= "Saint Pauls House" estrellas= "4">
		  <habitacion
			  nombre= "Habitación Doble Estándar" 
			  precio= "2467740" 
			  servicio= "Vistas a la ciudad,Aire acondicionado,Baño privado,WiFi gratis"
			  tipo= "doble">
		  </habitacion>
		  <habitacion
			  nombre= "Habitación Doble Superior"
			  precio= "2902760"
			  tipo= "doble">
		  </habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "National Motorcycle Museum Admission" 
			importancia= "alta" 
			tipo= "Cultural">
		</atraccion>
		<atraccion
			nombre= "Symphony Hall" 
			importancia= "alta" 
			tipo= "Cultural">
		</atraccion>
	</atracciones>
</detalle>') ;

INSERT INTO PLACE VALUES (6,'Glasgow','Scotland',
'<?xml version="1.0"?>
<detalle>
	<ubicacion
      altitud= "40" 
      longitud= "41527" 
      latidud= "555154">
  </ubicacion>
	<codigos 
      codigo_postal= "G1" 
      area= "3">
  </codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "15"
            mes_inicio= "marzo"
            mes_fin= "julio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25"
            mes_inicio= "julio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "7"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "2"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
  <hoteles>
		<hotel nombre= "citizenM Glasgow" estrellas= "4">
			<habitacion
				nombre= "Habitación Doble" 
				precio= "1971820"
				servicio= "TV de pantalla plana, Aire acondicionado, Insonorización, Baño privado, WiFi gratis"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Jurys Inn Glasgow" estrellas= "4">
			<habitacion 
				nombre= "Habitación Doble Estándar - 2 camas" 
				precio= "1717940 " 
				servicio= " Aire acondicionado, Bañera Baño privado, TV de pantalla plana, WiFi gratis"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Habitación Triple"
				precio= "2424240"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Tour al lago Lomond y Castillo de Stirling desde Glasgow" 
			importancia= "media" 
			tipo= "Historia">
		</atraccion>
		<atraccion 
			nombre= "Excursión de un día al lago Ness, Glencoe y las Tierras Altas desde Glasgow" 
			importancia= "alta" 
			tipo= "Historia">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (7,'London','England',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "25" 
		longitud= "00732" 
		latidud= "513030">
	</ubicacion>
	<codigos
		codigo_postal= "E1" 
		area= "4">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "17"
            mes_inicio= "marzo"
            mes_fin= "mayo">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "22"
            mes_inicio= "junio"
            mes_fin= "agosto">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "19"
            mes_inicio= "septiembre"
            mes_fin= "noviembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "7"
            mes_inicio= "diciembre"
            mes_fin= "febrero">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "City Aldgate Apartments" estrellas= "3">
			<habitacion 
				nombre="Apartamento de 1 dormitorio" 
				precio= "300"
				tipo= "doble">
			</habitacion>
			<habitacion 
				nombre= "Apartamento de 2 dormitorios" 
				precio= "365"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Best Western London Peckham Hotel" estrellas= "3">
			<habitacion 
				nombre= "Habitación Doble - 2 camas" 
				precio= "241" 
				servicio= " Aire acondicionado, TV de pantalla plana, WiFi gratis"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Habitación Doble"
				precio= "241"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "London Eye" 
			importancia= "media" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Big Ben" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (8,'Chicago','USA',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "180" 
		longitud= "873900" 
		latidud= "415100">
	</ubicacion>
	<codigos
		codigo_postal= "60707" 
		area= "2">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "19"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "28"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "15"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "-10"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "The Whitehall Hotel" estrellas= "4">
			<habitacion 
				nombre="Habitación con cama grande" 
				precio= "398"
				tipo= "doble">
			</habitacion>
			<habitacion 
				nombre= "Habitación con cama extragrande" 
				precio= "408"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Staypineapple at The Alise Chicago" extrellas= "4">
			<habitacion 
				nombre= "Habitación Deluxe con cama extragrande" 
				precio= "340" 
				servicio= "Aire acondicionado, Baño privado, TV de pantalla plana"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Suite Junior"
				precio= "558"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Estación Millennium" 
			importancia= "baja" 
			tipo= "Cultural">
		</atraccion>
		<atraccion
			nombre= "Millennium Park" 
			importancia= "media" 
			tipo= "Entretenimiento">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (9,'Amsterdam','Netherlands',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "13" 
		longitud= "45322" 
		latidud= "522226">
	</ubicacion>
	<codigos
		codigo_postal= "1011" 
		area= "3">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "17"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "11"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "3"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Holiday Inn Express Amsterdam - Sloterdijk Station " estrellas= "3">
			<habitacion 
				nombre="Habitación Doble Estándar - 2 camas" 
				precio= "368"
				tipo= "doble">
			</habitacion>
			<habitacion 
				nombre= "Habitación Doble Estándar - 1 o 2 camas" 
				precio= "368"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "NH Collection Amsterdam Grand Hotel Krasnapolsky" estrellas= "5">
			<habitacion 
				nombre= "Habitación Doble Superior - 1 o 2 camas" 
				precio= "898" 
				servicio= " Aire acondicionado, Baño privado, TV de pantalla plana"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Habitación Doble Premium con vistas - 1 o 2 camas"
				precio= "1593"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Basílica de San Nicolás" 
			importancia= "alta" 
			tipo= "Cultural">
		</atraccion>
		<atraccion
			nombre= "Casa de Ana Frank" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

/*CONSULTAS*/
1. SELECT EXTRACT(detalles,'/detalle/*') FROM place;
2. SELECT EXTRACTVALUE(detalles,'/detalle/codigos/@codigo_postal') FROM place WHERE place_town = 'Glasgow';
3. SELECT place_town from place where CAST(EXTRACTVALUE(detalles,'/detalle/ubicacion/@altitud') AS INT)< 200;
4.  SELECT * FROM (SELECT P.place_town, T.precio
	FROM  PLACE P, XMLTABLE('/detalle/hoteles/hotel/habitacion[@tipo= "simple"]'
						passing P.detalles
						columns precio NUMBER PATH  '@precio') T                    
	ORDER BY T.precio ASC) WHERE ROWNUM<=1;
5.  SELECT EXTRACT(detalles,'/detalle/atracciones/atraccion[@tipo = "Historico" and  @importancia = "alta"]/@nombre') AS LUGAR
	FROM place WHERE EXTRACT(detalles,'/detalle/atracciones/atraccion[@tipo = "Historico" and  @importancia = "alta"]/@nombre') IS NOT NULL;
6.  SELECT * FROM (SELECT P.place_town 
	FROM  PLACE P, XMLTABLE('/detalle/temperatura/estacion[@nombre = "invierno"]'
						passing P.detalles
						columns temp NUMBER PATH  '@temperatura') T                    
	ORDER BY T.temp ASC) WHERE ROWNUM<=1;

/* PROPUESTAS CONSULTAS
1. EL PRECIO, PAIS DE LA HABITACION DOBLE MAS COSTOSA
2. EL PAIS,ALTITUD DE MAYOR ALTITUD
3. EL PRECIO, PAIS DE LA HABITACION DOBLE MAS BARATA
4. EL PAIS DE MAYOR TEMPERATURA EN PRIMAVERA
*/

/*PROPUESTAS*/
1. SELECT * FROM (SELECT P.place_town, T.precio
	FROM  PLACE P, XMLTABLE('/detalle/hoteles/hotel/habitacion[@tipo= "doble"]'
						passing P.detalles
						columns precio NUMBER PATH  '@precio') T                    
	ORDER BY T.precio DESC) WHERE ROWNUM<=1;
2. SELECT * FROM (SELECT P.place_town, T.altitud
	FROM  PLACE P, XMLTABLE('/detalle/ubicacion'
						passing P.detalles
						columns altitud NUMBER PATH  '@altitud') T                    
	ORDER BY T.altitud DESC) WHERE ROWNUM<=1;
3. SELECT * FROM (SELECT P.place_town, T.precio
	FROM  PLACE P, XMLTABLE('/detalle/hoteles/hotel/habitacion[@tipo= "doble"]'
						passing P.detalles
						columns precio NUMBER PATH  '@precio') T                    
	ORDER BY T.precio ASC) WHERE ROWNUM<=1;
4.  SELECT * FROM (SELECT P.place_town, T.temp
		FROM  PLACE P, XMLTABLE('/detalle/temperatura/estacion[@nombre = "primavera"]'
							passing P.detalles
							columns temp NUMBER PATH  '@temperatura') T                    
		ORDER BY T.temp DESC) WHERE ROWNUM<=1;
5.

/*
<?xml version="1.0"?>

<!DOCTYPE detalle [
	<!ELEMENT detalle (ubicacion,codigos,temperatura,hoteles,atracciones)>
	
	<!ELEMENT ubicacion (#PCDATA)>
	<!ATTLIST ubicacion 
		altitud  CDATA #REQUIRED
		longitud CDATA #REQUIRED
		latitud  CDATA #REQUIRED>
		
	<!ELEMENT codigos (#PCDATA)>
	<!ATTLIST codigos 
		codigo_postal CDATA #REQUIRED
		area CDATA #REQUIRED>
		
	<!ELEMENT temperatura (estacion*)>
	<!ATTLIST temperatura temperatura CDATA #IMPLIED>
	<!ELEMENT estacion (#PCDATA)>
	<!ATTLIST estacion 
		nombre CDATA #REQUIRED
		temperatura CDATA #REQUIRED
		mes_inicio CDATA #REQUIRED
		mes_fin CDATA #REQUIRED>			

	
	<!ELEMENT hoteles (hotel*)>
	<!ATTLIST hotel 
		nombre CDATA #REQUIRED
		estrellas CDATA #REQUIRED>
	<!ELEMENT hotel (habitacion*)>
	<!ELEMENT habitacion (#PCDATA)>
	<!ATTLIST habitacion 
		nombre CDATA #REQUIRED
		precio CDATA #REQUIRED
		tipo (doble | sencilla) #REQUIRED
		servicio CDATA #IMPLIED>

	<!ELEMENT atracciones (atraccion*)>
	<!ELEMENT atraccion (#PCDATA)>
	<!ATTLIST atraccion 
		nombre CDATA #REQUIRED
		importancia (alta | media | baja ) #REQUIRED
		tipo (Historico | Cultural | Entretenimiento) #REQUIRED>
]>

<detalle>
	<ubicacion 
		altitud= "13" 
		longitud= "45322" 
		latitud= "522226">
	</ubicacion>
	<codigos
		codigo_postal= "1011" 
		area= "Holanda Septentrional">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "17°C"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25°C"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "11°C"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "3°C"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Holiday Inn Express Amsterdam - Sloterdijk Station " estrellas= "3">
			<habitacion 
				nombre="Habitación Doble Estándar - 2 camas" 
				precio= "368"
				tipo= "doble">
			</habitacion>
			<habitacion 
				nombre= "Habitación Doble Estándar - 1 o 2 camas" 
				precio= "368"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "NH Collection Amsterdam Grand Hotel Krasnapolsky" estrellas= "5">
			<habitacion 
				nombre= "Habitación Doble Superior - 1 o 2 camas" 
				precio= "898" 
				servicio= " Aire acondicionado, Baño privado, TV de pantalla plana"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Habitación Doble Premium con vistas - 1 o 2 camas"
				precio= "1.593"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Basílica de San Nicolás" 
			importancia= "alta" 
			tipo= "Cultural">
		</atraccion>
		<atraccion
			nombre= "Casa de Ana Frank" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>
*/	

/*PROPUESTAS DTD
1. LOS TIPOS DE HABITACION DEBEN SER DOBLE O SENCILLAS
2. EL PRECIO DE LAS HABITACIONES DEBEN SER MAYOR A 0 (NO SE PUDO REALIZAR)
3. EL TIPO DE LAS ATRACCIONES DEBE SER HISTORICO,CULTURAL, ENTRETENIMIENTO*/




