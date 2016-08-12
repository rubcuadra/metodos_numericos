function [R, E] = convierteReal(n,m,e,b) 
    if b [R E]=binaryToDecimal(n,m,e);
    else [R E]=decimalToBinary(n,m,e);
    endif
endfunction
%n es un real en decimal o binario que se convierte al otro
%m es el numero de bits de la mantisa
%e es los bits del exponente
%b indica si es binario o decimal
function [R, E] = binaryToDecimal(n,m,e)  
    E='No importa';R=0; n=[n];
    l = length(n);%Tamaño del numero binario que nos pasan
    %Primer binario es signo del num,si es 1 resulta en negativo,0 en positivo
    signo_numero=(-1)^n(1);
    %Segundo binario es signo del exponente
    signo_exponente=(-1)^n(2);
    %numero original en posicion 3 hasta (total-parteDeMantisa)
    exponent=bin2dec(n(3:l-m))*signo_exponente;
    mantisa=n(l-m+1:l); %Obtenemos la parte de la mantisa
    
    if exponent>0					%Cuando el exponente es positivo
    	if exponent>m              	%Cuando NO cabe en la mantisa
    		for i = 1:(exponent-m) %Agregamos 0's al final
				mantisa=strcat(mantisa,'0');
			endfor
		endif 	%Si cabe no hay problema
	else 								%Si el exponente es negativo
		for i = 1:abs(exponent)
			mantisa=strcat('0',mantisa); %Agregamos 0's al inicio
		endfor
	endif
	%Separar parte decimal y parte entera
	mantisa_decimal_numbers=mantisa(abs(exponent)+1:end);
	mantisa_integer_numbers=mantisa(1:abs(exponent));
    %Find regresa la posicion de todos los elementos que valgan 1
    %elevamos (1/2) a su posicion y la suma nos da la parte decimal
    decimals=sum(0.5.^find(mantisa_decimal_numbers=='1'));
    %metodo nativo de conversion bin a decimal
    integer=bin2dec(mantisa_integer_numbers);
    %suammos y añadimos signo
    R=(integer+decimals)*signo_numero;
endfunction

function [R, E] = decimalToBinary(n,m,e)   %2 Matrixes as Param
    R=0;E=0;
    entero = floor(n);    %Redondeamos el numero hacia abajo
    decimal = n-entero;	%Restamos el redondeo y nos da decimales
    
    enteroEnBinario=dec2bin(entero);
    decimalesEnBinario='';

    mantisaActual = length(enteroEnBinario);

    if mantisaActual<=m 	%El numero entero permite tener decimales
    	signoExponente='0';	
    	exponenteEnBinario= dec2bin(mantisaActual);     %Mantisa actual equivale al entero
    	bitsDeExponenteActual=length(exponenteEnBinario); %obtenemos el length del numero en binario
		if bitsDeExponenteActual==e
			bitsDeExponente=e; 						%Si es igual perfecto
		elseif bitsDeExponenteActual<e 				
		 	for i=1:(e-bitsDeExponenteActual)
		 		exponenteEnBinario=strcat('0',exponenteEnBinario); %Agregamos 0's si nos sobran bits de exponente
			endfor
		else 
			error('Bits de exponente insuficientes');	%Si no cabe aventamos error
		endif
    	for i=1:(m-mantisaActual) %m-mantisa = bits que faltan
			decimal *= 2; 					%AQUI se hace la conversion,multiplicamos por 2 los decimales
			significant=floor(decimal);  %Obtenemos el 1 o 0 que sea el significante
			decimal-=significant; 			%lo preparamos para la prox multiplicacion
			decimalesEnBinario=strcat(decimalesEnBinario,int2str(significant));  %Vamos acarreando
    	endfor
    	mantisaActual=strcat(enteroEnBinario,decimalesEnBinario); %Juntamos con la parte entera
    elseif mantisaActual>m
    	error('Bits de mantisa insuficientes para plasmar Entero');
    endif
    if n<0 signoNumero='1'; else signoNumero='0'; endif %Signo del numero
    R=strcat(signoNumero,signoExponente,exponenteEnBinario,mantisaActual); %Generamos el numero en Binario
    E=binaryToDecimal(R,m,e)-n;	
%Obtenemos el error evaluando el valor original-el convertido regresandolo a decimal
endfunction