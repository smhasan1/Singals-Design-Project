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
