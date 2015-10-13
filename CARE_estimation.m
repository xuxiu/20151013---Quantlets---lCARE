% ---------------------------------------------------------------------
% Project:      CARE
% ---------------------------------------------------------------------
% Quantlet:     CARE_estimation1
% ---------------------------------------------------------------------
% Description:  CARE_estimation1 estimates the parameters of the 1st
%               CARE model
% ---------------------------------------------------------------------
% Usage:        CARE_estimation1(y, tau)
% ---------------------------------------------------------------------
% Inputs:       y - (n x 1) data
%               tau - (1 x 1) expectile level
% ---------------------------------------------------------------------
% Output:       Out - (2 x 1) estimated parameter vector and (1 x 1)
%               evaluated loss function value
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20141203
% ---------------------------------------------------------------------
function Out = CARE_estimation(y, tau)

  Objective = @(th) CARE_loss(y, tau, th);
  Options = optimset('Display', 'off', 'Algorithm', 'interior-point', 'MaxIter', 500);
  th0 = [-1.00, 0.50, 0.1, 0.1]';
  [th_est, loss_est] = fminunc(Objective, th0, Options);
  
  % next day expectile
  y_plus = (y(end) .* (y(end) > 0)) .^ 2;
  y_neg = (y(end) .* (y(end) < 0)) .^ 2;
  expectile_est = th_est(1) + th_est(2) * y(end) + th_est(3) * y_plus + th_est(4) * y_neg;
  
  Out = [th_est', loss_est, expectile_est]';
end
