function retS = binArr2string(arr)
%asum that the arr are consist of the 0 and 1,
%return the the string of the arr.

    arr = arr(:);
    retS = '';
    for a = arr,
        retS = [retS, sprintf('%d', a)];
    end
end
