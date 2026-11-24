% MAKE_FILE_LIST  Read UrbanSound8K.csv and build the list of all clips.
% Output: file_list.mat containing filePaths, labels, folds

clear; clc;
project_settings

% ---------- 1) read the CSV ----------
T = readtable(csvFile, 'VariableNamingRule', 'preserve');
numClips = height(T);                 % number of rows = number of clips
fprintf('Clips in CSV: %d\n\n', numClips);

% ---------- 2) make empty containers ----------
filePaths = cell(numClips, 1);        % list of text (file paths)
labels    = zeros(numClips, 1);       % our label for each clip: 1, 2 or 3
folds     = zeros(numClips, 1);       % fold number of each clip: 1 ... 10

% ---------- 3) fill them, one row at a time ----------
for i = 1:numClips
    fileName = T.slice_file_name{i};  % e.g. '100032-3-0-0.wav'
    foldNum  = T.fold(i);             % e.g. 5
    classID  = T.classID(i);          % e.g. 3

    % full path:  dataFolder \ fold5 \ 100032-3-0-0.wav
    filePaths{i} = fullfile(dataFolder, ['fold' num2str(foldNum)], fileName);

    % convert UrbanSound8K classID (0-9) to our label (1-3)
    if classID == 2              % children_playing
        labels(i) = 1;           % speech
    elseif classID == 9          % street_music
        labels(i) = 2;           % music
    else                         % everything else
        labels(i) = 3;           % noise
    end

    folds(i) = foldNum;
end

% ---------- 4) check that every file really exists ----------
missing = 0;
for i = 1:numClips
    if ~exist(filePaths{i}, 'file')
        missing = missing + 1;
    end
end
fprintf('Missing files: %d\n\n', missing);

% ---------- 5) count clips per class ----------
for c = 1:3
    fprintf('%s : %d clips\n', classNames{c}, sum(labels == c));
end

% ---------- 6) save the list for later steps ----------
save('file_list.mat', 'filePaths', 'labels', 'folds');
fprintf('\nSaved file_list.mat\n');