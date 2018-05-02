%Return Time Domain of sound
function T_vector = GetTimeDomain(Fs,amplitude)
    T = 1/Fs;  %time
    L = length(amplitude); %length of signal
    T_vector = (0:L-1)*T;  %Time vector
end

