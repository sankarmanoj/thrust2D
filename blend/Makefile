IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -arch=sm_60 -std=c++11  -D_MWAITXINTRIN_H_INCLUDED -O3
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)

%.o:%.cu Makefile

	$(CC) $(CFLAGS) `pkg-config --static --libs opencv`   $< -o $@

%.profile:%.o
		# nvprof  --log-file $@.time ./$^
		# nvprof -m branch_efficiency -m gld_transactions_per_request -m gst_transactions_per_request -m shared_efficiency --log-file $@ ./$^
		nvprof --unified-memory-profiling off -m dram_read_throughput -m dram_write_throughput --log-file $@ ./$^

openmp: native_omp.cpp omp_blend.cpp Makefile
		icpc -O3 -qopenmp native_omp.cpp -o native_omp.o `pkg-config --static --libs opencv` -lm
		icpc -O3 -qopenmp omp_blend.cpp -o omp_blend.o `pkg-config --static --libs opencv` -lm

openmp_mic: native_omp.cpp omp_blend.cpp Makefile
		icpc -O3 -mmic -qopenmp native_omp_mic.cpp -o native_omp_mic.o -lm
		icpc -O3 -mmic -qopenmp omp_blend_mic.cpp -o omp_blend_mic.o -lm

.PHONY: profile-all
profile-all: $(PROFILES)

clean:
	rm -f *.o
	rm -f *.profile*
