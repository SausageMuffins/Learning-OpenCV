import cv2

# Displaying Images using OpenCV
img = cv2.imread("C://Users//nryan//OneDrive//Desktop//00-puppy.jpg")

while True:
    cv2.imshow("Dog", img) # show the image using cv2's library.
    
    # Check if we have waited 1ms and we press the escape button which has encoding 0xFF.
    
    if cv2.waitKey()(1) & 0xFF == 27: # & is a bitwise comparison.
        break