function AppRun
    load myui.dat;
    
    [edits, button, dispTexts, texts] = ...
        UIFrame(myui);
        
    set(button, 'Callback', @(src, event)ButtonFunction(src, event, edits, dispTexts));
    
end
