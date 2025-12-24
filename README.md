# 🎛️ MATLAB DSP Equalizer & Analyzer (Professional Edition)

An advanced Audio Signal Processing project implemented in MATLAB. This system features a **3-band parametric equalizer**, **dynamic signal mixing**, and a comprehensive **engineering dashboard** for time-frequency analysis.

## 🚀 Key Features
- **3-Band Equalizer:** Customizable Butterworth filters (Bass, Mid, Treble) with adjustable Gain (dB).
- **Smart Mixing Engine:** Converts dB gains to linear scale and mixes bands with soft-clipping protection.
- **Advanced Visualization:**
  - **Spectrogram:** Time-Frequency heatmap analysis.
  - **PSD (Welch Method):** Accurate Power Spectral Density estimation.
  - **Pole-Zero Plots:** Stability analysis of IIR filters.
- **Modular Architecture:** Clean separation of concerns (`src/filters`, `src/processing`, `src/analysis`).

## 📂 Project Structure
```text
MATLAB-DSP-Equalizer/
├── src/
│   ├── filters/       # IIR Filter Design (Butterworth)
│   ├── processing/    # Signal Mixing & Gain Control logic
│   ├── analysis/      # FFT & Statistical calculations
│   └── utils/         # Advanced Plotting Engine (visualizer_pro)
├── data/              # Input audio files
├── config.m           # Global Configuration (Cutoffs, Gains, Order)
├── main.m             # Application Entry Point
└── README.md          # Documentation


🛠️ Engineering Concepts Used
This project demonstrates proficiency in:
Digital Filter Design: Using butter and freqz for Band-pass/Low-pass/High-pass filtering.
Spectral Analysis: Fast Fourier Transform (FFT) and Power Spectral Density (PSD).
System Stability: Z-plane analysis (Pole-Zero mapping).
Object-Oriented Thinking: Modular function design and structured data flow.
📊 Outputs & Visualization
The system generates 3 engineering windows:
Time & Statistics: Comparison of raw vs. processed signal + Amplitude Histogram (PDF).
Spectral Analysis: PSD comparison + Output Spectrogram.
Filter Engineering: Bode plots (Magnitude/Phase) and Stability check.
