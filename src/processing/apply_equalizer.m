function [mixed_out, bass, mid, treble] = apply_equalizer(input_signal, fs, cfg)
    % APPLY_EQUALIZER v2.0: Filter application and Gain Mixing
    
    % 1. Convert dB Gains to Linear Scale
    % Formula: Gain = 10^(dB/20)
    g_bass = 10^(cfg.gains.bass_db / 20);
    g_mid = 10^(cfg.gains.mid_db / 20);
    g_treble = 10^(cfg.gains.treble_db / 20);
    
    % 2. Design Filters
    [b_low, a_low] = design_butterworth(cfg.filter_order, cfg.bass_cutoff, fs, 'low');
    [b_mid, a_mid] = design_butterworth(cfg.filter_order, cfg.mid_range, fs, 'bandpass');
    [b_high, a_high] = design_butterworth(cfg.filter_order, cfg.treble_cutoff, fs, 'high');
    
    % 3. Filtering (Zero-Phase)
    bass = filtfilt(b_low, a_low, input_signal);
    mid = filtfilt(b_mid, a_mid, input_signal);
    treble = filtfilt(b_high, a_high, input_signal);
    
    % 4. Mixing
    mixed_out = (bass * g_bass) + (mid * g_mid) + (treble * g_treble);
    
    % Soft Clipping Protection
    max_val = max(abs(mixed_out));
    if max_val > 1
        mixed_out = mixed_out / max_val;
    end
end
