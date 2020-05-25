function b = kspace_measurements(x, samples_rows_);

N = size(x, 1) * size(x, 2);

X = fft2(x);
X = X(:);
% b = 1 / sqrt(N) * X(samples_rows_);
b = X(samples_rows_);
