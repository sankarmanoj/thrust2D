IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -std=c++11 -arch=sm_60 -O3
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

.PHONY: clean
OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)

.PHONY: all

%.o:%.cu

	$(CC) $(CFLAGS)  $< -o $@
	# nvprof --unified-memory-profiling  off --log-file $@.profile ./$@ 100 0.05
%.profile:%.o
		nvprof --log-file $@ ./$^ 100 0.01
.PHONY: profile-all
profile-all: $(PROFILES)

clean:
	rm *.o
