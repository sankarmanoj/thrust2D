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
	$(CC)  -o $@ $< $(CFLAGS)

rod_srad_1: srad.out
	#display image.pgm &

	./srad.out 502 458 0.8 5
	# $(display) image_out.pgm &
