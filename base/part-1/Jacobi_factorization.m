function [G_J, c_J] = Jacobi_factorization(A, b)
  N = diag(diag(A));
  P = N - A;
  G_J = inv(N) * P;
  c_J = inv(N) * b;
endfunction
