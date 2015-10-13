% ---------------------------------------------------------------------
% Project:      CARE
% ---------------------------------------------------------------------
% Quantlet:     CARE_estimate_rolling_figure
% ---------------------------------------------------------------------
% Description:  CARE_estimate_rolling_figure plots the estimated 
%               parameter alpha_1 across the three selected stock 
%               markets from 3 January 2006 to 31 December 2014, 
%               with 20 (upper panel) and 250 (lower panel) 
%               observations used in the rolling window exercise at 
%               fixed expectile level tau (0.05 or 0.01).
% ---------------------------------------------------------------------
% Usage:        CARE_estimate_rolling_figure
% ---------------------------------------------------------------------
% Inputs:       tau_005.mat, tau_001.mat
% ---------------------------------------------------------------------
% Output:       Time series of estimated parameter alpha_1
% ---------------------------------------------------------------------
% Keywords:     lCARE, expectiles, tail risk, risk management, index, 
%               returns, plot, time series, DAX, FTSE100, S&P500
% ---------------------------------------------------------------------
% See also:     CARE_estimate_rolling
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20150928
% ---------------------------------------------------------------------

%%  tau = 0.05

clear all; clc;
load('tau_005.mat');

figure;
subplot(2, 4, 1); plot(paras_DAX(:, 2), '-b', 'LineWidth', 1.5); title('DAX');
ylabel('Value'); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 5); plot(paras_DAX(:, 17), '-b', 'LineWidth', 1.5);
ylabel('Value'); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 2); plot(paras_FTSE(:, 2), '-b', 'LineWidth', 1.5); title('FTSE 100');
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 6); plot(paras_FTSE(:, 17), '-b', 'LineWidth', 1.5);
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 3); plot(paras_SP(:, 2), '-b', 'LineWidth', 1.5); title('S&P 500');
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 7); plot(paras_SP(:, 17), '-b', 'LineWidth', 1.5);
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);


%% tau = 0.01

clear all; clc;
load('tau_001.mat');

figure;
subplot(2, 4, 1); plot(paras_DAX(:, 2), '-b', 'LineWidth', 1.5); title('DAX');
ylabel('Value'); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 5); plot(paras_DAX(:, 17), '-b', 'LineWidth', 1.5);
ylabel('Value'); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 2); plot(paras_FTSE(:, 2), '-b', 'LineWidth', 1.5); title('FTSE 100');
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 6); plot(paras_FTSE(:, 17), '-b', 'LineWidth', 1.5);
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 3); plot(paras_SP(:, 2), '-b', 'LineWidth', 1.5); title('S&P 500');
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);

subplot(2, 4, 7); plot(paras_SP(:, 17), '-b', 'LineWidth', 1.5);
ylabel(''); ylim([-3, 3]); xlim([1, 2348]); 
Year = {'2006', '2010', '2014'}; hold on; set(gca, 'xtick', [1  1045 2088]);
Estimate = {'-3', '0', '3'}; hold on; set(gca, 'ytick', [-3 0 3]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);
