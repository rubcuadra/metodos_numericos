format long
A1=[-1 2 -1; 
    2 3 0; 
    3 0 2];
b1=[0; 
    8; 
    9];

%ITERATIVOS
[x1j] = jacobi(A1,b1,ones(3,1),25)
[x3Gs] = GaussSeidel(A1,b1)
