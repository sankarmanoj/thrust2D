IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -arch=sm_60 -std=c++11  -D_MWAITXINTRIN_H_INCLUDED -O3
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)

%.o:%.cu

	$(CC) $(CFLAGS)    $< -o $@

%.profile:%.o
		nvprof  --log-file $@.time ./$^ -x  128	-y 128 -z 1000 -np 100
		nvprof -m branch_efficiency -m gld_efficiency -m gst_efficiency -m shared_efficiency -m shared_utilization --log-file $@ ./$^ -x  128	-y 128 -z 1000 -np 100

.PHONY: profile-all
profile-all: $(PROFILES)

clean:
	rm *.o
