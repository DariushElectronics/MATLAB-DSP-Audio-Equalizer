function [b, a] = design_butterworth(order, fc, fs, type)
    % DESIGN_BUTTERWORTH: IIR Digital Filter Design
    % Inputs:
    %   order: Filter order (slope)
    %   fc: Cutoff frequency (scalar for low/high, vector for bandpass)
    %   fs: Sampling rate
    %   type: 'low', 'high', 'bandpass'
    
    nyquist_freq = fs / 2;
    Wn = fc / nyquist_freq;
    
    % Validation
    if any(Wn >= 1) || any(Wn <= 0)
        error('❌ Error: Cutoff frequency must be less than fs/2.');
    end
    
    % Core design function
    [b, a] = butter(order, Wn, type);
end
