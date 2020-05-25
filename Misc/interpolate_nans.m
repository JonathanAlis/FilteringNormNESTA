function v=interpolate_nans(x,method)
if nargin<2
    method='linear';
end
    [h,w]=size(x);
    X=[];
    Y=[];
    Xq=[];
    Yq=[];
    V=[];
    for i=1:h
        for j=1:w
            if ~isnan(x(i,j))
                X=[X;i];
                Y=[Y;j];
                V=[V;x(i,j)];                
            end
        end
    end
    [Xq,Yq] = meshgrid(1:h,1:w);
    v = griddata(X,Y,V,Xq,Yq,method); 
    v=v';
end