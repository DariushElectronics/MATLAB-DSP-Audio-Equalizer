clc; clear;
% مسیر داده‌ها
dataDir = '/MATLAB Drive/MobileSensorData/';

% پیدا کردن فایل شما
files = dir(fullfile(dataDir, '*.mat'));
if isempty(files)
    error('فایلی پیدا نشد.');
end
[~, idx] = max([files.datenum]); % انتخاب آخرین فایل
targetFile = fullfile(dataDir, files(idx).name);

disp(['📂 Analyzing File: ', files(idx).name]);

% لود کردن داده‌ها
data = load(targetFile);

% نمایش نام تمام متغیرهای موجود در فایل
vars = fieldnames(data);
disp('---------------------------------');
disp('📋 متغیرهای پیدا شده در فایل:');
disp('---------------------------------');
for i = 1:length(vars)
    val = data.(vars{i});
    disp(['1. نام متغیر: ', vars{i}]);
    disp(['   نوع داده: ', class(val)]);
    
    if istimetable(val)
        disp(['   تعداد رکورد: ', num2str(height(val))]);
        disp(['   نام ستون‌ها: ', strjoin(val.Properties.VariableNames, ', ')]);
    elseif isnumeric(val)
        disp(['   ابعاد: ', mat2str(size(val))]);
    end
    disp('---------------------------------');
end