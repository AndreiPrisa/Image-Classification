function x = ApplyHSToRandomColumn(x, vp, p, beta)
	m = length(x);
	ro = beta * vp(1:m)' * x(1:m);
	x(1:m) = x(1:m) - ro * vp(1:m);
end