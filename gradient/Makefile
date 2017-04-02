.SUFFIXES:            # Delete the default suffixes
.SUFFIXES: .cu .o .profile  # Define our suffix list

IDIR =../include
CC=nvcc
CPPC=icpc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -std=c++11 -arch=sm_60
DFLAGS =-DDEBUG -g -G -lineinfo
SRCS = $(wildcard *.cu)

.PHONY: clean
OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)

.PHONY: all

.PRECIOUS:$(OBJS)
%.o:%.cu Makefile
	$(CC) $(CFLAGS)  $< -o $@
%.o:%.cpp Makefile
	$(CPPC) $< -qopenmp -o $@

%.profile:%.o
		nvprof --unified-memory-profiling off -m dram_read_throughput -m dram_write_throughput --log-file $@ ./$^ 1 0.01

.PHONY: profile-all
profile-all: $(PROFILES)

openmp: omp_descent.cpp
	g++ -O3 -ffast-math -fopenmp omp_descent.cpp -o omp_descent.o -lm
omp_mic: omp_descent.cpp
	icpc -O3 -mmic -std=c++11 -qopenmp omp_descent.cpp -o omp_descent.o -lm

run_openmp:
	time ./omp_descent.o 10 0.01

cpp: cpp_descent.cpp
	g++ -O3 -ffast-math cpp_descent.cpp -o cpp_descent.o -lm
cpp_mic: cpp_descent.cpp
	icpc -O3 -mmic -std=c++11 cpp_descent.cpp -o cpp_descent.o -lm

run_cpp:
	time ./cpp_descent.o 10 0.01

clean:
	rm -f *.o
	rm -f *.profile
