IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -DTHRUST_DEBUG

%.out: %.cu
	$(CC)  -o $@ $< $(CFLAGS)

rod_srad_1: srad.out
	./srad.out 64 64 0 32 0 32 0.5 2
	openssl md5 result.out
