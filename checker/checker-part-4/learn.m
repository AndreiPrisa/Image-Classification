function [w] = learn(X, y, lr, epochs)
  batch_size = 64;
  X = (X - mean(X)) ./ std(X);
  [m n] = size(X);
  X(:, n + 1) = ones(m, 1);
  w = (rand(n + 1, 1) - 0.5) / 5;
  for epoch = 1 : epochs
    indices = randperm(m,batch_size);
    X_batch = X(indices, :);
    y_batch = y(indices)';
    ## aplic vectorizat algoritmul
    w = w - lr * 1/m * transpose(X_batch) * (X_batch * w - y_batch);
  endfor 
endfunction
