function[Q R] = Householder(A)
[m n] = size(A);
q = min(m - 1,n);
Q = eye(m);
for p = 1:q
  H = eye(m);
  [vp sigma beta] = GetHsReflector(A(p:m,p), 1);
  H(p:m,p:m) = eye(m - p + 1) - beta * vp * vp';
  Q = H * Q;
  A(p:m,p) = ApplyHSToColumn(A(p:m,p),1,sigma);
  for j = p+1:n
    A(p:m,j) = ApplyHSToRandomColumn(A(p:m,j), vp, 1, beta);
  end
end
R = A;
Q = transpose(Q);