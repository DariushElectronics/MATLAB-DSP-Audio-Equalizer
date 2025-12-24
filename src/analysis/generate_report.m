function generate_report(raw, bass, mid, treble, fs)
    % GENERATE_REPORT: Prints detailed signal statistics to console/file
    
    % Helper functions
    calc_rms = @(x) sqrt(mean(x.^2));
    calc_peak = @(x) max(abs(x));
    calc_energy = @(x) sum(x.^2);
    calc_crest = @(x) max(abs(x))/sqrt(mean(x.^2));
    
    signals = {raw, bass, mid, treble};
    names = {'Input (Raw)', 'Bass Band', 'Mid Band', 'Treble Band'};
    total_energy = calc_energy(raw);
    
    disp(' ');
    disp('========================================================================');
    disp('📊 ENGINEERING SIGNAL REPORT (Detailed Statistics)');
    disp('========================================================================');
    fprintf('%-15s | %-10s | %-10s | %-10s | %-10s\n', ...
            'Signal Name', 'RMS Val', 'Peak Val', 'Crest Fac', 'Energy %');
    disp('------------------------------------------------------------------------');
    
    for i = 1:4
        sig = signals{i};
        val_energy_pct = (calc_energy(sig) / total_energy) * 100;
        
        fprintf('%-15s | %-10.4f | %-10.4f | %-10.2f | %-9.2f%%\n', ...
                names{i}, calc_rms(sig), calc_peak(sig), calc_crest(sig), val_energy_pct);
    end
    disp('========================================================================');
end
