function binVector = dec2binV(decNumber)
%convert the number to row vector of 0 and 1.

    binS = dec2bin(decNumber);
    binVector = binS2binV(binS);
end
