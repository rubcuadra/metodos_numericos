function [x,iter] = puntoFijo(functDesp,iv ,maxIters=10,dif=0.001) 
	iter=-1;
	fucn_sym=sym(functDesp);
	f=function_handle(fucn_sym);
	syms x;
	x0 = iv
	for i=1:10
		x1=f(x0)
		if abs(x0-x1)<dif
			iter=i;
			x=x1;
			break
		end
		x0=x1;
	end
	if i==-1
		disp('NO CONVERGE CON ESA FUNCION Y ESE PUNTO');
	end
end %SE MANDA A LLAMAR CON ECUACION,ValorInicial