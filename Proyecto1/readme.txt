El modulo "operaMatrices.m" es un archivo de octave que contiene 6 funciones, donde la mas importante es "operaMatrices(a,b,c)" que recibe como parametro 3 argumentos:
	a.- Matriz A
	b.- Matriz B
	c.- Operador
La funcion regresa 1 vector con 3 valores como respuesta: [R E M]
	R.- Es la matriz resultado de la operacion designada
	E.- En caso de haber error, este valor seria Verdadero(1) de otra manera es Falso
	M.- Una cadena de texto que indica lo sucedido, ya sea exito o explicacion del error.
Bien, los Operadores validos para mandar a llamar la matriz son 5, los casos serian:
	0.- Suma el primer argumento con el segundo
	1.- Resta el primer argumento con el segundo
	2.- Multiplica el primer argumento con el segundo
	3.- Solo considera el primer argumento, genera una matriz de [filas del argumento]x2 donde cada columna nos marca valores por cada fila de la matriz argumento:
		Columna 1: Medias
		Columna 2: Deviacion Estandar
	4.- Solo considera el primer argumento, genera una matriz de 2x[columnas del argumento] donde cada fila nos marca valores por cada columna de la matriz argumento:
		Fila 1: Valor Maximo 
		Fila 2: Valor Minimo
En caso de que el operador no se encuentre en el rango [0,4] nos arroja un mensaje de error y no realiza ninguna operacion. Asi mismo si la operacion es imposible por tamaño de matrices

Las otras 5 funciones se mandan a llamar por la principal para realizar todo lo ya explicado, el codigo esta comentado ya que no se usan funciones propias de octave, se usan iteraciones para movernos sobre matrices

Se añade un ejemplo de uso en el archivo "example.m"

