#!/usr/bin/env python

import sys
from pathlib import Path

import cv2
import numpy as np


argv = sys.argv
argc = len(argv)

if argc == 1:
    sys.exit(1)

IMG_PATH = Path(argv[1])
THRESHOLD = int(argv[2]) if argc == 3 else 127.5

img = cv2.imread(IMG_PATH)
lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)  # ty: ignore[no-matching-overload]

l_channel, _, _ = cv2.split(lab)
brightness = np.mean(l_channel)

print("light" if brightness > THRESHOLD else "dark")
