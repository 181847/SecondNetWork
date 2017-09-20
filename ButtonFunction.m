function ButtonFunction(src, event, edits, dispTexts)
%the button callback function, which need 6 uicontrol handle,
%the handles are needed to be stored in the struct, 
%mention that the data format is allways the hex,
%here are he required uicontrols:
%   edits.sourceMacEdit from which get the source mac address.
%   edits.destMacEdit, from which get the destination mac address.
%   edits.dataEdit, from which get the data, the data will be send in the ethernet frame.
%   dispTexts.LengthDispText, used to display the length of the data in Byte.
%   dispTexts.crcDispText, used to display the fcs.
%   dispTexts.frameDispText, used to display the whole frame.
%src, generar callback function arg.
%event, general callback function arg.


    sourceMac = get(edits.sourceMacEdit, 'String');
    destMac = get(edits.destMacEdit, 'String');
    data = get(edits.dataEdit, 'String');
    
    if iscell(data),
        data = data{1};
    end
    
    [dataLength, paddedData, fcs, fullFrame] = ...
        CRC_String_Version(sourceMac, destMac, data);
        
    set(dispTexts.LengthDispText, 'String', sprintf('%d', dataLength));
    set(dispTexts.crcDispText, 'String', fcs);
    set(dispTexts.frameDispText, 'String', fullFrame);
end
