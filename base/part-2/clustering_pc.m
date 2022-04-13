function [centroids] = clustering_pc(points, NC)
  [N D] = size(points);
  clusters = zeros(N/NC, D, NC); # N/NC = numarul elementelor din cluster
  contors = zeros(NC,1); # contoare pentru cate puncte avem in liste
  centroids_0 = zeros(NC, D);
  centroids = zeros(NC, D);
  ## impartim pe clustere initial
  for i = 1 : NC
    sum = zeros(1, D);
    for j = 0:N/NC - 1
      clusters(j+ 1,:, i) = points(NC * j + i, :);
      sum = sum + points(NC * j + i, :);
    endfor
    centroids_0(i, :) = sum / (N / NC); # centroizii initiali
    groups(1, :, i) = centroids_0(i, :); # listele cu puncte
  endfor
  while (1)
    contors = zeros(NC,1);
    ## realocam punctele listelor
    for i = 1 : N
      reminder = 1;
      min = norm(points(i, :) - groups(1, :, 1));
      for j = 1 : NC
        if norm(points(i, :) - groups(1, :, j)) < min
          min = norm(points(i, :) - groups(1, :, j));
          reminder = j; 
        endif
      endfor
      contors(reminder, 1) = contors(reminder, 1) + 1;
      groups(contors(reminder) + 1, :, reminder) = points(i, :);
    endfor
    for i = 1 : NC
      sum = zeros(1,D);
      ## facem suma punctelor pentru a restabili ceontroizii
      for j = 2: contors(i, 1) + 1
        sum = sum + groups(j, :,i);
      endfor
      centroids(i, :) = sum / contors(i, 1);
      groups(1, :, i) = centroids(i, :);
    endfor
    if centroids - centroids_0 == 0
      return;
    endif
    centroids_0 = centroids;
  endwhile
endfunction
