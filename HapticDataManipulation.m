function complement_data = HapticDataManipulation(haptic_data)
    complement_data = haptic_data;
    for n=1:length(complement_data)
        tmp = complement_data(n);
        if (tmp>=40 && tmp<50)
            complement_data(n)=tmp-10;
        end
    end
end

