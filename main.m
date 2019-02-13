%name of classified file used in this project 
trainimagefile='train-images.idx3-ubyte'; %training images file
trainlabelfile='train-labels.idx1-ubyte'; %training labels file

testimagefile='t10k-images.idx3-ubyte'; %testing purpose image file
testlabelfile='t10k-images.idx1-ubyte'; %testing purpose label of images

%loading file to matlab
trainimages=loadfile(trainimagefile,'im');
trainlabels=loadfile(trainlabelfile,'lb');

[weight1,weight2,weight3,bias]=nn(trainimages,trainlabels,6000);

%backprop
