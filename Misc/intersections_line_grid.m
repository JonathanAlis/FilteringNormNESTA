function [x,y]=intersections_line_grid(m,b,x_grid,y_grid)

% [x,y]=intersections_line_grid(m,b,x_grid,y_grid);
% 
%   Computes all intersections between the straight line y=mx+b and the grid
% defined by the cartesian product between  x values in x_grid and  y values
% in y_grid.
% 
%   The computed intersections are given in output vectors x and y, with the
% same  length N and  such that  (x(i),y(i)) represents  the  i-th  computed
% intersection. Then, N is the total number of computed intersections.
% 
%   Remark: x_grid  and y_grid are  supposed to contain only integer values.
% 
% ================================================
% =           Cristiano Jacques Miosso           =
% =     Last modification: April 28th, 2007      =
% ================================================

run_program=1;

% Check if number of inputs is correct.
if(nargin~=4)
	disp('Incorrect usage. Function must take 4 inputs.');
	run_program=0;
end

if(run_program)
	% Check if x_grid and y_grid contain only integer values.
	x_grid_int=ceil(x_grid);
	y_grid_int=ceil(y_grid);
	if ( (sum(x_grid==x_grid_int)~=length(x_grid)) ||...
	     (sum(x_grid==x_grid_int)~=length(x_grid)) )
		m='Incorrect usage. Vectors x_grid and y_grid must contain';
		m=[m ' only integer values.'];
		disp(m);
		run_program=0;
	end
end

if(run_program)
	min_x=min(x_grid);
	max_x=max(x_grid);
	min_y=min(y_grid);
	max_y=max(y_grid);
	% Find intersections having integer values of x.
	y=m*x_grid+b;
	valid_points=find((y>=min_y) & (y<=max_y));
	x=x_grid(valid_points);
	y=y(valid_points);
	% Add intersections having integer values of y
	% and non-integer values of x.
	if(m~=0)
		y_=y_grid;
		x_=(y_-b)/m;
		valid_points=find((x_>=min_x)&(x_<=max_x));
		x_=x_(valid_points);
		y_=y_(valid_points);
		k=find(x_~=ceil(x_));
		y_=y_(k);
		x_=x_(k);
		x=[x x_];
		y=[y y_];
		[x,k]=sort(x);
		y=y(k);
	end
end
