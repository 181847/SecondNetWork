function bin = hex2bin(hexString)
%hexString: a string which should present a hex number
%bin: row vector, convert the hexString to he 0 and 1 vector, 
%   notice that size(bin, 2) == 4 * size(hexString).

    bin = [];
    for i = 1:size(hexString, 2),
        dec = hex2dec(hexString(i));
        binS = dec2bin(dec);
        
        %ensure one hex character convert to 4 bin 
        bin = [bin [zeros(1, 4 - size(binS, 2)), binS2binV(binS)]];
    end
end
