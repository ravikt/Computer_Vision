import cv2
import numpy as np
from matplotlib import pyplot as plt

inputImage = cv2.imread('pencils.jpg')
inputImage = cv2.cvtColor(inputImage, cv2.COLOR_BGR2GRAY)
(row, col) = inputImage.shape

x0 = row/2
y0 = col/2
theta = np.pi/4

ro = np.int_(np.ceil(row*np.absolute(np.cos(theta)) + col*np.absolute(np.sin(theta))))
co = np.int_(np.ceil(row*np.absolute(np.sin(theta)) + col*np.absolute(np.cos(theta))))

outImage = np.zeros((ro, co), dtype=np.uint8)
midx = np.ceil(outImage.shape[0]/2)
midy = np.ceil(outImage.shape[1]/2)

for r in range(row):
    for c in range(col):
        x = (r-midx)*np.cos(theta) + (c-midy)*np.sin(theta)
        y = -(r-midx)*np.sin(theta) + (c-midy)*np.cos(theta)
        x = np.int_(np.ceil(x))
        y = np.int_(np.ceil(y))
        outImage[x, y] = inputImage[r, c]

plt.imshow(outImage, cmap='gray')
plt.show()