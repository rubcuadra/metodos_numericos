format long

A1=[-1 2 -1
	2 3 0
	3 0 2];
b1=[0;
	8;
	9];

%ITERATIVOS
[Jacobi] = jacobi(A1,b1,zeros(3,1),25)
[GaussSeidel] = GaussSeidel(A1,b1,zeros(3,1))

