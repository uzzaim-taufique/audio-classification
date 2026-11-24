% STEP1_PLOT_EXAMPLES  One clip of each class in time and frequency domain.

clear; clc; close all;
project_settings
load('file_list.mat');                 % gives filePaths, labels, folds

exampleRows = [2, 95, 23];             % speech, music, noise (4 s, foreground clips)

figure('Position', [100 100 1100 750]);

for c = 1:3
    i = exampleRows(c);
    x = load_clip(filePaths{i}, fs, N);

    % ---------------- time domain ----------------
    t = (0:N-1) / fs;                          % sample number -> seconds

    subplot(3, 2, 2*c - 1);                    % left column: plots 1, 3, 5
    plot(t, x);
    title([classNames{c} ' - time domain']);
    xlabel('Time (s)'); ylabel('Amplitude');
    grid on;

    % ---------------- frequency domain ----------------
    w = hann(N);                               % Hann window (smooth taper)
    X = fft(x .* w);                           % FFT of the windowed signal
    Xmag = abs(X);                             % magnitude of each frequency
    Xmag = Xmag(1 : N/2 + 1);                  % keep 0 Hz ... fs/2 only
    f = (0 : N/2) * fs / N;                    % frequency of each FFT bin (Hz)
    XdB = 20 * log10(Xmag / max(Xmag) + 1e-12);  % convert to decibels

    subplot(3, 2, 2*c);                        % right column: plots 2, 4, 6
    plot(f, XdB);
    title([classNames{c} ' - frequency domain']);
    xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
    ylim([-100 5]);
    grid on;
end

saveas(gcf, fullfile(resultsFolder, 'step1_examples.png'));
fprintf('Saved step1_examples.png in the results folder\n');