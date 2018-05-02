%Get frequency and Show the Distribution
function frequency_count = CountFrequency(frequency,n)
    frequency_count = zeros(1, n);
    for n=1:length(frequency)
        tmp = frequency(n);
        frequency_int = floor(tmp);
        frequency_count(frequency_int + 1)= frequency_count(frequency_int+1)+1;
    end
    plot(frequency_count);
    xlabel('Frequency');
end

