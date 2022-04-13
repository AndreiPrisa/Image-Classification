function x = ApplyHSToColumn(x, p, sigma)
m = length(x);  
x(p) = -sigma;
x( p + 1 : m ) = 0;
endfunction