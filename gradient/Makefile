.SUFFIXES:            # Delete the default suffixes
.SUFFIXES: .cu .o .profile  # Define our suffix list

IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -std=c++11 -arch=sm_60
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
		nvprof --unified-memory-profiling  off --log-file $@.time ./$^ 10 0.01
		# nvprof -m branch_efficiency -m gld_efficiency -m gst_efficiency -m shared_efficiency --log-file $@ ./$^ 1 0.01
.PHONY: profile-all
profile-all: $(PROFILES)

openmp: omp_descent.cpp
	g++ -O3 -ffast-math -fopenmp omp_descent.cpp -o omp_descent.o -lm

run_openmp:
	time ./omp_descent.o 10 0.01

cpp: cpp_descent.cpp
	g++ -O3 -ffast-math cpp_descent.cpp -o cpp_descent.o -lm

run_cpp:
	time ./cpp_descent.o 10 0.01

clean:
	rm -f *.o
	rm -f *.profile
