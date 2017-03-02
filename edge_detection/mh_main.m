clear all;
close all;
image=imread('image.jpg');
filter=lofg(1.4,9);

answ=operation(image,filter);
%zero crossing thing

final=zcross(answ);
output_image=im2uint8(final);

figure;
imshow(image);
title('Original Image');

figure;
imshow(output_image);
title('After applying Marr-Hildreth algorithm');

figure;
imshow(answ);
title('LoG filtered image');

