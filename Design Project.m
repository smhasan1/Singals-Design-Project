% Part 1: FIR Filter Design
% Q1
% Passband edge: 3600 Hz
% Stopband edge: 3200 Hz
% Sampling frequency: 8000 Hz
% Pass-band ripple <= 0.01
% Stopband ripple <= 0.0001
% 
% Design a narrow-band FIR filter
% Highpass filter
% a) Optimal Interpolation Factor M
% fp = 3600/8000 = 0.45
% fs = 3200/8000 = 0.4
% Mopt = 2.68 = 2 (rounded, even number for high pass filter)
% 
% b) Find bandedges of Ha(z) and HMa(z)
% Bandegdes of bandedge shaping filter Ha(z):
% fa,p = 0.1
% fa,s = 0.2
% % Bandegdes of masking filter HMa(z):
% fMa,p = 0.45
% fMa,s = 0.9
% 
% c
% Filter lengths of bandedge shaping filter and masking filter
% La = 66
% LMa = 11

%% d
% Filter lengths of bandedge shaping filter and masking filter using ifir
% As M=2 
% Normalized passband = 3600/8000 = 0.45
% Normalized stopband = 3200/8000 = 0.4
[h,g]=ifir(2,'high',[0.1 0.2],[.01 .0001]);
Hcas = conv(h,g);

% La = 73 and LMa = 11 which is within the limitations of the calculated
% values in c).
%% e
% Frequency response of all filters
figure

freqz(h,1);
title('Intrpolated Filter Ha(z)')
figure

freqz(g,1);
title('Masking Filter HMa(z)')
figure

freqz(Hcas,1);
title('Overall Filter')
%% Q2
% Normalized passband edge: 0.194
% Normalized stopband edge: 0.2
% Passband ripple: 0.01
% Stopband ripple: 0.001

% a) M = 6.45 = 6 

% b) Table
% M  Case(A/B) Bandedges of Ha(z) Bandedges of HMa(z) Bandedges of HMc(z)   
% 4    B       [0.2 0.224]           [0.056 0.2]          [0.194 0.3]
% %   La = 111; LMa = 19; LMc = 26; LTotal = 156
% 5    B       [0 0.03]           [0.006 0.2]          [0.194 0.2]
% %   La = 89; LMa = 15; LMc = 440; LTotal = 544
% 6    A       [0.164 0.2]           [0.194 0.3]          [0.139 0.2]
% %   La = 74; LMa = 26; LMc = 44; LTotal = 144
% 7    A       [0.358 0.4]           [0.194 0.229]          [0.092 0.2]
% %   La = 64; LMa = 76; LMc = 25; LTotal = 165
% 8    B       [0.4 0.448]           [0.181 0.2]          [0.194 0.3]
% %   La = 56; LMa = 139; LMc = 26; LTotal = 221

% c) M = 6 is optimal value as it has the lowest filter length.


%% d) Sub Filter design
% Ha(z)
F = [0.164 0.2];
A=[1,0];
Dev=[0.0085,0.00085];

[N,Fi,Ai,W]=firpmord(F,A,Dev,1);
ha=firpm(N+1,Fi,Ai,W);
%freqz(ha);

% HMa(z)
F = [0.194 0.3];
A=[1,0];
Dev=[0.0085,0.00085];

[N,Fi,Ai,W]=firpmord(F,A,Dev,1);
hma=firpm(N,Fi,Ai,W);
hma = [0 0 0 0 0 0 0 0 0 0 hma 0 0 0 0 0 0 0 0 0 0]; %zero padding
% Hmc

F = [0.139 0.2];
A=[1,0];
Dev=[0.0085,0.00085];

[N,Fi,Ai,W]=firpmord(F,A,Dev,1);
hmc=firpm(N+1,Fi,Ai,W); % N+1 to equal lenght 
%% e) Frequency response in linear scale 
% Ha
sf1 = 0.164;
pf1 = 0.2;

pb = linspace(pf1,sf1,512)*pi;
[haf,w] = freqz(ha,1);
haf1 = freqz(ha,pb);
figure;
plot(w/pi,abs(haf))
ylabel('Magnitude')
title('Ha(z) in linear scale')

% Hma
sf1 = 0.194;
pf1 = 0.3;

pb = linspace(pf1,sf1,512)*pi;
[hmaf,w] = freqz(hma,1);
hmaf1 = freqz(hma,pb);
figure;
plot(w/pi,abs(hmaf))
ylabel('Magnitude')
title('Hma(z) in linear scale')
% Hmc
sf1 = 0.139;
pf1 = 0.2;

pb = linspace(pf1,sf1,512)*pi;
[hmcf,w] = freqz(hmc,1);
hmcf1 = freqz(hmc,pb);
figure;
plot(w/pi,abs(hmcf))
ylabel('Magnitude')
title('Hmc(z) in linear scale')


%% f) 
% h = (ha.*hma)+ (hc-ha)hmc;
t = 1:75;
hc = zeros(1,75);
hc(1,38) = 1;
% Frequency response of the overall filter 
Ha = upsample(ha,6);
Hc = upsample(hc-ha,6);
H1 = conv(Ha,hma);
H2 = conv(Hc,hmc);
H = (H1+H2);
figure;
freqz(H);
ylabel('Magnitude')
title('Overall Filter')
sf1 = 0.139;
pf1 = 0.2;

pb = linspace(pf1,sf1,512)*pi;
[overh,w] = freqz(H,1);
overh1 = freqz(H,pb);
figure;
plot(w/pi,abs(overh))
ylabel('Magnitude')
title('Overall Filter')
%% g
% Check wheather frequency response meets passband and stopband
% specifications


% Show the zoomed in values to show that all the values are within specs
%% PART2
% sampling frequency is 360Hz
% passband and stopband ripples are: 0.01 and 0.001
plot(t,ecg);
% Using High Pass filter 
% Stopband edge: 0.17Hz
% Passband edge: 1.0Hz  
F = [0.17,1];
A = [0,1];
Dev = [0.01,0.001]; 
fs = 360;
[N,Fi,Ai,W] = firpmord(F,A,Dev,fs);
h = firpm(N,Fi,Ai,W);
%%figure;
%freqz(h,1);
%title('filter h')

y1 = conv(h,ecg);
% Using Low pass filter 
% Passband edge: 40Hz
% Stopband edge: 54Hz
F = [40,54];
A = [1,0];
[N,Fi,Ai,W] = firpmord(F,A,Dev,fs);
h1 = firpm(N,Fi,Ai,W);

y2 = conv(h1,y1);

figure
plot(t,y2(1:7201));
% We have a small delay in the filtered signal because Finite impulse 
% response filters often delay all frequency components by the same amount.
% grpdelay(firf,N,Fs) can be used to check the group delay.
% We have a delay because 