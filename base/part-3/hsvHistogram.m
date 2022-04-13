function [sol] = hsvHistogram(path_to_image, count_bins)
  hsv_image = rgbhsvconverter(path_to_image); #obtinem imaginea in HSV
  sol = hsvHistogramConstructor(hsv_image, count_bins); # construim Histograma
endfunction