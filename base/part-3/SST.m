function [x] = SST(A, b)
  [m n] = size(A);
  x = zeros(n,1);
  for k = n:-1:1
    x(k) = (b(k) - A(k,k+1:n) * x(k+1:n)) / A(k,k);
  endfor
end
    