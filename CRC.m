function fcs = CRC(data, generator)
%计算data的CRC校验��
%data应该为一个行向量��
%fcs为一个行向量，长度应该为size(generator) - 1.
%generator应该为一个行向量


%检查各个向量的大小
if size(data, 2) == 1,
    fprintf('data size error');
end

if size(generator, 2) == 1,
    fprintf('generator size error');
end

m = size(generator, 2);

%在data末尾添加m-1个0.
data = [data zeros(1, m-1)];
dataLength = size(data, 2);
%初始计算��
fcs = [0, data(1 : m-1)];

for endIndex = m:dataLength,
    if fcs(1) == 0,
        fcs = [fcs(2:end), data(endIndex)];
    else
        fcs = xor(fcs, generator);
        fcs = [fcs(2 : end), data(endIndex)];
    end
    
    disp(fcs);
end

if fcs(1) == 1,
    fcs = xor(fcs, generator);
end

fcs = fcs(2: end);
end
