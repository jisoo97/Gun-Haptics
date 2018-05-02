%Return amplitud, Fs data of music with given name.
function [amplitude,Fs] = AudioRead(name)
    [amplitude,Fs] = audioread(name);
end

