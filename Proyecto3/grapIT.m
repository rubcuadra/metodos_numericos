fucn_sym=sym('x^3+2*x^2+10*x-20')
f=function_handle(fucn_sym)
syms x;
ff=formula(f(x));
ffd=diff(ff);
df=function_handle(ffd)
x1=-2:.0001:2;
secanteX = [0 1]
secanteY = [f(0) f(1)]
plot(x1,f(x1),x1,df(x1),secanteX,secanteY,[-2 2],[0 0])
grid minor on

title('Gráfica de la funcion y su derivada')
legend('f  ','df  ','Secante f','location','southeast')



pause