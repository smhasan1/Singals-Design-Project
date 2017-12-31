# Singals Design Project
Q1. Design a narrowband FIR filter using the interpolated finite impulse response (IFIR)technique. The filter should meet the following specifications:  

Passband edge: 3600 Hz  
Stopband edge: 3200 Hz  
Sampling frequency: 8000 Hz  
Pass-band ripple <= 0.01  
Stopband ripple <= 0.0001  

Design the filter using Matlab command: "ifir"  

(a) Find an optimal interpolation factor, M.  
(b) Find bandedges of bandedge shaping filter Ha(z) and masking filter HMa(z).  
(c) Calculate the filter lengths of bandedge shaping filter and masking filter.  
(d) Design the filter using "ifir". What are the final filter lengths for bandedge
shaping filter and masking filter? Are they the same as calculated values in (c)?  
(e) Plot the frequency response of interpolated bandedge shaping filter, masking filter, and overall filter.  

Q2. Design an FIR filter using the Frequency-Response Masking technique. The filter should meet the following specifications:  

Normalized passband edge: 0.194  
Normalized stopband edge: 0.2  
Passband ripple: 0.01  
Stopband ripple: 0.001  

Design the filter according to the procedures given in Chapter 8.  
(a) Calculate the optimum interpolation factor, Mopt, using formula given in Chapter 8.  
(b) Find the parameters, La, LMa, LMc, LTotal are the filter lengths of bandedge shaping filter, upper branch masking filter, lower branch masking filter, and the sum of La, LMa and LMc, respectively.  
(c) Determine the optimum interpolation factor based on the Table.  
(d) Design the bandedge shaping filter, upper branch masking filter, lower branch masking filter use “firpm” with the bandedges found in the Table and taking 85% of the given ripples for each filter.  
(e) Write a Matlab program to find the frequency response in linear scale. (Hint: you can develop the program based on the frequency response formula for Type I and Type II filters given in Chapter 7.).  
(f) Use the program in (e) to find the frequency responses of all 3 filters and combine them to form the overall filter.  
(g) Zoom in to passband and stopband regions to verify whether the frequency response of the overall filter meets the given specifications. If not, re-design the subfilters until the overall filter meets the given specifications.  
(Note: You need to plot the 3 frequency responses for the overall filter in linear scale: (1) overall filter; (2) passband details; (3) stopband details.)  

Part II Remove noises in ECG signal.  

1. Brief Introduction of ECG Signal  
Electrocardiography (ECG) is a technique to capture the electrical activities of a heart against time. The heart is an organ that pumps blood throughout the body in a rhythmic fashion called a heartbeat. Electrical impulses captured in an ECG test provide rich information about the biological activities of the heart, which helps medical professionals to identify heart problems.  
Early studies in the 1950s and 1970s have shown that the ECG signal is generated from the depolarization and repolarization processes in the heart cell generating a propagation of dipole wavefront across the tissue of the heart. Figure 1 illustrates a single cycle regular Lead II ECG signal drawn on a standard ECG paper. The major deflections are labeled in alphabetical order, namely, P wave, QRS complex, T wave and U wave.  
The P wave is relative to the atrial depolarization. Following that, the QRS complex
corresponds to the ventricular depolarization. Note that the atria repolarization also occurs during the QRS complex but its amplitude is insignificant in the ECG waveform. The T wave refers to the repolarization of the ventricles.  
These waves and segments are measured and commonly used by medical professionals for diagnosis and evaluation. A more detailed mapping of heart activity leading to the overall ECG cardiac cycle is shown in Figure 2. Heart rate is measured by the time interval between two successive R peaks.  

ECG signal is often corrupted with various forms of noises and artifacts. Hence, it is often difficult to automatically identify important signal features. Pre-processing steps might help improve the signal to noise ratio (SNR) of the ECG signal, so as to make feature detection techniques more effective and accurate. The most commonly found noise types observed in the ECG signal electrode contact noise, motion artifacts, respiration noise, and powerline noise. The respiration noise induces a drift in the baseline of the measured ECG signal, which is often a sinusoidal component at the frequency of respiration, i.e. 0.15 to 0.3Hz. The powerline noise is at frequency 50/60Hz.  

The ECG data given in the project (download from course website) is corrupted by respiration and powerline noises. Your task is to design two FIR filters to remove these noises, i.e. one filter to remove respiration noise, and another filter to remove powerline noise. This can be done by using following filters:
