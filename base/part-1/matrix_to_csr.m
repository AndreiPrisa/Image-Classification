function [values, colind, rowptr] = matrix_to_csr(A)
  n = size(A);
  contor = 1;
  contor_rowptr = 1;
  for i = 1:n
    val_gasita = 0; # tinem cont daca am gasit numar nenul pe linie
    for j = 1:n
      ## adaugam numerele nenule si in colind
      if A(i,j) ~= 0
        values(contor) = A(i,j);
        colind(contor) = j;
        ## daca avem o prima aparitie pe o linie
        ## adaugam in rowptr
        if val_gasita == 0
          rowptr(contor_rowptr) = contor;
          contor_rowptr++;
          val_gasita = 1;
        endif
        contor++;
      endif
    endfor
  endfor
  rowptr(contor_rowptr) = contor;
endfunction