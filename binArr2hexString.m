function hexString = binArr2hexString(arr)
%hexString = binArr2hexString(arr)
%arr is a row vector of 0 and 1,
%pad arr to a sizeof 8 * k length,
%return the hexString for padded arr.

    %ensure arr is row vector.
    arr = arr(:)';
    %ensure arr has a size of 8 * k, k belong to Z+.
    arr = PadBit(arr);
    
    %how many hex character should be used
    hexL = size(arr, 2) / 4;
    
    hexString = '';
    for i = 1 : 4 : hexL*4,
        bit4 = arr(i:i+3);
        
        bit4String = binArr2string(bit4);
        
        %append new hex character for the bit4
        hexString = [hexString dec2hex(bin2dec(bit4String))];
    end
end
