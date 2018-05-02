%Return FFT data under 100
function fre_under_n = FFT(amplitude,n)
    frequency = abs(fft(amplitude));                                                                                          
    fre_under_n = frequency(frequency<n);
end

%N_Length = 2^nextpow2(L);
%fft_data = fft(amplitude, N_Length);
%fft_data_cut = ff(1:N_Length/2);
%fft_data_abs = abs(fft_data_cut);
%