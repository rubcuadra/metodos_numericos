fucn_sym=sym('x^4 - 7.6*x^3 - 30.51*x^2 + 564*x - 798.46 ')
f=function_handle(fucn_sym)
syms x;
ff=formula(f(x))
ffd=diff(ff)
df=function_handle(ffd)

iters=15
initVal=-5
converVal=0.0001
for iter = 0:iters %For de 0 a Maximas Iteraciones
		temp=initVal-f(initVal)/df(initVal) %temp=X,initVal=x0
		if abs(temp-initVal)<converVal		
			i=iter
			Error=false; x=initVal%Regresar valores
			break
		end
		initVal=temp% Actualizar x0
end

if true
	x1=-10:.1:10;
    plot(x1,f(x1))
    grid minor on
    title('Gráfica de la funcion y su derivada')
    legend('f  ','location','southeast')
    pause
end
