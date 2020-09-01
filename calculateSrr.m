% calculateSrr.m
% Author: Kevin Chu
% Last Modified: 03/16/2020

function SRR = calculateSrr(FTMclean, FTMnoisy)
    % Calculates the signal-to-reverberant ratio between a noisy (or
    % reverberant) FTM and a clean FTM. Method from Naylor
    %
    % Args:
    %   -FTMclean (nChannels x nFrames): FTM of clean signal
    %   -FTMnoisy (nChannels x nFrames): FTM of noisy or reverberant signal
    %
    % Returns:
    %   -SRR (double): signal-to-reverberant ratio (dB)
    %
    % Reference:
    % Speech Dereverberation
    
    SRR = 10*log10(norm(FTMclean,2)^2/norm(FTMnoisy-FTMclean,2)^2);
    
end