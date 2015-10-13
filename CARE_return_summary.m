% ---------------------------------------------------------------------
% Project:      CARE
% ---------------------------------------------------------------------
% Quantlet:     CARE_return_summary
% ---------------------------------------------------------------------
% Description:  CARE_return_summary provide descriptive statistics 
%               for the selected index return time series from 3 January 
%               2005 to 31 December 2014 (2608 trading days): mean, 
%               median, minimum (Min), maximum (Max), standard 
%               deviation (Std), skewness (Skew.) and kurtosis (Kurt.).
% ---------------------------------------------------------------------
% Usage:        CARE_return_summary
% ---------------------------------------------------------------------
% Inputs:       DataIndices.dat
% ---------------------------------------------------------------------
% Output:       3 x 7 table with descriptive statistics
% ---------------------------------------------------------------------
% Keywords:     lCARE, risk management, index, returns,
%               time series, DAX, FTSE100, S&P500, mean, 
%               median, minimum, maximum, standard 
%               deviation, skewness and kurtosis 
% ---------------------------------------------------------------------
% See also:     -
% ---------------------------------------------------------------------
% Author:       Xiu Xu, Andrija Mihoci 20150928
% ---------------------------------------------------------------------

clear all; clc;

data  = load('DataIndices.dat');
r_DAX = diff(log(data(:, 1)));      % r_DAX daily data
r_FTSE = diff(log(data(:, 2)));     % r_FTSE daily data
r_SP = diff(log(data(:, 3)));       % r_SP daily data

r = [r_DAX r_FTSE r_SP];
result = [(mean(r))' (median(r))' (min(r))' (max(r))' (std(r))'  (skewness(r))' (kurtosis(r))'];
