IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -arch=sm_60 -std=c++11  -D_MWAITXINTRIN_H_INCLUDED -O3
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.o)
all: $(OBJS)

%.o:%.cu

	$(CC) $(CFLAGS) `pkg-config --static --libs opencv`   $< -o $@

clean:
	rm *.o
