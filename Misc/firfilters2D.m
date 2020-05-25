function [h,bp,low_low] = firfilters2D( fir_n_coefs, num_bands )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

normalize_coeffs=false;
n=num_bands;
bp{1}=fir1(fir_n_coefs,1.0/n);
if normalize_coeffs
    bp{1}=bp{1}*(1/norm(bp{1})); uncomment to normalize
end
for i=2:n-1
    bp{i}=fir1(fir_n_coefs,[(i-1)*1/n i/n]);
    if normalize_coeffs
        bp{i}=bp{i}*(1/norm(bp{i}));
    end
end
bp{n}=fir1(fir_n_coefs,(n-1)/n,'high');
if normalize_coeffs
    bp{n}=bp{n}*(1/norm(bp{n}));
end
k=0;
for i=1:n
    for j=1:n
        if i~=1 || j~=1
            k=k+1;
            h{k}=bp{i}'*bp{j};
        end
    end
end
low_low{1}=bp{1}'*bp{1};

end

