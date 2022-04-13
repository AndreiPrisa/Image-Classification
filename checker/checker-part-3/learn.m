function [w] = learn(X, y)
  [m n] = size(X);
  X(:,n+1) = ones(m,1); # adaugam termenii bias
  [Q R] = Householder(X);
  w = SST(R, transpose(Q) * y');
endfunction

  