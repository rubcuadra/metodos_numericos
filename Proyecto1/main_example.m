A=[1,2,3;4,5,6;7,8,9];
B=[1,2;3,4;5,6];
C=[1,2;3,4];
D=[1,1,1;2,2,2;3,3,3];    %Las primeras 4 Lineas nos definen una serie de Matrices que fueron usadas para pruebas

cmd=2;					 						 %Esta variable nos sirve para cambiar el operador que debe ser -1<cmd<5

[resultMatrix e message]=operaMatrices(A,B,cmd); %Aqui se manda a llamar el modulo que nos debe devolver 3 valores
% e es un valor que regresa la funcion para indicar si hay error o NO
if e 					%Si hubo error, Despliega Commando Incorrecto/Operacion imposible (message que regreso la funcion)
	disp(message);    	
else 					%De otra manera Despliega la matriz resultado
	resultMatrix
endif