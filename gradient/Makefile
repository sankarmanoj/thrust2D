IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -std=c++11 -arch=sm_60 -O3
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.o)
all: $(OBJS)

%.o:%.cu

	$(CC) $(CFLAGS)   $< -o $@
	nvprof --unified-memory-profiling  off --log-file $@.profile ./$@ 100 0.05

clean:
	rm *.o
