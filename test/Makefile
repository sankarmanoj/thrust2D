IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) 

EXECUTABLES = block_2d.out block_iterator.out sub_block.out window_2d.out
HOST=$(shell hostname)
debug:window_for_each.cu
	$(CC)  -g -G -O0 -lineinfo -o window_for_each.out window_for_each.cu $(CFLAGS)
run:window_for_each.out
ifeq ("$(HOST)", "kosambi.local")
	ssh n13 "cd project/thrust2D/test && ./window_for_each.out"    
else
	./window_for_each.out
endif
	
%.out: %.cu
	$(CC)  -o $@ $< $(CFLAGS)

test_%: %.out
	./$<
clean:
	rm *.out
