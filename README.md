# Audio Classification: Speech, Music and Noise

Signals and Systems Lab semester project, NUST College of E&ME (Fall 2026).

Classifies 4-second audio clips into **speech**, **music** or **noise** using
signal processing features (filtering, ZCR, RMS, energy, MFCC, pitch) and a neural network.
Signal processing in MATLAB; neural network in Python.

## Setup
1. Download UrbanSound8K: https://www.kaggle.com/datasets/chrisfilo/urbansound8k
2. Extract it so the folds and CSV are in `data/UrbanSound8K/`
3. Change the three folder paths at the top of `project_settings.m`
4. In MATLAB run `make_file_list`, then `step1_plot_examples`

## Progress
- [x] Step 1: Loading and understanding the data
- [ ] Step 2: Digital filters
- [ ] Step 3: Time-domain features
- [ ] Step 4: MFCC
- [ ] Step 5: Pitch detection
- [ ] Step 6: Data augmentation
- [ ] Step 7: Feature dataset
- [ ] Step 8: Neural network (Python)
- [ ] Step 9: Noise robustness (AWGN, Rayleigh, Nakagami-m)
- [ ] Step 10: Demo and report