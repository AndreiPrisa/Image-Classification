function [cost] = compute_cost_pc(points, centroids)
  cost = 0;
  [N D] = size(points);
  [NC D] = size(centroids);
  
  for i = 1 : N
    min = norm(points(i,:) - centroids(1,:));
    for j = 2 : NC
      if norm(points(i,:) - centroids(j,:)) < min
        min = norm(points(i,:) - centroids(j,:));
      endif
    endfor
    cost = cost + min;
  endfor
endfunction

