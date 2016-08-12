function [L, E] = potenciaLista(first,second) 
    E=true;L=[];
    if size(first)==size(second)
	    ix=1;
	    L=zeros(size(first));
	    for element = second
	    	L(ix)=first(ix)^element;
	    	ix+=1;
	    endfor
	    E=false;
	endif
endfunction