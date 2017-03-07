import numpy as np
import cv2
from matplotlib import pyplot as plt

im = cv2.imread('sample.bmp')

b, g, r = cv2.split(im)
img = cv2.merge((r, g, b))
gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
edges = cv2.Canny(gray, 100, 200, apertureSize = 3)
plt.imshow(edges, cmap='gray')
#plt.imshow(img)
cv2.imwrite('edges.jpg', edges)
# Hough transform

lines = cv2.HoughLines(edges, 1, np.pi/180, 200)

for rho,theta in lines[0]:
    a = np.cos(theta)
    b = np.sin(theta)
    x0 = a*rho
    y0 = b*rho
    x1 = int(x0 + 1000*(-b))
    y1 = int(y0 + 1000*(a))
    x2 = int(x0 - 1000*(-b))
    y2 = int(y0 - 1000*(a))

    cv2.line(im, (x1, y1), (x2, y2), (0, 0, 255), 2)

cv2.imwrite('lane1.jpg', im)

# Probabilistic hough transform

minLineLength = 5000
maxLineGap = 10
lines = cv2.HoughLinesP(edges, 1, np.pi/180, 100, minLineLength, maxLineGap)
for x1, y1, x2, y2 in lines[0]:
    cv2.line(im, (x1, y1), (x2, y2), (0, 0, 255), 2)

cv2.imwrite('lane2.jpg', im)
plt.imshow(img)
plt.show()

