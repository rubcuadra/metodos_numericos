function [VO, R] = ortogonaliza(V, eps)
	VO = [V(:,1)]; 		 %Obtener PrimerVector
	for i=2:columns(V) 			     %For del vector 2 hasta el ultimo
		temp = 0;					 %temp nos ayudara con el acumulado, se resetea en cada ciclo
		for j=1:columns(VO) 		 %For por la cantidad de elementos que llevamos en VO
			temp += (sum(V(:,i).*VO(:,j))/sum(VO(:,j).*VO(:,j)))*VO(:,j);
		endfor 						 %Sacar vector octogonal y producto escalar
		o=V(:,i)-temp; 			 %Vector - acumulado en temp
		if(sqrt(sum(o.^2)) > eps) 	 %comparamos la MAGNITUD del ortog con eps, en caso de ser mayor se agrega
			VO(:,end+1)=o;	     %Agregar el vector en la ultima posicion (Aumenta rango) 
		endif
	endfor
	R=columns(VO);				%Rango seran la cantidad de vectores en VO
endfunction