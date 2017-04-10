import cv2
from matplotlib import pyplot as plt
import numpy as np
import skvideo.io
import skvideo.utils
import skvideo.datasets
#inVideo = skvideo.io.vread('lane_vid.mp4')
inVideo = skvideo.io.vreader('lane_vid.mp4')
#video = skvideo.utils.rgb2gray('lane_vid.mp4')

def conversion(im):
        outimage = cv2.cvtColor(im, cv2.COLOR_RGB2GRAY)
        #outimage = cv2.cvtColor(im, cv2.COLOR_RGB2HSV)
        return outimage

def canny(im):
        incanny = cv2.GaussianBlur(im, (5, 5), 0)
        outimage =  cv2.Canny(incanny, 100, 200)
        return outimage

def operation(im):
        inimage = im
        gray = conversion(inimage)
        outimage = canny(gray)
        return outimage

# outputdata = np.random.random(size=(500, 360, 490, 1)) * 255
# outputdata = outputdata.astype(np.uint8)
outVideo = np.empty((5291, 360, 490))
outVideo = outVideo.astype(np.uint8)
i = 0

for frame in inVideo:
        #print(frame.shape)

        outVideo[i] = operation(frame)
        i = i+1;
#plt.imshow(frame)
#plt.imshow(output)
#plt.show()
skvideo.io.vwrite("outputvideo1.mp4", outVideo)


<<<<<<< HEAD
=======
skvideo.io.vwrite("outputvideo.mp4", outVideo)



>>>>>>> c2e3acc80308761eec9f84a485317bae71406acb

