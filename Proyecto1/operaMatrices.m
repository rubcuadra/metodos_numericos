%Tarea 1
%Ruben Cuadra A01019102
function [R, E, M] = operaMatrices(A,B,operator) %Recibe 2 Matrices y una operacion
    switch (operator)
        case 0
            [R,E,M]=suma(A,B);
        case 1
            [R,E,M]=resta(A,B);
        case 2
            [R,E,M]=multiplicacion(A,B);
        case 3
            [R,E,M]=mediaDev(A); %1er columna sera media de la fila de A, 2da columna sera standard deviation de la fila
        case 4
            [R,E,M]=maxMin(A);   %MAXmin -> la 1er fila sera el mayor numero de la columna de A, 2da el minimo
      otherwise
        E = true;R=[];M=cstrcat('Comando incorrecto: ',int2str(operator));
    endswitch
endfunction

function [R, E, MSG] = suma(A,B)   %2 Matrixes as Param
    E=true;R=[];MSG='Dimensiones no compatibles para suma'; %init Returns with bad result
    if rows(A)==rows(B) && columns(A)==columns(B)  %validate size
        for i = 1:rows(A)                       %Iterator over rows
            for j = 1:columns(A)                %iterator over cols
                R(i,j)=A(i,j)+B(i,j);           %Realizar suma entre celdas
            endfor
        endfor
        E=not(E);MSG='Success';                 %Cambiar mensajes inicializados a exito
    endif
endfunction

function [R, E, MSG] = resta(A,B)   %2 Matrixes as Param
    E=true;R=[];MSG='Las dimensiones de las matrices impide su resta'; %init Returns
    if rows(A)==rows(B) && columns(A)==columns(B)  %validate size
        for i = 1:rows(A)
            for j = 1:columns(A)
                R(i,j)=A(i,j)-B(i,j);     %Igual que la funcion anterior, resta
            endfor
        endfor
        MSG='Success';E=false;
    endif
endfunction

function [R, E, MSG] = multiplicacion(A,B)   %2 Matrixes as Param
    [A_rows,A_col]=size(A); [A_rows,B_col]=size(B); %Obtener tamaño de ambas matrices
    E=true;R=zeros(A_rows,B_col);MSG='Matrix Size error'; %initial Returns, R se inicializa del tamaño del resultado M1xN2
    if A_col == A_rows    %Validamos que se puede multiplicar M1xN1 · M2xN2 [N1 equals M2] 
        for i = 1:A_rows          %iteramos sobre filas A
             for j = 1:B_col      %iteramos sobre columnas de B
                 for k = 1:rows(R)  %iterador de la matriz resultado, con este se define la posicion de la iteracion de A,B
                     R(i,j) = R(i,j) + A(i,k)*B(k,j);
                 endfor
             endfor
        endfor
        MSG='Multiplicacion Exitosa'; E=false;
    endif
endfunction

function [R, E, MSG] = mediaDev(A)   %2 Matrixes as Param
    E=false;R=zeros(rows(A),2);MSG='Success median|DevStand'; %init Returns, iniciamos con zeros R de tamaño M1x2
    for i = 1:rows(A)        %iteramos sobre filas
        R(i,1)= mean(A(i,:));  %Col 1 will have Means per row, obtains all row
        R(i,2)= std(A(i,:));  %Col 2 Wil have standar deviation per row
    endfor
endfunction

function [R, E, MSG] = maxMin(A)   
    E=false;MSG='Success';R=zeros(2,columns(A)); %init Returns, iniciamos con zeros R de tamaño 2xN1
    if columns(A)==0 MSG='Matrix has No columns';E=true; endif  %Validamos que tenga minimo una columna para poder hacerlo
    for i = 1:columns(A)        %Iteramos sobre las columnas
        R(1,i)= max(A(:,i));  % obtiene todas las columnas
        R(2,i)= min(A(:,i));
    endfor
endfunction     
