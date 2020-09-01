% calculateEcm.m
% Author: Kevin Chu
% Last Modified: 03/17/2020

function ECM = calculateEcm(FTMclean, FTMnoisy, f_stim)
    % Calculates the envelope-correlation based measure between a noisy (or
    % reverberant) FTM and a clean FTM. Method from Yousefian and Loizou,
    % 2012
    %
    % Args:
    %   -FTMclean (nChannels x nFrames): FTM of clean signal
    %   -FTMnoisy (nChannels x nFrames): FTM of noisy or reverberant signal
    %   -f_stim (double): stimulation frequency of CI in Hz
    %
    % Returns:
    %   -ECM (double): envelope-correlation based measure
    %
    % Reference:
    % -Predicting the speech reception threshold of cochlear implant
    % listeners using an envelope-correlation based measure

    % Downsample envelopes to 50Hz
    f_env = 50;
    FTMclean = resample(FTMclean',f_env,f_stim)';
    FTMnoisy = resample(FTMnoisy',f_env,f_stim)';
    
    % Mean across time
    muClean = repmat(mean(FTMclean,2),1,size(FTMclean,2));
    muNoisy = repmat(mean(FTMnoisy,2),1,size(FTMnoisy,2));
    
    % Add small error term if mean across time is 0
    muClean(muClean==0) = eps;
    muNoisy(muNoisy==0) = eps;
    
    % Covariance for each frequency band
    rk = sum((FTMclean-muClean).*(FTMnoisy-muNoisy),2)./(sqrt(sum((FTMclean-muClean).^2,2).*sum((FTMnoisy-muNoisy).^2,2)));    
    ECM = mean(rk.^2);
    
end