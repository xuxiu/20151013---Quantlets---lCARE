% ---------------------------------------------------------------------
% Project:      CARE
% ---------------------------------------------------------------------
% Quantlet:     CARE_loss1
% ---------------------------------------------------------------------
% Description:  CARE_loss1 evaluates the loss function of the 1st
%               CARE model
% ---------------------------------------------------------------------
% Usage:        CARE_loss2(y, tau, th)
% ---------------------------------------------------------------------
% Inputs:       y - (n x 1) data
%               tau - (1 x 1) expectile level
%               th - (2 x 1) parameter vector
% ---------------------------------------------------------------------
% Output:       Out - (1 x 1) evaluated loss function
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Xiu Xu 20150123
% ---------------------------------------------------------------------
function Out = CARE_loss2(y, tau, th)
  n = length(y);
  y_lag = y(1 : n - 1);
  y_lag_plus = (max(zeros(n-1,1),y(1 : n - 1))).^2;
  y_lag_neg = (min(zeros(n-1,1),y(1 : n - 1))).^2;
  sigma2 = th(5);
  
  Out = sum(CARE_logfun(y(2 : n) - th(1) - th(2) * y_lag - th(3) * y_lag_plus - th(4) * y_lag_neg, sigma2, tau));
end




