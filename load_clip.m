function x = load_clip(filePath, fs, N)
% LOAD_CLIP  Read an audio file and make it: mono, fs Hz, exactly N samples.
%   x = load_clip(filePath, fs, N)

% 1) Read the file
[x, fsOriginal] = audioread(filePath);

% 2) Stereo -> mono  (average the two channels)
if size(x, 2) == 2
    mono = zeros(length(x), 1);              % empty column to fill
    for n = 1:length(x)                      % go through every sample
        left  = x(n, 1);                     % left value at sample n
        right = x(n, 2);                     % right value at sample n
        mono(n) = (left + right) / 2;        % their average
    end
    x = mono;
end

% 3) Resample to fs (e.g. 44100 Hz -> 16000 Hz)
if fsOriginal ~= fs
    x = resample(x, fs, fsOriginal);
end

% 4) Make the length exactly N samples
if length(x) > N
    x = x(1:N);                              % too long  -> cut the end
else
    x = [x; zeros(N - length(x), 1)];        % too short -> add zeros (silence)
end
end