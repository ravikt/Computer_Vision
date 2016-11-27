clear all;
close all;

%% Setup Raspberry Pi and Camera
rpi = raspi('10.0.2.152');
mycam = webcam(rpi);
%% Image aquisition and plotting

mysnap = snapshot(mycam);
imshow(mysnap);
hold on;

%% Detect face and insert a rectangle around the face

fD = vision.CascadeObjectDetector();
bbox = step(fD,mysnap);
imageOut = insertObjectAnnotation(mysnap,'rectangle',bbox,'Face');
imshow(imageOut);
title('Detected face');

%% Repeat in a loop to make it face detection
% 
flag = 1;
while flag
    clearvars -except rpi mycam flag
    mysnap = snapshot(mycam);
    imshow(mysnap);
    hold on
    fD = vision.CascadeObjectDetector();
    bbox = step(fD,mysnap);
    imageOut = insertObjectAnnotation(mysnap,'rectangle',bbox,'Face');
    imshow(imageOut);
    title('Detected face');
    drawnow;
end

