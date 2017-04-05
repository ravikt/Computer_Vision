import cv2
from matplotlib import pyplot as plt
import numpy as np
import skvideo.io
import skvideo.utils
import skvideo.datasets
#videogen = skvideo.io.vread('lane_vid.mp4')
videogen = skvideo.io.vreader('lane_vid.mp4')
#video = skvideo.utils.rgb2gray('lane_vid.mp4')


def operation(im):
        inimage = im
        gray = cv2.cvtColor(inimage, cv2.COLOR_RGB2GRAY)
        outimage = cv2.Canny(gray, 100, 200)
        return outimage

# outputdata = np.random.random(size=(500, 360, 490, 1)) * 255
# outputdata = outputdata.astype(np.uint8)
outputdata = np.empty((5291, 360, 490))
outputdata = outputdata.astype(np.uint8)
i = 0
for frame in videogen:
        print(frame.shape)

        outputdata[i] = operation(frame)
        i = i+1;

#plt.imshow(frame)
#plt.imshow(output)
#plt.show()

skvideo.io.vwrite("outputvideo.mp4", outputdata)


# def operation(base_img):
#     global BASE_IMG, CANNY_IMG
#     BASE_IMG = base_img
#     ysize = base_img.shape[0]
#     xsize = base_img.shape[1]
#     image = to_hsv(base_img)
#     image = gaussian_blur(image, 3)
#     image = filter_color(image)
#     image = canny(image, 30, 130)
#     CANNY_IMG = image
#     image = region_of_interest(
#         image,
#         np.array(
#             [[(40, ysize), (xsize / 2, ysize / 2 + 40), (xsize / 2, ysize / 2 + 40), (xsize - 40, ysize)]],
#             dtype=np.int32
#         )
#     )
#     image = hough_lines(image, 1, np.pi / 90, 10, 15, 10)
