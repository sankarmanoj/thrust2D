IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -arch=sm_60 -std=c++11  -D_MWAITXINTRIN_H_INCLUDED -O3
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)

%.o:%.cu

	$(CC) $(CFLAGS) `pkg-config --static --libs opencv`   $< -o $@

%.profile:%.o
		nvprof  --log-file $@.time ./$^
		nvprof -m branch_efficiency -m gld_efficiency -m gst_efficiency -m shared_efficiency -m shared_utilization --log-file $@ ./$^

.PHONY: profile-all
profile-all: $(PROFILES)

clean:
	rm -f *.o
	rm -f *.profile*
