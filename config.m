function cfg = config()
    %% Global Configuration
    cfg.fs = 44100;
    
    %% Filter Design
    cfg.filter_order = 4;
    cfg.bass_cutoff = 250; 
    cfg.mid_range = [250, 4000];
    cfg.treble_cutoff = 4000;
    
    %% Equalizer Gains (New Feature!)
    % تنظیمات گین بر حسب دسی‌بل (dB)
    % +dB : تقویت | 0 : بدون تغییر | -dB : تضعیف
    cfg.gains.bass_db   = 6;    % Bass Boost (تقویت باس)
    cfg.gains.mid_db    = 0;    % Flat
    cfg.gains.treble_db = -3;   % Cut Treble (کاهش صدای ریز)
    
    %% Visualization
    cfg.fft_n = 4096; % رزولوشن بالاتر برای FFT
end
