function [dataLengths, fcses, frames] = GeneratorEtherFrame(destMacS, sourceMacS, data)
%{
destMacS: destination mac address, hex string.
sourceMacs: source mac address, hex string.
data: the data want to send.
if the data > 1500Bytes, will generate multiple frames.
dataLengths: column vector, each row contain the dataLength of each frame in dec.
fcesec: cell array, column, each row contain the fcs of the frame.
frames: cell array, column, each row contain the whole frame.
excludthe dataLengths, other data are all presented in the formate of string in hex.
%}

    maxPerFrame = 1500;
    
    %clip the data to 1500Bytes parts.
    rawLength = size(data, 2);
    frameCount = ceil(rawLength / 1500);
    padCount = maxPerFrame * frameCount - rawLength;
    dataS = reshape([dataS blanks(padCount)], frameCount, 1500);
    
    %initialize the return values
    dataLengths = zeros(framecount, 1);
    fcses = cell(framecount, 1);
    frames = cell(frameCount, 1);
    
    for frameIndex = 1:frameCount - 1,
        [dataLengths(frameIndex), fcses(frameIndex), frames(frameIndex)] = ...
            GenerateEthernetFrame(destMacS, sourceMacS, dataS(frameIndex, :));
    end
    
    %for the last frame, remove the padded data,
    %and calculate the frame.
    [dataLengths(frameCount), fcses(frameCount), frames(frameCount)] = ...
        GenerateEthernetFrame(...
            destMacS, ...
            sourceMacS, ...
            dataS(frameCount, 1: maxPerFrame - padCount));
    
end
