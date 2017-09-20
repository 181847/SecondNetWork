function [dataLength, paddedData, fcs, fullFrame] = CRC_String_Version(sourceMacS, destMacS, dataS)
%[dataLength, paddedData, fcs, fullFrame] = Main(sourceMacS, destMacS, dataS).
%sourceMacS: the string of the source Mac, presented by 0-1a-fA-F.
%destMacS: the string of the destiny Mac, presented by 0-1a-fA-F.
%dataS: the string of the data, presented by 0-1a-fA-F.
%datalength: ignore the padded Bytes, the zero bits before the data maybe ignored, true Length of the data in Byte
%paddedData: the Data Part in the frame, which after padding to 46 Bytes data.
%fcs: fcs by G8
%fullFrame: completed Ethernet frame, include the head, if the data > 1500Bytes, 
%   the data will be divided.
    
    if size(sourceMacS, 2) ~= 12,
        error('sourceMac illegal');
    end
    if size(destMacS, 2) ~= 12,
        error('sourceMac illegal');
    end

    sourceMacB = hex2bin(sourceMacS);
    destMacB = hex2bin(destMacS);
    dataB = hex2bin(dataS);
    
    %the size of data
    dataLength = ceil(size(dataB, 2) / 8);
    if dataLength < 46,
        %make data to 46 Byte, append 0s
        dataB = PadBit(dataB, 46, 0, []);
    else
        %ensure the data has 8 * k bits, k belong to Z+.
        dataB = PadBit(dataB);
    end
    paddedData = dataB;
    
    %convert length to 2 Bytes
    lengthB = PadBit(dec2binV(dataLength), 2);
    
    load G8.dat;
    
    fullFrame = [destMacB sourceMacB lengthB dataB];
    
    fcs = CRC_CPP(fullFrame, G8);
    
    %add additional parts of Ethernet Frame Head.
    fullFrame = [hex2bin('aaaaaaaaaaaaaaab') fullFrame fcs];
    
    %convert from bin to hexString
    paddedData = binArr2hexString(paddedData);
    fcs = binArr2hexString(fcs);
    fullFrame = binArr2hexString(fullFrame);
end
