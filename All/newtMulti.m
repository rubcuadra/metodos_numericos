function examen()
	%PUNTO FIJO
	x0=1; y0=0;
	fprintf (' k x (k) y (k) \n')
	fprintf('%2d %10.5f %10.5f\n', 0,x0,y0)
	for k=1:100
	y1= (2-x0^2)/(-2);  %(x0^2+y0^2+8) /10;     %Ecuacion 1
	x1=  y0^2+1;   %Ecuacion 2
	fprintf(' % 2d % 10.5f % 10.5f\n' ,k,x1,y1) 
	if abs(x1-x0)<0.001 && k~=1 && abs(y1-y0)<0.001 break end
	x0=x1; y0=y1;
	end
	%NEWTON
	x0=-1; y0=-1;
	fprintf (' k x (k) y (k) \n')
	fprintf('%2d %10.5f %10.5f\n', 0,x0,y0)
	for k=1:30
		dxf1=2*x0;
		dxf2=1;
		dyf1=-2;
		dyf2=-2*y0;
		f1=x0^2 -2*y0-2;
		f2=x0-y0^2-1;
		A=[dxf1 dyf1; dxf2 dyf2];
		b =[-f1; -f2];
		hj = inv(A)*b;
		x1 = x0+hj(1); y1=y0+hj(2);
		dist=((x1-x0)^2+(y1-y0)^2)^0.5;
		fprintf(' % 2d % 10.5f % 10.5f % 10.5f\n' ,k,x1,y1,dist) 
		if abs(x1-x0)<0.001 && k~=1 && abs(y1-y0)<0.001 break end
		x0=x1; y0=y1;
	end
end
function trape(funct,A,B,numDeIntervals) %OCUPA LIBRERIA SYM
	fucn_sym=sym(funct);
	F=function_handle(fucn_sym);
	syms x;
	F(0)
	%TRAPEZOIDAL COMPUESTO
	N= numDeIntervals;
	X=A;
	S=0;
	H= (B-A)/N
	for i = 1:N
		X=X+H;
		S=S+ F(X);
	end
	area = H/2*(F(A)+2*S+F(B))
end
%trape('0.2+25*x-20*x^2+12*x^3',1.5,4,20)







