function binVector = binS2binV(binS)
%convert string to vector

    binVector = zeros(size(binS));

    binVector(findstr(binS, '1')) = 1;
end
