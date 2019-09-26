#! /usr/bin/python3

# ==================================================
# Python Embedded Modules
# ==================================================
import os, sys, time, random, glob, re, math, itertools, collections, csv, socket, requests, urllib
from time import strftime
import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf

# ==================================================
#	Misc (Math Plot Library & Numpy Display Option)
# ==================================================
markers = itertools.cycle(('o','s','d','^','v','<','>','*'))
colors = itertools.cycle(('r','b','g','gold','brown','c','greenyellow','yellow'))
np.set_printoptions(precision = 3, linewidth = 200, threshold = 10)

# ==================================================
# 	Available Data Set
# ==================================================
nnURL = collections.OrderedDict()
nnURL['mnist']		= [ 'http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz', 'http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz', 'http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz', 'http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz']
nnURL['cifar10']	= [ 'http://www.cs.toronto.edu/~kriz/cifar-10-binary.tar.gz' ]
nnURL['cifar100']	= [ 'http://www.cs.toronto.edu/~kriz/cifar-100-binary.tar.gz' ]
# ==================================================
#	Defined Modules
# ==================================================
def getURLFile(url, saveDir, barLength = 20):
	os.system('mkdir -p %s'%(saveDir))
	r = requests.get(url, stream=True)
	urlFileByte = int(r.headers.get('content-length'))	# Total File Size (Byte)
	urlFileName = url.split('/')[-1]
	absFileName = saveDir + '/' + urlFileName
	if not os.path.exists(absFileName):
		with open(absFileName, 'wb') as f:
			if urlFileByte is None:
				f.write(r.content)
				print('%s is empty file'%(urlFileName))
			else:
				downByte = 0
				for kByte in r.iter_content(1024):
					f.write(kByte)
					downByte += len(kByte)
					percent = 100 * downByte / urlFileByte
					filledLength = int(round(barLength * downByte / urlFileByte))
					bar = '#' *	filledLength  + ' ' * (barLength - filledLength)
					sys.stdout.write("\r%30s: |%s| %3.1f%%"%(urlFileName, bar, percent ))
			sys.stdout.write('\n')
					
