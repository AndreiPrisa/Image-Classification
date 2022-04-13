function sol = hsvHistogramConstructor(image, count_bins)
  [rows cols color] = size(image);
  ## la fel ca la RGB, construim edges pentru bins
  for i = 0: count_bins - 1
    edges(i + 1) = i * 1.01 / count_bins;
    edges(count_bins + 1) = 1.01;
  endfor
  edges;
  image;
  for i = 1 : color
    suma = zeros(1, count_bins + 1);
    suma = transpose(sum(histc(image(:,:,i), edges),2));
    sol((i - 1) * count_bins + 1 : i * count_bins) = suma(1:count_bins);
  endfor
endfunction