function [xr,niter,residuals,outputData,opts] = NESTA_fill_nans(y,muf,delta,opts)
% [xk,niter,residuals,outputData] =NESTA_fill_nans(y,muf,delta,opts)
%   y is a 1D or 2D signal with NaNs values to be completed with 
%   
% Modified (version 2.0): Oct 2018, Jonathan Lima, UnB/UTEP
% NESTA Version 2.0

[h,w]=size(y);
y=y(:);
samplingPos=find(~isnan(y));
A=@(z) M(z,samplingPos);
At=@(z) Mt(z,samplingPos,h,w);
b=A(y);
xr = NESTA(A, At, b, muf,delta,opts);
end
function x=M(y,samplingPos)
    x=y(samplingPos);
    x=x(:);
end
function y=Mt(x,samplingPos,h,w)
    y=zeros(h,w);    
    y(samplingPos)=x;
    y=y(:);
end
function v=Mti(x,samplingPos,h,w)
    
    X=[];
    Y=[];
    Xq=[];
    Yq=[];
    V=[];
    y=nan(h,w);    
    y(samplingPos)=x;
    v=interpolate_nans(y);
    v=v(:);
end