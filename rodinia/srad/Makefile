IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -std=c++11 -ccbin=g++-5 -arch=sm_60
OS := $(shell uname)
ifeq ($(OS),Darwin)
	display=open -a ToyViewer
else
	display=display
endif
all: srad.out
	#display image.pgm &
	nvprof --unified-memory-profiling off --log-file srad.profile ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
	# $(display) image_out.pgm &
%.out: %.cu
	$(CC) -g -G -lineinfo -o $@ $< $(CFLAGS)

srad.cu : srad_kernel.cu
srad_non_shared.cu : srad_kernel.cu
clean :
	rm *.out

rod_srad_cuda:
	cd cuda; make srad
