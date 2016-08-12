function [A E] = aproxima(x, y, n, o , p)
   format long
   E=0;A=0;
   %IF o=1 obtener cof con minimo_cuadrado
   %IF o=0 obtener cof con interpolacion
   if o [A] = minimo_cuadrado(x,y,n);
   else %If si no se puede
      if n+1~=length(x) E=1; return end      
      [A] = interpola(x,y);
   end
   graphIt(x,y,A,p) %A = Coeficientes obtenidos; P puntos extra
end   

function [cofs] = interpola(X,Y)
   mat = 0; %init matrix
   for i = 1:length(X) %rows
      for j = 1:length(X) %cols
         mat(i, j) = X(i)^(length(X)-j);%ingresar elementos
      end
   end
   % x = A^-1 * Y 
   cofs = flip(inv(mat)*Y'); %Flip, primer valor sera la constante
end
function [cof] = minimo_cuadrado(x, y, m)
   n = size(x,1);
   if n == 1
      n = size(x,2);
   end
   b = zeros(m+1,1);
   for i = 1:n
      for j = 1:m+1
         %right-hand side column vector consisting of sums of
         %powers of x multiplied by y's
         b(j) = b(j) + y(i)*x(i)^(j-1);
      end
   end
   p = zeros(2*m+1,1);
   for i = 1:n
      for j = 1:2*m+1
         %potencias en x
         p(j) = p(j) + x(i)^(j-1);
      end
   end
   for i = 1:m+1
      for j = 1:m+1
         %Suma de potencias x in a matrix A
         A(i,j) = p(i+j-1);
      end
   end
   cof = A\b;
end
function graphIt(x,y,c, extras) %Extras = Puntos extras; c = coeficientes
   m = rows(c)-1;
   %Puntos Extras
   P = [];
   for extraPoint = extras
      t = c(1);  %Primero la constante
      for k = 2:length(c)
         t+= c(k)*extraPoint^(k-1); %EvaluarPolinomio
      end
      P(end+1) = t; %Append de puntos a graficar
   end
   %PintarPolinomioDeMinimo entre extras y X hasta maximo
   t = min( [x,extras] ):0.05:max( [x,extras] );
   n = size(t,2);
   for i = 1:n
      f(i) = c(m+1);
      for j = m:-1:1
         f(i) = c(j) + f(i)*t(i); %Evaluacion
      end
   end
   return
   %data visualization
   figure
   plot(t,f,'r')  %Polinomio en Rojo
   hold on
   plot(x, y, 'kx')  %puntos en X negras
   grid on
   plot(extras,P,'b*') %Extras en azul y *
   pause
end