function y = M_direct(x,rows,cols,samples_rows)
%apply fft and select coeficients.
%x is a column vector(size=(rows*cols,1)), rows is the number of rows in the image
%samples rows are the indices
% size y = size samples rows
if size(x,1)~=rows*cols
    error('wring x size');
end
x=reshape(x,rows,cols);
x=fft2(x,rows,cols);%/sqrt(rows*cols);
x=x(:);
y=x(samples_rows);
end