function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  n = length(c);
  x0 = zeros(n,1);
  while (1)
    x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
    if abs(x - x0) < tol
      return;
    endif
    x0 = x;
  endwhile
endfunction