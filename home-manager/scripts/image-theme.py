#!/usr/bin/env python

import cv2
import sys
import numpy as np
from pathlib import Path


argv = sys.argv
argc = len(argv)

if argc == 1:
    exit(1)

IMG_PATH = Path(argv[1])
THRESHOLD = int(argv[2]) if argc == 3 else 127.5

img = cv2.imread(IMG_PATH)
lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)

l_channel, _, _ = cv2.split(lab)
brightness = np.mean(l_channel)

print("light" if brightness > THRESHOLD else "dark")
