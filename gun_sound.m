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


%%Transition
%Direct Transition for now. 
haptic_data = frequency;

%%complemented data
complement_data = haptic_data;
for n=1:length(complement_data)
    tmp = complement_data(n);
    if (tmp>=40 && tmp<50)
        complement_data(n)=tmp-10;
    end
end

%%FFT reverse
reversed_amplitude = fft(complement_data);
for n=1:length(reversed_amplitude)
    tmp = reversed_amplitude(n);
    if (tmp>10000 || tmp < -10000)
        reversed_amplitude(n)=0;
    end
end
plot(T_vector,reversed_amplitude);
%-symmetric problem


