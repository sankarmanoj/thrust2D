IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR)

%.out: %.cu
	$(CC)  -o $@ $< $(CFLAGS)

rod_srad_1: srad.out
	#display image.pgm &
	./srad.out 502 458 0.01 5
	#display image_out.pgm &
