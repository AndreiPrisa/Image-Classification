function image_hsv = rgbhsvconverter(path_to_image)
  image = double(imread(path_to_image)) / 255;
  image(1,:,1);
  [rows cols color] = size(image);
  image_hsv = zeros(rows,cols, color);
  H = zeros(rows,cols);
  S = zeros(rows,cols);
  ## aplicam vectorizat alogritmul de conversie
  Cmax = max(image, [], 3);
  Cmin = min(image, [], 3);
  R_ = image(:,:,1);
  G_ = image (:, :, 2);
  B_ = image(:, :, 3);
  delta = Cmax - Cmin;
  H(Cmax == R_ & delta ~= 0) = 60 * mod(((G_(Cmax == R_ & delta ~= 0) - B_(Cmax == R_ & delta ~= 0)) ./ delta(Cmax == R_ & delta ~= 0)),6) / 360;
  H(Cmax == G_ & delta ~= 0) = 60 * (((B_(Cmax == G_ & delta ~= 0) - R_(Cmax == G_ & delta ~= 0)) ./ delta(Cmax == G_ & delta ~= 0)) + 2) / 360;
  H(Cmax == B_ & delta ~= 0) = 60 * (((R_(Cmax == B_ & delta ~= 0) - G_(Cmax == B_ & delta ~= 0)) ./ delta(Cmax == B_ & delta ~= 0)) + 4) / 360;
  S(Cmax ~= 0) = delta(Cmax ~= 0) ./ Cmax(Cmax ~= 0);
  image_hsv(:,:,3) = Cmax;
  image_hsv(:,:,2) = S;
  image_hsv(:,:,1) = H;
endfunction
  