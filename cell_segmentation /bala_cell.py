import numpy as np
import cv2
from matplotlib import pyplot as plt

img = cv2.imread('cell1.tif')
# b, g, r = cv2.split(im)
# img = cv2.merge((r, g, b))

gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
ret, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)
#plt.imshow(gray, cmap='gray')
#plt.imshow(thresh, cmap='gray')

# removing the noise
kernel = np.ones((3, 3), np.uint8)
opening = cv2.morphologyEx(thresh, cv2.MORPH_OPEN, kernel, iterations = 2)

# confirming the background area
bk_gr = cv2.dilate(opening, kernel, iterations = 2)

# confirming the foreground area
dist_transform = cv2.distanceTransform(opening, cv2.DIST_L2, 5)
ret, fr_gr = cv2.threshold(dist_transform, 0.7*dist_transform.max(), 255, 0)

# Finding the unknown regions

fr_gr = np.uint8(fr_gr)
unknown = cv2.subtract(bk_gr, fr_gr)

# Marker Labelling
ret, markers = cv2.connectedComponents(fr_gr)

# Add one to all labels to make foreground 1
markers = markers+1

# Marking the unknown region with zero
markers[unknown==255] = 0

# Applying watershed algorithm
markers = cv2.watershed(img, markers)
img[markers == -1] = [0, 0, 255]

# Write the output files to result folder
cv2.imwrite('results/gray.jpeg', gray)
cv2.imwrite('results/thresh.jpeg', thresh)
cv2.imwrite('results/opening.jpeg', opening)
cv2.imwrite('results/markers.jpeg', markers*255)
cv2.imwrite('results/background.jpeg', bk_gr)
cv2.imwrite('results/foreground.jpeg', fr_gr)
cv2.imwrite('results/final_output.jpeg', img)


plt.show()