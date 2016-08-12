function M = decodifica(matrix,lista) 
    [r c] = size(matrix);
    M=zeros(r,c);
    for j = 1:c
    	for i= 1:r
    		M(i,j)=(find(lista==matrix(:,j)(i,1))-1)
       	endfor %matrix(:,j)=CurrentRow 
	endfor
endfunction