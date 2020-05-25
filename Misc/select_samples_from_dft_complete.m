function [sample_rows, i, j] = select_samples_from_dft_complete...
                               (rows_image, columns_image, angles);

% [sample_rows, i, j] = select_samples_from_dft_complete...
%                       (rows_image, columns_image, angles);
%
% =============================================
% = Cristiano Jacques Miosso                  =
% = Email: miosso@ieee.org                    =
% =-------------------------------------------=
% = Last modification: March 19, 2009         =
% =============================================

x_grid = -floor(columns_image/2):floor(columns_image/2);
y_grid = -floor(rows_image/2):floor(rows_image/2);

x = [];
y = [];
i = [];
j = [];
sample_rows = [];
for(k = 1:length(angles))
	a = angles(k);
	m = tan(a);
	b = 0;
	[x_,y_]=intersections_line_grid(m,b,x_grid,y_grid);
	x = [x; x_(:)];
	y = [y; y_(:)];
	[i_,j_] = xy_intersections_to_ij(x_,y_,x_grid,y_grid);
	i__ = i_+1;
	j__ = j_;
	[i_, j_] = convert_shifted_dft_indexes_to_normal(i_,j_, rows_image, columns_image);
	[i__, j__] = convert_shifted_dft_indexes_to_normal(i__,j__, rows_image, columns_image);
% 	i = [i; i_(:); i__(:)];
% 	j = [j; j_(:); j__(:)];
	i = [i; i_(:)];
	j = [j; j_(:)];
	sample_rows_ = i_ + (j_-1)*rows_image;
	sample_rows = [sample_rows; sample_rows_(:)];
	%close all;
% 	plot_grid_intersections(x_grid,y_grid,x_,y_,m,b);
% 	plot_grid_intersections(x_grid,y_grid,x_,y_,m,b);
% 	show_samples_from_dft(sample_rows_, rows_image, columns_image, 3);
% 	pause(0.1);
% 	pause;
end

sample_rows = unique(sample_rows);
sample_rows = sort(sample_rows);
while(sample_rows(length(sample_rows))>rows_image*columns_image)
	sample_rows = sample_rows(1:length(sample_rows)-1);
end

%close all;
% show_samples_from_dft(sample_rows, rows_image, columns_image);

function [i, j] = convert_shifted_dft_indexes_to_normal(i1, j1, rows_image, columns_image);
I = zeros(rows_image, columns_image);
for(k=1:length(i1))
	if(i1(k) > 0 && j1(k) > 0)
		I(i1(k), j1(k)) = 1;
	end
end
I = fftshift(I);
[i, j] = find(I==1);
% i = i(:);
% i = i+1;
% j = j(:);
% j = j+1;
% k = find(j>columns_image);
% j(k) = ones(length(k),1);
% k = find(i>rows_image);
% i(k) = ones(length(k),1);
