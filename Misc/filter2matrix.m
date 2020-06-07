function [ H ,H2] = filter2matrix( h , rows, cols)
%Generates the matrices from the filters, for the 2D case.
%
%-h is a cell array of filter coefficients (can have different sizes)
%-rows and cols are the size of the image
%-H is a cell array of rows*cols,rows*cols matrices, such the convolution
%on an image I by h{k} is the product H{k}*I.
%-H2 is a single length(h)*rows*cols,rows*cols matrix, formed by the 
%vertical concatenation of Hs. H2*I gives the concatenation of H{k}*I.
%
% Jonathan Lima, September 2018.
H2=[];
for i=1:length(h)
    %in convolution, we flip the coefficients, right?
    h{i}=fliplr(h{i});
    h{i}=flipud(h{i});
    %create the x, y and v to fill a sparse matrix
    x1=1:size(h{i},1);
    x=[];
    for ii=1:size(h{i},2)
        x=[x x1+(ii-1)*rows];
    end
    filSize=x1(end);
    y=repmat(1:1*(cols+1-filSize)',size(x,2),1);
    y=y(:)';
    v=h{i}(:)';
    x=repmat(x,1,1*(cols+1-filSize));
    x=x+y-1;
    v=repmat(v,1,1*(cols+1-filSize));
    %create the first part of matrix, that convolves the first row of the
    %image
    H{i}=sparse(y,x,v,cols,rows*cols);
    for j=1:rows
        try %creates and concatenates the following rows
            H{i}=[H{i};sparse(y,x+j*cols,v,cols,rows*cols)];
        catch %if x position pass rows*cols, would generate an error
            m=sparse(y,x+j*cols,v);
            m=m(1:(rows-x(length(h{i}(:)))),1:rows*cols); % eliminate the last rows that pass the stipulated size
            H{i}=[H{i};m];
        end
    end
    %reshaping to size(H{i} be [rows*cols,rows*cols] 
    H{i}(1,rows*cols)=0;
    H{i}(rows*cols,1)=0;
    H{i}=H{i}(1:rows*cols,1:rows*cols);
    H2=vertcat(H2,H{i});
end
