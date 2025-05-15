# Awk

## Lenguaje de Programación integrado en Bash para manipular la salida de Texto

## Sintaxis Basica

```awk 'patron {acción}' archivo.txt ```


### Ejemplo:

	Juan 25 Madrid
	Ana 30 Barcelona
	Luis 22 Sevilla


### Imprimir Campos

``` awk ' {print $1 , $3} personas.txt ' ```

	**Salida**
	Juan Madrid
	Ana Barcelona
	Luis Sevilla

**$1** = campo de lineas leido en columnas

**$0** = Toda la Linea


### Begin y END

	**Begin** se ejecuta antes de leer cualquier linea del Archivo
	**End** se ejecuta después de procesar todas las lineas del archivo


	´´´ awk 'BEGIN { print "Lista de Personas: "} {print $1, $3} END { print "Fin del Listado"}' Personas.txt´´´

	
### Separadores de campo ( FS )( Field Separator ) y registro ( RS )( Registred Separator )

	Cambiar el separador por defecto

	´´´ awk -F ":" '{ print $1 , $5 }' personas.txt´´´

	Cambia el separador a " : "


   Otra forma de hacerlos: ``` awk 'BEGIN { FS=","} {print $1, $3} datos.csv'```


### Variables Predefinidas

|Variable | Descripción |
|---------|-------------|
|$0|Línea Completa|
|$1,$2|Campos Individuales|
|NF|Numero de Campos|
|NR|Numero de registro ( Numero de Linea)|
|FILENAME| Nombre del archivo|
|FS| Separador de Campos (por defecto espacio)|
|OFS| Separador de salida entre campos|
|ORS| Separador de salida de Registros|
 

**Ejemplo: **

``` awk '{print "Linea" , NR , "Tiene", NF , "Campos" }' archivo.txt ```




### Condicionales Simples:

´´´ awk '$3 == "Madrid" { print $1}' personas.txt´´´


´´´ awk '$2 > 25 { print $1}' personas.txt ´´´

Imprime los nombres de Personas Mayores de 25 años, por ejemplo.




 
