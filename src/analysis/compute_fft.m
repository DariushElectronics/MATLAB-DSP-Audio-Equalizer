function [f, P1] = compute_fft(x, fs)
    % COMPUTE_FFT: Single-Sided Amplitude Spectrum
    L = length(x);
    Y = fft(x);
    P2 = abs(Y/L);
    P1 = P2(1:floor(L/2)+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(L/2))/L;
end
