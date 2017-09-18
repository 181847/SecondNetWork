function bin = hex2bin(hexString)
%hexString 是以一个16进制的字符串形式
%bin 是一个数字形式的数组，对应hexString。
    dec = hex2dec(hexString);
    binS = dec2bin(dec);
    
    bin = zeros(size(binS));
    
    bin(findstr(binS, '1')) = 1;
end
