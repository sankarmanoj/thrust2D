IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -std=c++11 -arch=sm_60 -DSHOW
DFLAGS =-DDEBUG -g -G -lineinfo -O0
OPENCVFLAGS=$(shell pkg-config --libs --static opencv) -lcudart
SRCS = $(wildcard *.cu)
OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)

%.o:%.cu
	$(CC) $(CFLAGS) $(OPENCVFLAGS) $< -o $@
%.profile:%.o
		nvprof --unified-memory-profiling  off --log-file $@.time ./$^ 512
		nvprof --unified-memory-profiling  off -m dram_read_throughput -m achieved_occupancy -m shared_efficiency -m gld_efficiency -m gst_efficiency -m shared_load_transactions_per_request -m branch_efficiency --log-file $@ ./$^ 512
		/usr/bin/time -v --output=$@.total_time ./$< 512
.PHONY: profile-all
profile-all: $(PROFILES)
clean:
	rm -f  *.o
	rm -f *.profile*
	rm -f *.time
