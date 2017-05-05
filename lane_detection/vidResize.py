import cv2
from matplotlib import pyplot as plt
import numpy as np
import skvideo.io
import skvideo.utils
import skvideo.datasets
#inVideo = skvideo.io.vread('lane_vid.mp4')
inVideo = skvideo.io.vreader('title.avi')

outVideo = np.empty([2384, 330, 720, 3], dtype = np.uint8)
outVideo = outVideo.astype(np.uint8)

def operation(im):
    img = im[60:390, :, :];
    return img

i=0;

for frame in inVideo:
        #print(frame.shape)
        outVideo[i] = operation(frame)
        i = i+1;

skvideo.io.vwrite("inputdata.mp4", outVideo)