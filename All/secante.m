function [x,ite] = secante(funct,x0,x1,converVal=0.001,iters=10)
	fucn_sym=sym(funct);
	f=function_handle(fucn_sym);
	syms x; ite=-1;
	for iter = 0:iters %MaximoDeIteraciones
		nxt=x1-((x1-x0)/(f(x1)-f(x0)))*f(x1) %FormulaSecante
		if abs(nxt-x1)<converVal %Si se logra el criterio retornar
			ite=iter;x=nxt;
			break
		endif 
		x0=x1;x1=nxt; %Actualizar el primer y segundo punto
	endfor	
	if ite==-1
		disp('NO CONVERGE');
	endif
endfunction 