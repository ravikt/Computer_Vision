import cv2
from matplotlib import pyplot as plt
import numpy as np
import skvideo.io
import skvideo.utils
import skvideo.datasets
#inVideo = skvideo.io.vread('lane_vid.mp4')
inVideo = skvideo.io.vreader('inputdata.mp4')
#video = skvideo.utils.rgb2gray('lane_vid.mp4')

# For extracting relevant regions in the video
# def regint(im):
#         [m, n, k] = im.shape
#         mask = np.zeros((m, n, k), dtype=np.uint8);
#         i=m/2
#         while i >= m/2:
#            mask[i, :, :] = im[i, :, :]
#            i = i+1
#            if i == m:
#              break;
#         return mask;

# Conversion of frames from RGB to grayscale
def conversion(im):
        outimage = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
        #outimage = cv2.cvtColor(im, cv2.COLOR_RGB2HSV)
        return outimage

# Detects edges using canny edge detection algorithm
def canny(im):
        incanny = cv2.GaussianBlur(im, (5, 5), 0)
        outimage = cv2.Canny(incanny, 30, 130)
        return outimage

# def slope(line):
#     return (float(line[3]) - line[1]) / (float(line[2]) - line[0])

# Draws the detected line
def draw(img, lines):
      if lines is not None:
        for line in lines:
         x1, y1, x2, y2 = line[0]
        cv2.line(img, (x1, y1), (x2, y2), (255, 0, 0), 5)

# Detects the lines in the images
def hough(img):
        lines = cv2.HoughLinesP(img, 1, np.pi/180, 100, minLineLength=40, maxLineGap=10)
        limg = np.zeros((img.shape[0], img.shape[1], 3), dtype=np.uint8)
        draw(limg, lines)
        return limg

# Add two detected lines to original image
def blendim(img1, img2):
        out = cv2.add(img1, img2)
        return out

# Calls all the functions sequentially
def operation(im):
        inimage = im
        #inimage = regint(im)
        gray = conversion(inimage)
        edge = canny(gray)
        outimage = hough(edge)
        #outimage = conversion(outimage)
        outimage = blendim(outimage, im)
        return outimage

# An empty matrix to hold all the sequence of images
#outVideo = np.empty([5291, 360, 490, 3], dtype = np.uint8)
#outVideo = np.empty([2384, 480, 720, 3], dtype = np.uint8)
outVideo = np.empty([2384, 330, 720, 3], dtype = np.uint8)

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

# Writes the the output image sequences in a video file
skvideo.io.vwrite("outputvideo2.mp4", outVideo)


