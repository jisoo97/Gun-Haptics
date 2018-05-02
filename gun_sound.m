%%Read audio file y= amplitude, fs = frequency
name = 'flashbang-1.wav';
[amplitude,fs] = AudioRead(name);

%%converting frequency to time
t_vector = GetTimeDomain(fs,amplitude);

%Time-Amplitude Graph
DrawTimeAmpPlot(t_vector,amplitude);

%%FFT
fre_under_100 = FFT(amplitude,100); %35834
%fre_under_n = FFT(amplitude,length(amplitude)); %36432
%Thus negligiable

%Frequency distiribution counting
frequency_count = CountFrequency(fre_under_100,100);

%Sound to Haptic Transition 
haptic_data = SoundToHaptic(fre_under_100);

%%Data complementation
complement_data = HapticDataManipulation(haptic_data);

%%FFT reverse
reversed_amplitude = ifft(complement_data);
for n=1:length(reversed_amplitude)
    tmp = reversed_amplitude(n);
    if (tmp>10000 || tmp < -10000)
        reversed_amplitude(n)=0;
    end
end
T = T_vector(1:length(reversed_amplitude));
plot(T,reversed_amplitude);


