function e=meansquarerror(label,y)
    %target is set of zeros 
    
    t=zeros(size(y));
    %with one only on expected vlaue
    t(label+1)=1;
    %and e=mean of square of expected minus obtain
    e=((t-y).^2)./2;
end
