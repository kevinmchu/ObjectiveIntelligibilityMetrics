% calculateRmse.m
% Author: Kevin Chu
% Last Modified: 03/19/2020

function [RMSE, RMSE_SM, RMSE_OM] = calculateRmse(FTMclean, FTMnoisy)
    % Calculates the root mean squared error between a noisy (or
    % reverberant) FTM and a clean FTM
    %
    % Args:
    %   -FTMclean (nChannels x nFrames): FTM of clean signal
    %   -FTMnoisy (nChannels x nFrames): FTM of noisy or reverberant signal
    %
    % Returns:
    %   -RMSE (double): root mean squared error (total)
    %   -RMSE_SM (double): rmse of self-masking
    %   -RMSE_OM (double): rmse of overlap-masking
    
    RMSE = sqrt(mean((FTMnoisy - FTMclean).^2,'all'));
    RMSE_SM = sqrt(mean((FTMnoisy(FTMclean>0) - FTMclean(FTMclean>0)).^2));
    RMSE_OM = sqrt(mean((FTMnoisy(FTMclean==0).^2)));

end