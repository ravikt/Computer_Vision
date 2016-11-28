function [image1] = operation(image,filter)
%% Padding of the image array
[m,n]=size(filter);
m=(m-1)/2;
n=(n-1)/2;
input_image=rgb2gray(image);
image=padarray(input_image,[m,n]);
image=double(image);
[r,c]=size(image);
image1=zeros(r,c);

%% Correlation operation
for i=m+1:r-m-1
   for j=n+1:c-n-1
       image1(i,j)=sum(sum(filter.*image(i-m:i+m,j-n:j+n))); 
   end
end

end
