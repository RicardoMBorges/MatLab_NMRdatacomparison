% DataBase for Construction and Comparison
% Rules for the dataBASE txt files:
%  first line:      name of the compound
%   second line:    SMILES structure
%    third line:    Molecular Weight
%     forth line:   Heads(Number 1H 13C ...)
%      fifth line:  data (number(position) 1Hdata 13Cdata)

%Requirements

% ppm1:     1H experimental axis
% ppm2:     13C experimental axis
% functions: importHCdataNumber importHCdataDB simulateHSQC_2D semiAutoMatchHSQC

% Workflow designed by Ricardo M Borges (10-16-2018)

%%
cd('/Users/Ricardo/Dropbox (Edison_Lab@UGA)/Rahil&Ricardo/nubbesDb/entries')
DB=dir('*.txt'); 
%%
for i=1:4 %length(DB)
    CompoundNames{i}=DB(i).name;
filename{i} = CompoundNames{i};
SMILES{i} = importHCdataNumber(CompoundNames{i}, 2, 2);
delimiter{i} = '\t'; 
startRow{i} = 5; 
formatSpec{i} = '%*s%s%s%[^\n\r]';
fileID{i} = fopen(filename{i},'r');
dataArray{i} = textscan(fileID{i}, formatSpec{i}, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines' ,startRow{i}-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
endRow{i}=length(dataArray{i});
    HCdata{i} = importHCdataDB(CompoundNames{i}, startRow{i}, endRow{i});
    HCdataNumber{i} = importHCdataNumber(CompoundNames{i}, startRow{i}, endRow{i});
clear dataArray endRow
    simNMRdata{i} = simulateHSQC_2D(HCdata{i}, ppm1, ppm2);

end
%% Test the ploting of the DB data
%contour(ppm1,ppm2,simNMRdata{1, idx}),set(gca,'XDir','reverse');set(gca,'YDir','reverse');
%% User can use a peak picked table 
Xdata=simulateHSQC_2D(HCdata_Peaks, ppm1, ppm2);
contour(ppm1,ppm2,Xdata),set(gca,'XDir','reverse');set(gca,'YDir','reverse');
%% This step will plot the experimental X matrix and overlay the simulated
% matrix of those compounds that matched the "name" searched. User should 
% zoom in and select those matching signals if there is any. Once done,
% right click to break the loop and go for the next compound.
idx = find(contains(CompoundNames,'Kaemp')); % find sections of compound name
for i=idx
    [H{i},matchInfo{i}]=semiAutoMatchHSQC(ppm1,ppm2,Xdata,60,simNMRdata{i},HCdata{i},CompoundNames{i});
end