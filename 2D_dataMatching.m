
% Data Matching with STD spectra for 2D spectrum

%% Load 2D spectra as *.ft
%cd data folder

loadallft
%%
whos

Setup2D(spectra);
%%
Xdata = X;
XNoisedata = XNoise;
XTitledata = XTitles;
ppm1data = ppm1;
ppm2data = ppm2;

clearvars X XNoise XTitles ppm1 ppm2 spectra

%%
cd /Users/Ricardo/Dropbox/PUREcompounds
% cd C:\Users\Ricardo\Dropbox\PUREcompounds
%%
loadallft
%%
whos

Setup2D(spectra);

XSTD = X;
XNoiseSTD = XNoise;
XTitleSTD = XTitles;
ppm1STD = ppm1;
ppm2STD = ppm2;

clearvars X XNoise XTitles ppm1 ppm2 spectra

%% Selecting Region of interest
[XSTDr, ppm1STDr, ppm2STDr] = Region_selector2D(XSTD,ppm1STD,ppm2STD,1,10,10,160);
[XNoiseSTDr, ppm1STDr, ppm2STDr] = Region_selector2D(XNoiseSTD,ppm1STD,ppm2STD,1,10,10,160);

%% Selecting Region of interest
[Xdatar, ppm1datar, ppm2datar] = Region_selector2D(Xdata,ppm1data,ppm2data,1,10,10,160);
[XNoisedatar, ppm1datar, ppm2datar] = Region_selector2D(XNoisedata,ppm1data,ppm2data,1,10,10,160);


%%
figure,
contour(ppm1STDr,ppm2STDr,XSTDr,10,'b'); %Standard
set(gca,'XDir','reverse');
set(gca,'YDir','reverse');
    hold on;
contour(ppm1datar,ppm2datar,Xdatar,100,'r'); %Sample
set(gca,'XDir','reverse');
set(gca,'YDir','reverse');
title(['Blue Standard ',XTitleSTD,' Red Sample',XTitledata])


