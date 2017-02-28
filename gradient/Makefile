.SUFFIXES:            # Delete the default suffixes
.SUFFIXES: .cu .o .profile  # Define our suffix list

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

.PRECIOUS:$(OBJS)
%.o:%.cu

	$(CC) $(CFLAGS)  $< -o $@
	# nvprof --unified-memory-profiling  off --log-file $@.profile ./$@ 100 0.05
%.profile:%.o
		nvprof  --log-file $@.time ./$^ 1 0.01
		nvprof -m branch_efficiency -m gld_efficiency -m gst_efficiency -m shared_efficiency -m shared_utilization --log-file $@ ./$^ 1 0.01
.PHONY: profile-all
profile-all: $(PROFILES)

clean:
	rm *.o
	rm *.profile
