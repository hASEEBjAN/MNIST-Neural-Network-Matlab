function [weight1,weight2,weight3]=backprop(e,w1,w2,w3,x,h,y)
    eta=0.001;
    w3=w3+(2*eta*hiddenlayer(2,:)'*(outputlayer.*sqrt(e));
    
    
    ys=disgmoid(y).*e
    
    ws3=w3.*dsigmoid(y).*sqrt(e)
    
    
    
    w2=w2+
end