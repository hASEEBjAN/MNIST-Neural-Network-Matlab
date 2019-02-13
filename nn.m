function [weight1,weight2,weight3,bias]=nn(trainimages,trainlabels,n)

%defining layers of neural network
inputlayer=zeros(size(trainimages(:,1)))'; %input layer
hiddenlayer=zeros(16,2)'; %hiddenlayers
outputlayer=zeros(10,1)'; %outputlayer

%weights and biases of all layers
weight1=ones(size(inputlayer,2),size(hiddenlayer,2));

weight2=ones(size(hiddenlayer,2),size(hiddenlayer,2));

weight3=ones(size(hiddenlayer,2),size(outputlayer,2));

bias=[1 1 1]

imagenumber=1;

hiddenlayer(1,:)=(weight1'*inputlayer')'+bias(1,1);
hiddenlayer(1,:)=sigmoid(hiddenlayer(1,:));
hiddenlayer(2,:)=(weight2'*hiddenlayer(1,:)')'+bias(1,2);
hiddenlayer(2,:)=sigmoid(hiddenlayer(2,:));
outputlayer=(weight3'*hiddenlayer(2,:)')'+bias(1,3);
outputlayer=sigmoid(outputlayer);
e=meansquarerror(imagelabel,outputlayer)
[weight1,weight2,weight3]=backprop(e,weight1,weight2,weight3,input,hiddenlayer,outputlayer)

end