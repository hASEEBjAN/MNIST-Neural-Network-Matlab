function [weight1,weight2,weight3,bias]=nn(trainimages,trainlabels)

    %defining layers of neural network
    inputlayer=zeros(size(trainimages(:,1))); %input layer
    hiddenlayer=zeros(16,2); %hiddenlayers
    outputlayer=zeros(10,1); %outputlayer

    %weights and biases of all layers
    weight1=zeros(size(hiddenlayer,1),size(inputlayer,1));
    weight2=zeros(size(hiddenlayer,1),size(hiddenlayer,1));
    weight3=zeros(size(outputlayer,1),size(hiddenlayer,1));
    %Biases of neural network
    bias=[1 1 1];
    eta=0.001;
    outplot=[];
    for i=1:1000
        i
        %select of image from train images
        inputlayer=trainimages(:,i);
    
        %nueral network designing
        hiddenlayer(:,1)=weight1*inputlayer-bias(1,1);          %h1=w*x+b
        hiddenlayer(:,1)=sigmoid(hiddenlayer(:,1));     %Activating Funciton
        hiddenlayer(:,2)=weight2*hiddenlayer(:,1)-bias(1,2);    %h2=w*h1+b
        hiddenlayer(:,2)=sigmoid(hiddenlayer(:,2));     %ActivaBtion Function
        outputlayer=weight3*hiddenlayer(:,2)-bias(1,3);         %y=w*h2+b
        outputlayer=sigmoid(outputlayer);               %Activation function
        e=meansquarerror(trainlabels(i,1),outputlayer);       %Mean Square Error
        %BackPropegation
        %weight=weight+2*eta*(d(error)/dweight)
        for j=1:1000;
            j
            outplot(j)=sum(e);
            weight3=weight3+(2*eta*(dsigmoid(outputlayer).*sqrt(e))*hiddenlayer(:,2)');       
            weight2=weight2+2*eta*(weight3'*(sqrt(e).*dsigmoid(outputlayer))).*dsigmoid(hiddenlayer(:,2))*hiddenlayer(:,1)';
            weight1=weight1+2*eta*(((weight2'*(dsigmoid(hiddenlayer(:,2)).*(weight3'*(sqrt(e).*dsigmoid(outputlayer))))).*hiddenlayer(:,1))*inputlayer');
            
            bias(1,3)=bias(1,3)+2*eta*sum(sqrt(e).*dsigmoid(outputlayer));
            bias(1,2)=bias(1,2)+2*eta*sum(dsigmoid(hiddenlayer(:,2)).*(weight3'*(sqrt(e).*dsigmoid(outputlayer))));
            bias(1,1)=bias(1,1)+2*eta*sum((sqrt(e).*dsigmoid(outputlayer)).*(weight3*(dsigmoid(hiddenlayer(:,2)).*(weight2*dsigmoid(hiddenlayer(:,1))))));
            
            hiddenlayer(:,1)=weight1*inputlayer-bias(1,1);          %h1=w*x+b
            hiddenlayer(:,1)=sigmoid(hiddenlayer(:,1));     %Activating Funciton
            hiddenlayer(:,2)=weight2*hiddenlayer(:,1)-bias(1,2);    %h2=w*h1+b
            hiddenlayer(:,2)=sigmoid(hiddenlayer(:,2));     %ActivaBtion Function
            outputlayer=weight3*hiddenlayer(:,2)-bias(1,3);         %y=w*h2+b
            outputlayer=sigmoid(outputlayer);               %Activation function
            e=meansquarerror(trainlabels(i,1),outputlayer);       %Mean Square Error
        end
%        figure
 %       plot(outplot);
    end
end