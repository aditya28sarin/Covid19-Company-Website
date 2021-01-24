import cv2
import matplotlib.pyplot as plt
from firebase import *

def main():
    cap = cv2.VideoCapture(0)
    
    if cap.isOpened():
        ret, frame = cap.read()
        print(ret)
        print(frame)
    else:
        ret = False

    img1 = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
 
    
    plt.imshow(img1)
    plt.title('Color Image RGB')
    plt.xticks([])
    plt.yticks([])
    plt.show()

    cap.release()

    cv2.imwrite('C:/Users/aditya/Desktop/img1.jpg',img1)

    
if __name__ == "__main__":
    main()
    imageUpload()