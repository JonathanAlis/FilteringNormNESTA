function [i,j]=xy_intersections_to_ij(x,y,x_grid,y_grid)

% [i,j]=xy_intersections_to_ij(x,y,x_grid,y_grid);

mx=min(x_grid);
my=min(y_grid);

x_=(x(2:length(x))+x(1:length(x)-1))/2;
y_=(y(2:length(y))+y(1:length(y)-1))/2;

j=ceil(x_-mx);
i=ceil(-my-y_);
