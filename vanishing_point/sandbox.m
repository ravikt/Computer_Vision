clear all;
close all;

im = imread('img1.jpg');
figure(1), hold off, imagesc(im)
hold on 
% Allow user to input line segments; compute centers, directions, lengths
disp('Set at least two lines for vanishing point')
lines = zeros(3, 0);
line_length = zeros(1,0);
centers = zeros(3, 0);
% x = zeros(1,6);
% y = zeros(1,6);

  while 1
      
        disp(' ')
        disp('Click first point or q to stop')
        [x1,y1,b] = ginput(1);  
        if b=='q'        
            break;
        end
        [x2,y2] = ginput(1);
        
        plot([x1 x2], [y1 y2], 'b')
        lines(:, end+1) = real(cross([x1 y1 1]', [x2 y2 1]'));
        line_length(end+1) = sqrt((y2-y1)^2 + (x2-x1).^2);
        centers(:, end+1) = [x1+x2 y1+y2 2]/2;
 
        
  end