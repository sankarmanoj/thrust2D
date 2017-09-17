IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++ -arch=sm_35 -std=c++11  -D_MWAITXINTRIN_H_INCLUDED -O3
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)

%.o:%.cu

	$(CC) $(CFLAGS) `pkg-config --static --libs opencv`   $< -o $@

%.profile:%.o
		# nvprof  --log-file $@.time ./$^
		# nvprof -m branch_efficiency -m gld_transactions_per_request -m gst_transactions_per_request -m shared_efficiency --log-file $@ ./$^
		nvprof --unified-memory-profiling off -m dram_read_throughput -m dram_write_throughput --log-file $@ ./$^

.PHONY: profile-all
profile-all: $(PROFILES)

clean:
	rm *.o
