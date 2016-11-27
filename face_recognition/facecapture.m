clear all;
close all;
cam = webcam

for i = 1:20
   % Acquire a single image.
   rgbImage = snapshot(cam);

   % Convert RGB to grayscale.
   grayImage = rgb2gray(rgbImage);
   imwrite(grayImage,sprintf('sample%d.jpg',i));
   % Find circles.
   [centers, radii] = imfindcircles(grayImage, [60 80]);

   % Display the image.
   imshow(rgbImage);
   hold on;
   viscircles(centers, radii);
   drawnow
end