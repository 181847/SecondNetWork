function [dataLength, paddedData, fcs, fullFrame] = Main(sourceMacS, destMacS, dataS)
%[dataLength, paddedData, fcs, fullFrame] = Main(sourceMacS, destMacS, dataS).
%sourceMacS: the string of the source Mac, presented using 0-1a-fA-F.
%destMacS: the string of the destiny Mac, presented using 0-1a-fA-F.
%dataS: the string of the data, presented using 0-1a-fA-F.
%datalength: ignore the padded Bytes, trueLength of the data in Byte
%paddedData: the Data Part in the frame, which after padding.
%fcs: fcs
%fullFrame: completed Ethernet frame, include the head.


    sourceMacB = hex2bin(sourceMacS);
    destMacB = hex2bin(destMacS);
    dataB = hex2bin(dataS);
    
    %the size of data
    length = ceil(size(dataB, 2) / 8);
    if length < 46,
        %make data to 46 Byte, append 0s
        dataB = PadBit(dataB, 46, 0, []);
    else
        %ensure the data has 8 * k bits, k belong to Z+.
        dataB = PadBit(dataB);
    end
    paddedData = dataB;
    
    %convert length to 2 Bytes
    lengthB = PadBit(dec2binV(length));
    
    load G8.dat;
    
    fullFrame = [destMacB sourceMacB lengthB dataB];
    
    fcs = CRC_CPP(fullFrame, G8);
    
    %add additional parts of Ethernet Frame Head.
    fullFrame = [hex2bin('aaaaaaaaaaaaaaab') fullFrame];
end
