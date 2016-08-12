function [x, i] = newtonRaphson(funct,x0,converVal=0.001,iters=10)
	i=-1; x='El metodo no converge';	
	fucn_sym=sym(funct);
	f=function_handle(fucn_sym); %Ya tenemos la original
	syms x;
	ff=formula(f(x));
	ffd=diff(ff);
	df=function_handle(ffd)   %Ya tenemos la derivada
	for iter = 0:iters %For de 0 a Maximas Iteraciones
		x1=x0-f(x0)/df(x0) %x1=X,x0=x0
		if abs(x1-x0)<converVal		
			i=iter;
			x=x1;%Regresar valores
			break
		endif 
		x0=x1;% Actualizar x0
	endfor
	if i==-1
		disp('NO CONVERGE EN ESE PUNTO');
	endif
endfunction 