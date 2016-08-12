a =[1 2 3;0 0 6;7 8 9];
original = [1 2 3;1 1 2; 0 1 2]
%det(a)*inv(a)
Adjunta=det(original)*inv(original)
determinanteDeOriginal = det(original)
inversa = Adjunta*(1/determinanteDeOriginal)
inversa*original
originalPorAdjunta = Adjunta*original
a=[300 200 100;0 200 200; 200 100 200]
b=[30000;15000;25000]
