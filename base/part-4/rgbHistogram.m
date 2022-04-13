function [sol] = rgbHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  [rows cols color] = size(image);
  ## formam marginile pentru bins
  for i = 0: count_bins - 1
   edges(i + 1) = i * 256 / count_bins;
   edges(count_bins + 1) = 256;
  endfor
  ## construim histograma, parcurgand fiecare culoare -> R G B
  for i = 1 : color
    suma = zeros(1, count_bins + 1);
    suma = transpose(sum(histc(image(:,:,i), edges),2));
    sol((i - 1) * count_bins + 1 : i * count_bins) = suma(1:count_bins);
  endfor
endfunction