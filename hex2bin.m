function bin = hex2bin(hexString)
%hexString 是以一个16进制的字符串形式
%bin 是一个数字形式的数组，对应hexString。

    bin = [];
    for i = 1:size(hexString, 2),
        dec = hex2dec(hexString(i));
        binS = dec2bin(dec);
        
        bin = [bin binS2binV(binS)];
    end
end
