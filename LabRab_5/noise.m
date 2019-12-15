function R = noise(P, n_type, M, N, a, b)
if nargin == 1
    a = 0;
    b = 1;
    M = 1;
    N = 1;
elseif nargin == 3
    a = 0;
    b = 1;
end 
 switch lower(n_type)
     case 'uniform'
         if nargin <= 4
             a = 0;
             b = 1;
         end
         R = a + (b - a)*rand(M, N);
         R = imlincomb(1, P, 0.2, R);
     case 'gaussian'
         if nargin <= 4
             a = 0;
             b = 1;
         end
         R = a + b*randn(M, N);
         m = max(max(R));
         l = min(min(R));
         for i = 1:size(R,1)
             for j = 1:size(R,2)
                R(i,j) = (R(i,j)+abs(l))/(abs(l)+m);
             end
         end
         R = imlincomb(0.9, P, 0.4, R);
         for i = 1:size(R,1)
             for j = 1:size(R,2)
                R(i,j) = R(i,j)-0.1;
             end
         end
     case 'salt & pepper'
         if nargin <= 4
             a = 0.05;
             b = 0.05;
         end
         if (a + b) > 1
             error('The sum Pa + Pb must not exceed 1.')
         end
         R(1:M, 1:N) = 0.5;
         X = rand(M, N);
         c = find(X <= a);
         R(c) = 0;
         u = a + b;
         c = find(X > a & X <= u);
         R(c) = 1;
         R = imlincomb(0.2, P, 1, R);
         for i = 1:size(R,1)
             for j = 1:size(R,2)
                R(i,j) = R(i,j)-0.1;
             end
         end
     case 'lognormal'
         if nargin <= 4
             a = 0; %1
             b = 1;
         end
         R = exp(b*randn(M, N) + a);
         R = imlincomb(0.2, P, 0.5, R);
     case 'rayleigh'
         R = a + (-b*log(1 - rand(M, N))).^0.5;
         R = imlincomb(0.2, P, 0.5, R);
     case 'exponential'
         if nargin <= 4
             a = 1;
         end
         if a <= 0
             error('Parameter a must be positive for exponential n_type.')
         end
         k = -1/a;
         R = k*log(1 - rand(M, N));
         R = imlincomb(0.2, P, 0.5, R);
     case 'erlang'
         if nargin <= 4
             a = 2;
             b = 5;
         end
         if (b ~= round(b) || b <= 0)
             error('Param b must be a positive integer for Erlang.')
         end
         k = -1/a;
         R = zeros(M, N);
         for j = 1:b
             R = R + k*log(1 - rand(M, N));
         end
         m = max(max(R));
         for i = 1:size(R,1)
             for j = 1:size(R,2)
                R(i,j) = R(i,j)/m;
             end
         end
         R = imlincomb(0.5, P, 1, R);
     otherwise
         error('Unknown distribution n_type.')
 end

