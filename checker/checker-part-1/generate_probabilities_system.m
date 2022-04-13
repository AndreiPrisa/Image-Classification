function [A, b] = generate_probabilities_system(rows)
  matrix_size = rows * (rows + 1) / 2;
  A = zeros(matrix_size);
  b = zeros(matrix_size - rows, 1);
  for i = matrix_size - rows + 1 : matrix_size
    b(i) = 1;
  endfor
  A(1,1) = 4;
  A(1,2) = -1;
  A(1,3) = -1;
  for i = 2:rows
    total_prev = i * (i - 1) / 2; # nr elemente pana pe linia anterioara
    total_next = (i + 1) * (i + 2) / 2; # nr elemente pana la linia urmatoare

    for k = 1:i-1
      elem_prev(k) = total_prev - (i - 1) + k; # calculam elementele anterioare
    endfor
    ## cazurile pentru extremitati (de exemplu nodul 4 si nodul 6)
    A(total_prev + 1, total_prev + 1) = 5;
    A(total_prev + i, total_prev + i) = 5;
    A(total_prev + 1, elem_prev(1)) = -1;
    if i ~= rows # pentru cazul general
      for k = 1:i+1
        ## calculam elementele de pe urmatoarea linie
        elem_next(k) = total_next - (i + 1) + k;
      endfor
      ## punem coeficientii corespunzatori in matrice
      A(total_prev + 1, elem_next(1)) = -1;
      A(total_prev + 1, elem_next(2)) = -1;
      A(total_prev + i, elem_next(i + 1)) = -1;
      A(total_prev + i, elem_next(i)) = -1;
    else # pentru ultima linie
      A(total_prev + 1, total_prev + 1) = 4;
      A(total_prev + i, total_prev + i) = 4;
    endif
    A(total_prev + 1, total_prev + 2) = -1;
    A(total_prev + i, elem_prev(i - 1)) = -1;
    A(total_prev + i,total_prev + i - 1) = -1;

    ## cazul pentru elementele din mijloc de linie, se pot gasi coeficienti
    ## de 6 (sau de 5 daca suntem pe ultima linie)
    for j = total_prev+2:total_prev+i-1
      A(j,j) = 6;
      A(j, j+1) = -1;
      A(j, j-1) = -1;
      A(j, elem_prev(j - total_prev - 1)) = -1;
      A(j, elem_prev(j - total_prev)) = -1;
      if i ~= rows # pentru cazul general
        A(j, elem_next(j - total_prev)) = -1;
        A(j, elem_next(j - total_prev + 1)) = -1;
      else # pentru ultima linie
        A(j,j) = 5;
      endif
    endfor
  endfor
endfunction