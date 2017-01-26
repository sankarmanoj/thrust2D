#!/usr/bin/python

import os, sys

x = 128
y = 128
z = 1000
np = 10000

cmd = "./%s -x %d -y %d -z %d -np %d"

if sys.argv[1] == "1":
	print "Running CUDA code"
	os.system(cmd % ("particlefilter_float", x, y, z, np))

elif sys.argv[1] == "2":
	print "Running Thrust code"
	os.system(cmd % ("thrust_particle_filter", x, y, z, np))

elif sys.argv[1] == "3":
	print "Testing"
	os.system(cmd % ("test", x, y, z, np))

elif sys.argv[1] == "4":

	print "Running CUDA code"
	os.system(cmd % ("particlefilter_float", x, y, z, np))

	print "Running Thrust code"
	os.system(cmd % ("thrust_particle_filter", x, y, z, np))

else:
	print "Invalid option"
