function binVector = binS2binV(binS)
%asum the binS is the string containing '0' or '1',
%convert the string to vector contain number 0 and 1.

    binVector = zeros(size(binS));

    binVector(findstr(binS, '1')) = 1;
end
