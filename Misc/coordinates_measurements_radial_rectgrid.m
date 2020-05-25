function [samples_rows, samples_rows_high_plane] = coordinates_measurements_radial_rectgrid(rows_image, columns_image, angles);

%addpath('samples_rows_for_mri/');
[samples_rows, i, j] = select_samples_from_dft_complete(rows_image, columns_image, angles);

N = rows_image;

samples_rows_2 = zeros(N, N);
for(k = 1:length(i))
	samples_rows_2(i(k), j(k)) = 1;
end
samples_rows_2 = fftshift(samples_rows_2);
samples_rows_2(N/2+2:N,:) = 0;
samples_rows_2(N/2+1,N/2+1:N) = 0;
samples_rows_2 = ifftshift(samples_rows_2);
samples_rows_2 = find(samples_rows_2);
samples_rows_high_plane =samples_rows_2;
