function fcs = CRC_CPP(data, generator)
%data: row vector of 0 and 1.
%generator: row vector, generator polynomial, generator(1) should always be 1.
%fcs: row vector, fcs, size(fcs) == (size(generator, 2)-1)
    
    
    length = size(data, 2);
    
    g = generator(2:end);
    
    m = size(g, 2);
    %modify data
    data = [data, zeros(1, m)];
    
    buffer = data(1:m);
    
    for checkPointer = 1:length,
        if buffer(1) == 1,
            %left move
            buffer = [buffer(2:end), data(checkPointer + 8)];
            
            buffer = xor(buffer, g);
        else
            %left move
            buffer = [buffer(2:end), data(checkPointer + 8)];
        end
        
        %disp(buffer);
    end
    
    fcs = buffer;
end
