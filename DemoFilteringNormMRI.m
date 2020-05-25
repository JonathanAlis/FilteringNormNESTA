%MRI reconstruction with filtering norm
clear all
close all
addpath(genpath('./Misc'))
%x=phantom(256);
x=im2double(imread('data/head256.png'));
figure(1)
imshow(x,[])
number_radial_lines=40;
verbose=0;
mu=0.0001;
delta=0;
rows = size(x, 1);
cols = size(x, 2);
samples_rows = ...
    coordinates_measurements_radial_rectgrid(rows, ...
    cols ,linspace(0, pi, number_radial_lines));

% |--- Take linear measurements (radial lines) ---|----------------------{{{
b = kspace_measurements(x, samples_rows);

A = @(z) M_direct(z,rows, cols,samples_rows);
At= @(z) M_inverse(z,rows, cols,samples_rows);

%defining the filters
clear h
h{1}=[1 -1];
h{2}=[1;-1];
hs{1}=h;
clear h
h{1}=[1 -1;1 -1];
h{2}=[1 1;-1 -1];
h{3}=[1 -1;-1 1];
hs{2}=h;
clear h
h{1}=[1 -2 1];
h{2}=[1; -2;1];
hs{3}=h;
clear h
h=firfilters2D(2,2);
hs{4}=h;
clear h;
h{1}=[1 -1;1 -1];
h{2}=[1 1;-1 -1];
h{3}=[1 -1;-1 1];
h{4}=[1 -2 1];
h{5}=[1; -2;1];
hs{5}=h;
clear h
h=firfilters2D(2,2);
h{4}=[1 -1;1 -1];
h{5}=[1 1;-1 -1];
h{6}=[1 -1;-1 1];
hs{6}=h;
clear h
h=firfilters2D(2,2);
h{4}=[1 -2 1];
h{5}=[1;-2 ;1];
hs{7}=h;
clear h
h=firfilters2D(2,2);
h{4}=[1 -1;1 -1];
h{5}=[1 1;-1 -1];
h{6}=[1 -1;-1 1];
h{7}=[1 -2 1];
h{8}=[1; -2;1];
hs{8}=h

opts=[];
opts.maxiter = 1000;
opts.Verbose=verbose;
opts.typeMin='filters';
opts.xplug=x(:);
figure(2)
set(gcf, 'Position', get(0, 'Screensize'));
drawnow
for i=1:length(hs)
    opts=[];
    opts.maxiter = 1000;
    opts.Verbose=verbose;
    opts.typeMin='filters';
    opts.xplug=x(:);
    opts.h=hs{i};
    tic
    xr{i} = NESTA(A, At, b, mu,delta,opts);
    t=toc;
    figure(2)
    subplot(3,8,i)
    xr{i}=real(reshape(xr{i},rows,cols));
    imshow(xr{i},[])
    xlabel(['snr=' num2str(snr(double(x),real(xr{i})),3) ',ssim=' num2str(ssim(double(x),real(xr{i})),3)])
    title(['iFN, h' num2str(i) ', ' num2str(t,3) ' s']);
    drawnow
end

for i=1:length(hs)
    opts=[];
    opts.maxiter = 1000;
    opts.Verbose=verbose;
    opts.typeMin='filters';
    opts.xplug=x(:);
    opts.h=hs{i};
    opts.verbose=1;
    opts.alphaIso=0;
    opts.alphaAni=1;
    tic
    xr{i} = NESTA(A, At, b, mu,delta,opts);
    t=toc;
    figure(2)
    subplot(3,8,i+8)
    xr{i}=real(reshape(xr{i},rows,cols));
    imshow(xr{i},[])
    xlabel(['snr=' num2str(snr(double(x),real(xr{i})),3) ',ssim=' num2str(ssim(double(x),real(xr{i})),3)])
    title(['aFN, h' num2str(i) ', ' num2str(t,3) ' s']);
    drawnow
end

for i=1:length(hs)
    opts=[];
    opts.maxiter = 1000;
    opts.Verbose=verbose;
    opts.typeMin='filters';
    opts.xplug=x(:);
    opts.h=hs{i};
    opts.verbose=1;
    opts.alphaIso=1;
    opts.alphaAni=1;
    tic
    xr{i} = NESTA(A, At, b, mu,delta,opts);
    t=toc;
    figure(2)
    subplot(3,8,i+16)
    xr{i}=real(reshape(xr{i},rows,cols));
    imshow(xr{i},[])
    xlabel(['snr=' num2str(snr(double(x),real(xr{i})),3) ',ssim=' num2str(ssim(double(x),real(xr{i})),3)])
    title(['iaFN, h' num2str(i) ', ' num2str(t,3) ' s']);
    drawnow
end