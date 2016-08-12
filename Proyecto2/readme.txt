PseudoCodigo:
	Tener Archivo ConvierteReal.m en Path
	Convertiremos un Binario?
		SI: La funcion recibe 4 Parametros donde:
			1ro sera un numero binario normalizado en forma de string
			2do sera el numero de bits empleados en la mantisa
			3ro seran los bits del exponente para convertirlo
			4to sera un TRUE o 1 (Que señala que convertiremos de Binario a Decimal)
		NO: 
			1ro sera un numero decimal
			2do los bits que se usaran en la mantisa convertida
			3ro seran los exponentes de normalizacion
			4to sera un False o 0

	La funcion regresa 2 valores en cualquier caso:
			1ro es el numero convertido
			2do es un error de perdida de valores, solo valido de decimal a binario

	La funcion convierteReal solo es un IF que funciona con el 4to parametro, en caso de ser True manda a llamar a la funcion:
		-binaryToDecimal: Parsea el caracter en posicion 0 -> Signo del Numero
						  Parsea el caracter en posicion 1 -> Signo del exponente
						  Parsea la mantisa, agarra el segundo parametro y del final a la izquierda aparta los bits asignados
						  Los bits de exponente son los restantes en la posicion 2 hasta mantisa
						  Se usa una condicional para obtener la mantisa, si el exponente cabe en la mantisa no hay problema, si no cabe se rellna de 0's
						  La parte decimal se realiza con la funcion find, que eleva 0.5 a la posicion en la que exista un 1
						  La parte entera se convierte con el metodo nativo de octave
						  al final se concatenan ambos
		-DecimalToBinary: Se divide en parte entera y decimal con el metodo floor y una 
						resta entre original y redondeado, la parte decimal se multiplica x2 y se guarda el significante para convertirlo en binario, comos e explica en el codigo,consta de iteraciones de acuerdo con el espacio en la mantisa. Al final el numero obtenido se transforma a decimal con el metodo binaryToDecimal y se restan para obtener el valor de Error que es el otro valor que devuelve la funcion

un ejemplo para llamar a la funcion seria:
	
	[result e] = convierteReal(12.45,6,3,false)

	que convertira 12.45 en un 00100110001 con un error de -0.2 debido a los bits perdidos en la mantisa, mientras mayor sea la mantisa mayor precision tendra la funcion




