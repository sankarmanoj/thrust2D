IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++ -std=c++11 -DPROFILING
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.out)
all: $(OBJS)

%.out: %.cu
	$(CC) -o $@ $< $(CFLAGS)

rod_hotspot_512: hotspot.out
	nvprof --unified-memory-profiling off --log-file non_shared.profile.time ./hotspot.out 512 2 2 temp_512 power_512 result.out
	nvprof --unified-memory-profiling  off -m dram_read_throughput -m achieved_occupancy -m shared_efficiency -m gld_efficiency -m gst_efficiency -m shared_load_transactions_per_request -m branch_efficiency --log-file non_shared.profile ./hotspot.out 512 2 2 temp_512 power_512 result.out
	/usr/bin/time -v --output=non_shared.profile.total_time ./hotspot.out 512 2 2 temp_512 power_512 result.out
	openssl md5 result.out

rod_hotspot_cuda_512: hotspot_cuda.out
	nvprof --unified-memory-profiling off --log-file cuda.profile.time ./hotspot_cuda.out 512 2 2 temp_512 power_512 result.out
	nvprof --unified-memory-profiling  off -m dram_read_throughput -m achieved_occupancy -m shared_efficiency -m gld_efficiency -m gst_efficiency -m shared_load_transactions_per_request -m branch_efficiency --log-file cuda.profile ./hotspot_cuda.out 512 2 2 temp_512 power_512 result.out
	/usr/bin/time -v --output=cuda.profile.total_time ./hotspot_cuda.out 512 2 2 temp_512 power_512 result.out
	openssl md5 result.out

rod_hotspot_shared_512: hotspot_shared.out
	nvprof --unified-memory-profiling off --log-file shared.profile.time ./hotspot_shared.out 512 2 2 temp_512 power_512 result.out
	nvprof --unified-memory-profiling  off -m dram_read_throughput -m achieved_occupancy -m shared_efficiency -m gld_efficiency -m gst_efficiency -m shared_load_transactions_per_request -m branch_efficiency --log-file shared.profile ./hotspot_shared.out 512 2 2 temp_512 power_512 result.out
	/usr/bin/time -v --output=shared.profile.total_time ./hotspot_shared.out 512 2 2 temp_512 power_512 result.out
	openssl md5 result.out

rod_hotspot_foreach_512: hotspot_foreach.out
	nvprof --unified-memory-profiling off --log-file foreach.profile ./hotspot_foreach.out 512 2 2 temp_512	power_512 result_foreach.out
	openssl md5 result_foreach.out

rod_hotspot_host_512: hotspot_host.out
	./hotspot_host.out 512 2 2 temp_512	power_512 result_host.out
	openssl md5 result_host.out

clean:
	rm *.out *.profile
