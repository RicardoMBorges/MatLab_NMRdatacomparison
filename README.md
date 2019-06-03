# MatLab_NMRdatacomparison-
MatLab scripts for overlaying and marking matched signals for HSQC NMR compound identification. Entries are based on experimental NMR data (1H and 13C) organized following a template as .txt file.

% DataBase for Construction and Comparison
% Rules for the dataBASE txt files:
%  first line:      name of the compound
%   second line:    SMILES structure
%    third line:    Molecular Weight
%     forth line:   Heads(Number 1H 13C ...)
%      fifth line:  data (number(position) 1Hdata 13Cdata)

%Requirements from experimental data of a mixture
% ppm1:     1H experimental axis
% ppm2:     13C experimental axis
% functions: importHCdataNumber importHCdataDB simulateHSQC_2D semiAutoMatchHSQC

% Workflow designed by Ricardo M Borges (10-16-2018)
