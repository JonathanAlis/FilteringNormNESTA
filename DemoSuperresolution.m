%trying to making superresolution with NESTA
%It will probably not work very well, because the sampling parttern of 
%a low resolution image from a high resolution image is regular
close all;
clear all;
addpath(genpath('./Misc'))
sr=4;
x=im2double(imread('data/head256.png'))/255;
xnans=x;
xsub=x(1:sr:end,1:sr:end);
xnans=nan(size(x));
xnans(1:sr:end,1:sr:end)=xsub;
figure(1)
subplot(2,3,1)
imshow(x,[])
subplot(2,3,2)
imshow(xsub,[])
subplot(2,3,3)
imshow(xnans,[])

verbose=0;
mu=0.1;
delta=0.01;


xic=interpolate_nans(xnans,'cubic');
subplot(2,3,4)
imshow(xic,[])

opts=[];
opts.maxiter = 10000;
opts.Verbose=verbose;
opts.typeMin='TV';
opts.xplug=x(:);
%opts.h=hs{i};
xr=NESTA_fill_nans(xnans, mu,delta,opts);
xr=reshape(xr,size(x));
subplot(2,3,5)
imshow(xr,[])


opts=[];
opts.maxiter = 10000;
opts.Verbose=verbose;
opts.typeMin='filters';
opts.xplug=x(:);
%h=firfilters2D(2,2);
h{1}=[1 -1];
h{2}=[1;-1];
opts.alphaAni=1;
opts.alphaIso=0;
%h{3}=[1 -1;-1 1];
%h{4}=[1 -2 1];
%h{5}=[1; -2;1];
opts.h=h;
%opts.h=hs{i};
xr=NESTA_fill_nans(xnans, mu,delta,opts);
xr=reshape(xr,size(x));
subplot(2,3,6)
imshow(xr,[])