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
		nvprof  --log-file $@.time ./$^ -x 128 -y 128 -z 1000 -np 100
		# nvprof -m branch_efficiency -m gld_efficiency -m gst_efficiency -m shared_efficiency -m shared_utilization --log-file $@ ./$^ -x  128	-y 128 -z 1000 -np 100

.PHONY: profile-all
profile-all: $(PROFILES)


openmp: ex_particle_OPENMP_seq.c thrust_omp_particle_filter.cpp
	gcc -O3 -ffast-math -fopenmp ex_particle_OPENMP_seq.c -o omp_particle_filter.o -lm
	g++ -O3 -ffast-math -fopenmp thrust_omp_particle_filter.cpp -o thrust_omp_particle_filter.o -lm

run_openmp:
	time ./omp_particle_filter.o -x 128	-y 128 -z 1000 -np 100
	time ./thrust_omp_particle_filter.o -x 128 -y 128 -z 1000 -np 100

icc_openmp: ex_particle_OPENMP_seq.c
	icc -O3 -fast -openmp ex_particle_OPENMP_seq.c -o omp_particle_filter.o


clean:
		rm -f *.o
		rm -f *.profile*
		rm particle_filter
