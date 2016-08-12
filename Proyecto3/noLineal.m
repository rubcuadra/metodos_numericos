function [x,Error,i]=noLineal(x0,eps,maxit,metodo) 
	format long
	if metodo [x Error i]=solucionSecante(x0,eps,maxit);
    else [x Error i]=solucionNewRap(x0,eps,maxit);
    endif%Metodo: True(1) es Secante; False(0) es Newton-Raphson
endfunction 

function [x,Error, i] = solucionSecante(initValues,converVal,iters)
	Error=true; i=iters; x='El metodo no converge'; %Inicializar Returns
	fst=initValues(1); snd=initValues(2);  %ParsearValores
	for iter = 0:iters %MaximoDeIteraciones
		nxt=snd-((snd-fst)/(f(snd)-f(fst)))*f(snd); %FormulaSecante
		if abs(nxt-snd)<converVal %Si se logra el criterio retornar
			i=iter; Error=false; x=nxt;
			break
		endif 
		fst=snd;snd=nxt; %Actualizar el primer y segundo punto
	endfor	
endfunction 

function [x,Error, i] = solucionNewRap(initVal,converVal,iters)
	Error=true; i=iters; x='El metodo no converge';	
	for iter = 0:iters %For de 0 a Maximas Iteraciones
		temp=initVal-f(initVal)/df(initVal); %temp=X,initVal=x0
		if abs(temp-initVal)<converVal		
			i=iter; Error=false; x=initVal;%Regresar valores
			break
		endif 
		initVal=temp;% Actualizar x0
	endfor
endfunction 
