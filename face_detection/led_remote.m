%% LED program for remote Raspberry Pi 

clear all;
close all;
rpi = raspi('10.0.2.152')
mycam = webcam(rpi);
for i=1:100
    
writeLED(rpi,'led0',1)
pause(0.05)
writeLED(rpi,'led0',0)
pause(0.05)

img = snapshot(mycam);
imagesc(img)
drawnow
end