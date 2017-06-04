# C compiler
CC = g++
ICC = icc
CC_FLAGS = -g -fopenmp -O2
DFLAGS = -g -DDEBUG
OFFLOAD_CC_FLAGS = -offload-option,mic,compiler,"-no-opt-prefetch"

all: hotspot thrust_hotspot


hotspot: hotspot_openmp.cpp Makefile
	$(CC) $(DFLAGS) $(CC_FLAGS) -DPROFILING hotspot_openmp.cpp -o hotspot


thrust_hotspot:
	nvcc $(DFLAGS)-std=c++11 -Xcompiler -fopenmp -DPROFILING -DTHRUST_DEVICE_SYSTEM=THRUST_DEVICE_SYSTEM_OMP hotspot_openmp.cpp -o thrust_hotspot
clean:
	rm -f hotspot thrust_hotspot
