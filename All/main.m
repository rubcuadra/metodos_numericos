funct = '2*x^2 -x -5';
functDespejada = '((x+5)/2)^0.5';
initVal0= 2;
initVal1=3;
V = [3 2 0
	2 0 1
	1 1 1];
b=[8;
   0;
   9];


%[result e] = convierteReal(122.41,8,6,false)
%[result e] = convierteReal('00100110001',6,3,true) %Mantisa,expo

%Ecuaciones
%[x, i] = puntoFijo(functDespejada,initVal0) % f(x)=2x^2 -x -5
%[x, i] = newtonRaphson(funct,initVal0)
%[x,i] = secante(funct,initVal0,initVal1)

%Vectores
%[VO R] = ortogonaliza(V)

%Gauss Analitico
%GaussJordan(V,b)
%GaussJordan(V)
%GaussPP(V,b)
%simpleGauss(V,b)

%ITERATIVOS
%jacobi(V,b)
%GaussSeidel(V,b)

%Interpolacion
X = [1,2,3,4,5,6,7,8,9,10,11,12];						%EN X
Y = [1,2,1,3,3,2,4,6,3,6,7,5];	%EN Y
N = 11;										%Grado, size X - 1
O = 0;										%0 = Interpolacion,1 = minimoCuadrado
P = [10,11,12,13];						%Puntos Extra en X
%[A E] = aproxima(X,Y,N,O,P)
% Parameter M adjacency matrix where M_i,j represents the link from 'j' to 'i', such that for all 'j'
%     sum(i, M_i,j) = 1
% Parameter d damping factor
% Parameter v_quadratic_error quadratic error for v
% Return v, a vector of ranks such that v_i is the i-th rank from [0, 1]

function [v] = rank2(M, d, v_quadratic_error)

	N = size(M, 2) % N is equal to either dimension of M and the number of documents
	v = rand(N, 1)
	v = v ./ norm(v, 1)   % This is now L1, not L2
	last_v = ones(N, 1) * inf
	M_hat = (d .* M) + (((1 - d) / N) .* ones(N, N))

	while(norm(v - last_v, 2) > v_quadratic_error)
		last_v = v
		v = M_hat * v
	        % removed the L2 norm of the iterated PR
	end
endfunction

M = [0 1 1; 0.5 0 0; 0.5 0 0];
rank2(M, 1, 0.001)







