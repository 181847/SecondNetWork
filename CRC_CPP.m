function fcs = CRC_CPP(data, generator)
%data: 行向量
%generator: 包含最大项的1。
%fcs: 计算的校验码，行向量，size(fcs) == (size(generator, 2)-1)
    
    
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
        
        disp(buffer);
    end
    
    fcs = buffer;
end
