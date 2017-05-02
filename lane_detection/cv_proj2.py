import cv2
from matplotlib import pyplot as plt
import numpy as np
import skvideo.io
import skvideo.utils
import skvideo.datasets
#inVideo = skvideo.io.vread('lane_vid.mp4')
inVideo = skvideo.io.vreader('lane_vid.mp4')
#video = skvideo.utils.rgb2gray('lane_vid.mp4')

# def regint(im):
#         [m, n] = im.shape
#         mask = np.zeros((m, n), dtype=np.uint8);


def conversion(im):
        outimage = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
        #outimage = cv2.cvtColor(im, cv2.COLOR_RGB2HSV)
        return outimage

def canny(im):
        incanny = cv2.GaussianBlur(im, (5, 5), 0)
        outimage = cv2.Canny(incanny, 100, 200)
        return outimage

def draw(img, lines):

  if lines is not None:
      for line in lines:
        x1, y1, x2, y2 = line[0]
      cv2.line(img, (x1, y1), (x2, y2), (0, 0, 255, 2)


def hough(img):
        lines = cv2.HoughLinesP(img, 1, np.pi/180, 100, minLineLength=100, maxLineGap=10)
        limg = np.zeros((img.shape[0], img.shape[1], 3), dtype=np.uint8)
        draw(limg, lines)
        return limg

def blendim(img1, img2):
        out = cv2.add(img1, img2)
        return out

def operation(im):
        inimage = im
        gray = conversion(inimage)
        edge = canny(gray)
        outimage = hough(edge)
        #outimage = conversion(outimage)
        outimage = blendim(outimage, inimage)
        return outimage

outVideo = np.empty([5291, 360, 490, 3], dtype = np.uint8)
outVideo = outVideo.astype(np.uint8)
#outVideo = np.empty((5291, 360, 490))
#outVideo = outVideo.astype(np.uint8)
i = 0

for frame in inVideo:
        #print(frame.shape)
        outVideo[i] = operation(frame)
        i = i+1;

#plt.imshow(frame)
#plt.imshow(output)
#plt.show()
skvideo.io.vwrite("outputvideo1.mp4", outVideo)


