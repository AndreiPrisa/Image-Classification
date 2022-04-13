function[vp, sigma, beta] = GetHsReflector(x, p)
m = length(x);
sigma = sign(x(p)) * norm(x(p:m));
beta = 1 / (sigma * ( sigma + x(p)));
vp = [zeros(p - 1, 1); x(p) + sigma; x(p+1:m)];
endfunction
 