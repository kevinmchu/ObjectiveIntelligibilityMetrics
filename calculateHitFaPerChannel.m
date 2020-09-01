% calculateHitFaPerChannel.m
% Author: Kevin Chu
% Last Modified: 04/01/2020

function [HIT, FA, nH0, nH1] = calculateHitFaPerChannel(FTMclean, FTMnoisy)
    % Calculates the hit rate and false alarm rate per channel
    %
    % Args:
    %   -FTMclean (nChannels x nFrames): FTM of clean signal
    %   -FTMnoisy (nChannels x nFrames): FTM of noisy or reverberant signal
    %
    % Returns:
    %   -HIT (22x1 array): hit rate
    %   -FA (22x1 array): false alarm rate
    %   -nH0 (22x1 array): number of negative examples (e.g. no pulses
    %   present)
    %   -nH1 (22x1 array): number of positive examples (e.g. pulses
    %   present)
    %
    % Reference:
    % An algorithm that improves speech intelligibility in noise for 
    % normal-hearing listeners
    
    % Number of hits and false alarms
    HIT = sum(FTMclean>0 & FTMnoisy>0,2);
    FA = sum(FTMclean==0 & FTMnoisy>0,2);
    
    % Number of positive and negative examples
    nH0 = sum(FTMclean==0,2);
    nH1 = sum(FTMclean>0,2);

end