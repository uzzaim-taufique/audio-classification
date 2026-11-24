% PROJECT_SETTINGS  Values used by every step of the project.
% Run it at the top of each script by writing:  project_settings

% ---------- folders ----------
dataFolder = 'D:\AudioClassification\data\UrbanSound8K';   % change this on another PC
csvFile    = 'D:\AudioClassification\data\UrbanSound8K\UrbanSound8K.csv';
resultsFolder = 'D:\AudioClassification\results';

if ~exist(resultsFolder, 'dir')    % if the results folder does not exist yet...
    mkdir(resultsFolder);          % ...create it
end

% ---------- audio ----------
fs = 16000;            % sample rate we will use for every clip (Hz)
clipSeconds = 4;       % every clip will be exactly 4 seconds
N = fs * clipSeconds;  % number of samples per clip = 64000

% ---------- our 3 classes ----------
% label 1 = speech, label 2 = music, label 3 = noise
classNames = {'speech', 'music', 'noise'};

% UrbanSound8K classID  ->  our label
%   classID 2 (children_playing) -> 1 speech
%   classID 9 (street_music)     -> 2 music
%   all other classIDs           -> 3 noise