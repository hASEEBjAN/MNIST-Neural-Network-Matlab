function e=meansquarerror(label,y)
    t=zeros(size(y));
    t(label)=1;
    e=((t-y)^2)./2;
end

    