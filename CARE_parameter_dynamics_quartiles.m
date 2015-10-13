% ---------------------------------------------------------------------
% Project:      lCARE
% ---------------------------------------------------------------------
% Quantlet:     CARE_parameter_dynamics_quartiles
% ---------------------------------------------------------------------
% Description:  CARE_parameter_dynamics_quartiles calculates descriptive
%               statistics of estimated CARE parameters. All estimated 
%               CARE parameters based on the window covering one year, 
%               i.e., 250 observations, for the three stock market indices
%               from 3 January 2005 to 31 December 2014 (2608 trading days) 
%               are pooled together for the two expectile levels 
%               (0.05 and 0.01).
% ---------------------------------------------------------------------
% Usage:        CARE_parameter_dynamics_quartiles
% ---------------------------------------------------------------------
% Inputs:       Quartiles_tau_005.mat, Quartiles_tau_001.mat
% ---------------------------------------------------------------------
% Output:       Two 20 x 3 matrices
% ---------------------------------------------------------------------
% Keywords:     lCARE, expectiles, tail risk, risk management, index, 
%               returns, table, time series, DAX, FTSE100, S&P500
%               rolling windows
% ---------------------------------------------------------------------
% See also:     CARE_estimate_rolling
% ---------------------------------------------------------------------
% Author:       Xiu Xu, Andrija Mihoci 20150928
% ---------------------------------------------------------------------

clear all; clc;
load('Quartiles_tau_005');
paras_ALL_005 = [paras_DAX; paras_FTSE; paras_SP];
CARE_quartiles_005 = [quantile(paras_ALL_005, 0.25)', mean(paras_ALL_005)', quantile(paras_ALL_005, 0.75)'];

clear all; clc;
load('Quartiles_tau_001');
paras_ALL_001 = [paras_DAX; paras_FTSE; paras_SP];
CARE_quartiles_001 = [quantile(paras_ALL_001, 0.25)', mean(paras_ALL_001)', quantile(paras_ALL_001, 0.75)'];
