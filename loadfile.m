function imorlb=loadfile(filename,type)

fp = fopen(filename, 'rb');
assert(fp ~= -1, ['Could not open ', filename, '']);
magic = fread(fp, 1, 'int32', 0, 'ieee-be');

if type=='lb'
    assert(magic == 2049, ['Bad magic number in ', filename, '']);
    numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');
    imorlb = fread(fp, inf, 'unsigned char');
    assert(size(imorlb,1) == numLabels, 'Mismatch in label count');
elseif type=='im'
    assert(magic == 2051, ['Bad magic number in ', filename, '']);
    numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
    numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
    numCols = fread(fp, 1, 'int32', 0, 'ieee-be');

    imorlb = fread(fp, inf, 'unsigned char');
    imorlb = reshape(imorlb, numCols, numRows, numImages);
    imorlb = permute(imorlb,[2 1 3]);

    imorlb = reshape(imorlb, size(imorlb, 1) * size(imorlb, 2), size(imorlb, 3));
    imorlb = double(imorlb) / 255;
else
     error('PLEASE DEFINE TYPE AS lb OR im IN STRING IN PROPER WAY');
end
fclose(fp);
end

