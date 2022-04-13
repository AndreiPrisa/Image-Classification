function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X,y] = preprocess(path_to_testset, histogram, count_bins);
  X = (X - mean(X)) ./ std(X);
  [m n] = size(X);
  X(:, n + 1) = ones(m, 1); # adaugam termenii bias
  y_ = w' * transpose(X);
  percentage = mean(y_ .* y > 0 | (y_ == 0 & y == 1));
endfunction