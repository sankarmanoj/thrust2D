IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR)

EXECUTABLES = block_2d.out block_iterator.out sub_block.out window_2d.out

%.out: %.cu
	$(CC)  -o $@ $< $(CFLAGS)

test_%: %.out
	./$<
