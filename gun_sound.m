%%Read audio file y= amplitude, fs = frequency
[amplitude,Fs] = audioread('flashbang-1.wav');
%sound(y,fs);  

%%converting frequency to time
T = 1/Fs;  %time
L = length(amplitude); %length of signal
T_vector = (0:L-1)*T;  %Time vector

%%plot
plot(T_vector,amplitude) %Time-Amplitude Graph
xlabel('Seconds'); ylabel('Amplitude');

%%FFT
frequency = abs(fft(amplitude));                                                                                          
under_100 = frequency(frequency<100);

%Frequency distiribution counting
data = zeros(1, 100);
for n=1:length(under_100)
    tmp = under_100(n);
    frequency_int = floor(tmp);
    data(frequency_int + 1)= data(frequency_int+1)+1;
end

plot(data);
plot(data(1:40));
xlabel('Frequency');

%%FFT reverse
