% Project: DSP Equalizer (Ultra-Advanced Edition)
clc; clear; close all;

%% 1. Setup & Config
baseDir = pwd;
addpath(genpath(baseDir)); % افزودن تمام زیرپوشه‌ها به صورت هوشمند
disp('🚀 DSP System: Starting Deep Analysis...');

try 
    cfg = config(); 
catch
    % تنظیمات پیش‌فرض برای اطمینان
    cfg.fs = 44100; cfg.filter_order = 4;
    cfg.bass_cutoff = 250; cfg.mid_range = [250, 4000]; cfg.treble_cutoff = 4000;
    cfg.gains.bass_db=6; cfg.gains.mid_db=0; cfg.gains.treble_db=-3;
end

%% 2. Load Audio Source
dataDir = '/MATLAB Drive/MobileSensorData/';
audioFiles = dir(fullfile(dataDir, '*.*'));
isAudio = contains({audioFiles.name}, {'.wav','.m4a','.mp4'}, 'IgnoreCase', true);

if ~any(isAudio), error('❌ No audio file found.'); end
[~, idx] = max([audioFiles(isAudio).datenum]); 
files = audioFiles(isAudio);
targetFile = files(idx).name;

disp(['📂 Analyzing Source: ', targetFile]);
[raw, fs] = audioread(fullfile(dataDir, targetFile));
if size(raw, 2) > 1, raw = mean(raw, 2); end % Mono conversion

%% 3. Signal Processing Core
disp('🎛️ Processing Signal Chain...');
% محاسبه خروجی نهایی
[mixed_signal, bass, mid, treble] = apply_equalizer(raw, fs, cfg);

%% 4. Advanced Visualization (The New Part)
disp('📊 Launching Engineering Dashboard (3 Windows)...');
% فراخوانی موتور گرافیکی جدید
visualizer_pro(raw, mixed_signal, fs, cfg);

%% 5. Generate Text Report
reportFile = 'Deep_Analysis_Report.txt';
diary(reportFile);
generate_report(mixed_signal, bass, mid, treble, fs);
diary off;

disp(['✅ Analysis Complete. Check the 3 figure windows and ', reportFile]);
