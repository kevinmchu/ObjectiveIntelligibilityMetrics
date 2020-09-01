% calculateHitFa.m
% Author: Kevin Chu
% Last Modified: 03/19/2020

function [HIT, FA, HIT_FA] = calculateHitFa(FTMclean, FTMnoisy)
    % Calculates the hit rate, false alarm rate, and their difference
    % of the processed noisy signal wrt the clean signal. Adapted from Kim
    % et al., 2009
    %
    % Args:
    %   -FTMclean (nChannels x nFrames): FTM of clean signal
    %   -FTMnoisy (nChannels x nFrames): FTM of noisy or reverberant signal
    %
    % Returns:
    %   -HIT (double): hit rate
    %   -FA (double): false alarm rate
    %   -HIT_FA (double): the hit rate minus the false alarm rate
    %
    % Reference:
    % An algorithm that improves speech intelligibility in noise for 
    % normal-hearing listeners
    
    HIT = sum(FTMclean>0 & FTMnoisy>0,'all')/sum(FTMclean>0,'all');
    FA = sum(FTMclean==0 & FTMnoisy>0,'all')/sum(FTMclean==0,'all');
    HIT_FA = HIT - FA;

end