function X=jacobi(A,B,P,max1,delta=0)
	N = length(B);
	for k=1:max1
	   for j=1:N
	      X(j)=(B(j)-A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j)
	      save 'Jacobi.txt' -append X
	   end
	   err=abs(norm(X'-P));
	   relerr=err/(norm(X)+eps);
	   P=X';
	   if (err<delta)|(relerr<delta)
	     break
	   end
	end
	X=X';
end