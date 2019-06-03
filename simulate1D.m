function [X] = simulate1D(Hdata, sigma, ppm)

% [X] = simulate1D(x,0, 1,intensities)

% Hdata:        1D chemical shifts
% sigma:        width or the signal (0.1)
% intensities:  intensities related to any given activity (a row vector)
%By Ricardo Moreira Borges (Rio de Janeiro, Brazil)
x = -5:5;
[row col] = size(Hdata);
X=zeros(1,length(ppm));
for ii = 1:row;
    X(ii,:) = 1/sqrt(2*pi)/sigma*exp(-(x-Hdata(ii,1)).^2/2/sigma/sigma);
end

for iii = 1:row;
    X(iii,:) = X(iii,:) * intensities(1,iii); 
end