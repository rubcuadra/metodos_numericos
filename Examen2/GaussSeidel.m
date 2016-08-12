function [x] = GaussSeidel(A, b, x0=true, iters=30)
   if x0 x0=ones(size(b)); end
    n = length(A);
    x = x0;
    for k = 1:iters
        for i = 1:n
            x(i) = (1/A(i, i))*(b(i) - A(i, 1:n)*x + A(i, i)*x(i))
            save 'GaussSeidel.txt' -append x
        end
    end
end