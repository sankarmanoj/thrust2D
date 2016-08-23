IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR)
OS := $(shell uname)
ifeq ($(OS),Darwin)
	display=open -a ToyViewer
else
	display=display
endif
%.out: %.cu
	clear
	clear
	$(CC)  -o $@ $< $(CFLAGS)
srad.cu : srad_kernel.cu

rod_srad_1: srad.out
	#display image.pgm &
	./srad.out 502 458 0.5 100 image.pgm image_out.pgm
	# $(display) image_out.pgm &
