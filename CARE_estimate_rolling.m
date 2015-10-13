% ---------------------------------------------------------------------
% Project:      lCARE
% ---------------------------------------------------------------------
% Quantlet:     CARE_estimate_rolling
% ---------------------------------------------------------------------
% Description:  CARE_estimate_rolling estimates the parameters of the 1st
%               CARE model with fix rolling window
% ---------------------------------------------------------------------
% Usage:        CARE_estimate_rolling(y, rolling, first, tau)
% ---------------------------------------------------------------------
% Inputs:       y - (n x 1) data
%               roll -(1 x 1) fixed rolling window
%               tau - (1 x 1) expectile level
% ---------------------------------------------------------------------
% Output:       Out - (n x 6)
%               (n x 2) estimated parameter vector 
%               (n x 1) evaluated loss function value
%               (n x 1) estimated expetile
% ---------------------------------------------------------------------
% Keywords:     lCARE, expectiles, tail risk, risk management, index, 
%               returns, table, time series, DAX, FTSE100, S&P500
%               rolling windows
% ---------------------------------------------------------------------
% See also:     
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20150303
% ---------------------------------------------------------------------

function Out = CARE_estimate_rolling(y, rolling, first, tau)
[n, ~]=size(y);
para = zeros(n - first + 1, 5);
eval_expetile = zeros(n - first + 1, 1);
eval_loss = zeros(n - first + 1, 1);

for i = first : 1 : n
    y_esti=y(i-rolling:i,1);                % rolling + 1 observations
   [th_est, loss_est] = CARE_estimation(y_esti, tau);     % Out = [th_est', loss_est]';
    para(i - first + 1, :) = th_est';
    eval_loss(i - first + 1, :)=loss_est;
    
    y_lag = y_esti(end);
    y_lag_plus = (y_lag .* (y_lag > 0)) .^ 2;
    y_lag_neg = (y_lag .* (y_lag < 0)) .^ 2;
    
    eval_expetile(i - first + 1, :) = th_est(1) + th_est(2) * y_lag + th_est(3) * y_lag_plus + th_est(4) * y_lag_neg;  % forecast the next period expectile  
end
Out = [para, eval_loss, eval_expetile];
end
