function result = PadBit(data, expectedByteLength, bitForPad, behind)
%function [result] = PadBit(data, expectedByteLength, bitForPad, behind)
%sometimes the we want the binary data vector be the size of 8 times,
%this function pad data to ensure the data to the size of 8 times,
%data should be a row vector which only contain 0 and 1,
%this function will add the bitForPad to the data, 
%to make the data length be K * 8, which is the full byte format. 
%data: the data you want to modify.
%expectedByteLength: the expected Byte Length you want to make,
%       if expectedByteLength dosen't exist or expectedByteLength < size(data, 2)/ 8 , 
%        then the data will be 
%       automatically padded to the shortest Length.
%bitForPad: 0 or 1, the bit that you want to add to the data, default = 0.
%behind: if behind is given, then just append bits, else insert front.
    if ~exist('expectedByteLength', 'var')
        expectedByteLength = 0;
    end
    
    if ~exist('bitForPad', 'var')
        bitForPad = 0;
    end
    
    
    %first make data itself be the sizeof 8 * k;
    currentBitLength = size(data, 2);
    currentByteLength = ceil(currentBitLength / 8);
    %the rest bit num to make data Byteable
    restBitLength = currentByteLength * 8 - currentBitLength;
    restBits = zeros(1, restBitLength);
    restBits(:) = bitForPad;
    data = [restBits data];
    
    padByteLength = expectedByteLength - currentByteLength;
    
    if padByteLength > 0,
        %prepare the bits for padding
        padBytes = zeros(1, 8 * padByteLength);
        padBytes(:) = bitForPad;
        
        if exist('behind', 'var'),
            %append
            result = [data padBytes];
        else
            %insert front
            result = [padBytes data];
        end
    else
        %do nothing for which the data has been padded to the shortest length.
        result = data;
    end
end
