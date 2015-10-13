% ---------------------------------------------------------------------
% Project:      CARE
% ---------------------------------------------------------------------
% Quantlet:     CARE_estimate_rolling_001
% ---------------------------------------------------------------------
% Description:  CARE_estimate_rolling_001 estimates the parameters
%               of a CARE model with fix rolling window for selected
%               indices. Selected rolling window lengths: 1 month
%               (20 days), 3 months (60 days), 6 months (125 days) and
%               12 months (250 days) for tau = 0.01
% ---------------------------------------------------------------------
% Usage:        CARE_estimate_rolling_001
% ---------------------------------------------------------------------
% Inputs:       DataIndices.dat
% ---------------------------------------------------------------------
% Output:       tau_001.mat
% ---------------------------------------------------------------------
% Keywords:     lCARE, expectiles, tail risk, risk management, index, 
%               returns, plot, time series, DAX, FTSE100, S&P500
% ---------------------------------------------------------------------
% See also:     CARE_estimate_rolling_figure, CARE_estimate_rolling_005
% ---------------------------------------------------------------------
% Author:       Xiu Xu, Andrija Mihoci, 20150928
% ---------------------------------------------------------------------

clear all; clc;

tic;
data  = load('DataIndices.dat');
r_DAX = diff(log(data(:, 1)));      % r_DAX daily data
r_FTSE = diff(log(data(:, 2)));     % r_FTSE daily data
r_SP = diff(log(data(:, 3)));       % r_SP daily data
tau = 0.01;                         % tau = 0.05;
roll = [20 60 125 250];
n = length(data) - 1;
first = 261;                        % first day: 20060102

% DAX
paras_DAX = zeros(n - first + 1, 5 * length(roll));
loss_DAX = zeros(n - first + 1, length(roll));
esti_expectile_DAX = zeros(n - first + 1, length(roll));

% FTSE
paras_FTSE = zeros(n - first + 1, 5 * length(roll));
loss_FTSE = zeros(n - first + 1, length(roll));
esti_expectile_FTSE = zeros(n - first + 1, length(roll));

% SP
paras_SP = zeros(n - first + 1, 5 * length(roll));
loss_SP = zeros(n - first + 1, length(roll));
esti_expectile_SP = zeros(n - first + 1, length(roll));
toc;

tic;
hwait = waitbar(0, 'Reverse progress...');
for i = 1 : 1 : length(roll)
    [out_DAX] = CARE_estimate_rolling(r_DAX, roll(i), first, tau);
    paras_DAX(:, (5 * i - 4) : 5 * i) = out_DAX(:, 1 : 5);
    loss_DAX(:, i) = out_DAX(:, 6);
    esti_expectile_DAX(:, i) = out_DAX(:, 7);
    
    [out_FTSE] = CARE_estimate_rolling(r_FTSE, roll(i), first, tau);
    paras_FTSE(:, (5 * i - 4) : 5 * i) = out_FTSE(:, 1 : 5);
    loss_FTSE(:, i) = out_FTSE(:, 6);
    esti_expectile_FTSE(:, i) = out_FTSE(:, 7);
    
    [out_FTSE] = CARE_estimate_rolling(r_FTSE, roll(i), first, tau);
    paras_FTSE(:, (5 * i - 4) : 5 * i) = out_FTSE(:, 1 : 5);
    loss_FTSE(:, i) = out_FTSE(:, 6);
    esti_expectile_FTSE(:, i) = out_FTSE(:, 7);

    waitbar((length(roll) - i) / length(roll))
end
toc;

save tau_001.mat;
