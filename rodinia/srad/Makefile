IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -std=c++11 -ccbin=g++-5 -arch=sm_60
OS := $(shell uname)
ifeq ($(OS),Darwin)
	display=open -a ToyViewer
else
	display=display
endif
all: srad_shared.out srad_non_shared.out srad_texture.out

%.out: %.cu
	$(CC) -o $@ $< $(CFLAGS)

srad_texture.cu : srad_kernel.cu
srad_shared.cu : srad_kernel.cu
srad_non_shared.cu : srad_kernel.cu

clean :
	rm *.out

rod_srad_cuda:
	cd cuda; make srad
