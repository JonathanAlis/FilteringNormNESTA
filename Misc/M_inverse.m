function x = M_inverse(y,rows,cols,samples_rows)

if size(y,1)~=length(samples_rows)
    error(['wrong input size, is ' num2str(size(y,1)) ', should be ' num2str(length(samples_rows))]);
end
z=zeros(rows*cols,1);
z(samples_rows)=y;
z=reshape(z,rows,cols);
x=ifft2(z,rows,cols);%*sqrt(rows*cols);
x=x(:);
end

