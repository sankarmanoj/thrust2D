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

openmp: omp_descent.cpp Makefile
	icpc -O3 -I$(IDIR)  -qopenmp omp_descent.cpp -o omp_descent.o -lm
nopenmp : omp-native.cpp Makefile
	icpc -O3 -qopenmp omp-native.cpp -o omp-native.o -lm
omp_mic: omp_descent.cpp Makefile
	icpc -O3 -mmic -std=c++11 -qopenmp -qopenmp-link static omp_descent.cpp -o omp_descent.o -lm
run_openmp:
	time ./omp_descent.o 10 0.01

cpp: cpp_descent.cpp
	icpc -O3  -qopenmp cpp_descent.cpp -o cpp_descent.o -lm
ncpp: cpp-native.cpp
	icpc -O3  -qopenmp cpp-native.cpp -o cpp-native.o -lm   #OpenMP is included for omp_get_wtime()
cpp_mic: cpp_descent.cpp
	icpc -O3 -mmic -std=c++11 cpp_descent.cpp -o cpp_descent.o -lm

run_cpp:
	time ./cpp_descent.o 10 0.01

clean:
	rm -f *.o
	rm -f *.profile
