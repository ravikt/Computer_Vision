%% Program to create face gallery.

clear all;
close all;
cam = webcam;

for i = 1:20
   % Acquire a single image.
   rgbImage = snapshot(cam);

   % Convert RGB to grayscale.
   grayImage = rgb2gray(rgbImage);
   
   faceDetector = vision.CascadeObjectDetector('FrontalFaceCART','MinSize',[150,150]);
   bbox = step(faceDetector,grayImage);
   %%
%    query=insertShape(grayImage,'rectangle',bbox,'LineWidth',5);
%    figure;
%    imshow(query);
   %%
   grayImage = imcrop(grayImage,[bbox(1) bbox(2) bbox(3) bbox(4)]);
   scaleFactor = 150/size(grayImage,1);
   grayImage = imresize(grayImage,scaleFactor);
   imwrite(grayImage,sprintf('sample%d.jpg',i));
   
%    % Find circles.
%    [centers, radii] = imfindcircles(grayImage, [60 80]);
% 
%    % Display the image.
%    imshow(rgbImage);
%    hold on;
%    viscircles(centers, radii);
%    drawnow
end
%% Detect face
