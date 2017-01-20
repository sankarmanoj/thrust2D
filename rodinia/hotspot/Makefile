IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++ -std=c++11 -Wno-deprecated-gpu-targets -D_MWAITXINTRIN_H_INCLUDED

%.out: %.cu
	clear
	clear
	$(CC)  -o $@ $< $(CFLAGS)

rod_hotspot_64: hotspot.out
	./hotspot.out 64 2 2 temp_64 power_64 result.out
	openssl md5 result.out

rod_hotspot_512: hotspot.out
	./hotspot.out 512 2 2 temp_512 power_512 result.out
	openssl md5 result.out

rod_hotspot_1024: hotspot.out
	nvprof --unified-memory-profiling off --log-file non_shared.profile ./hotspot.out 1024 2 2 temp_1024 power_1024 result.out
	openssl md5 result.out

rod_hotspot_cuda_64: hotspot_cuda.out
	./hotspot_cuda.out 64 2 2 temp_64	power_64 result_cuda.out
	openssl md5 result_cuda.out

rod_hotspot_cuda_512: hotspot_cuda.out
	./hotspot_cuda.out 512 2 2 temp_512	power_512 result_cuda.out
	openssl md5 result_cuda.out

rod_hotspot_cuda_1024: hotspot_cuda.out
	nvprof --unified-memory-profiling off --log-file cuda.profile ./hotspot_cuda.out 1024 2 2 temp_1024	power_1024 result_cuda.out
	openssl md5 result_cuda.out

rod_hotspot_shared_64: hotspot_shared.out
	./hotspot_shared.out 64 2 2 temp_64	power_64 result_shared.out
	openssl md5 result_shared.out

rod_hotspot_shared_512: hotspot_shared.out
	./hotspot_shared.out 512 2 2 temp_512	power_512 result_shared.out
	openssl md5 result_shared.out

rod_hotspot_shared_1024: hotspot_shared.out
	nvprof --unified-memory-profiling off --log-file shared.profile ./hotspot_shared.out 1024 2 2 temp_1024	power_1024 result_shared.out
	openssl md5 result_shared.out

rod_hotspot_foreach_64: hotspot_foreach.out
	./hotspot_foreach.out 64 2 2 temp_64	power_64 result_foreach.out
	openssl md5 result_foreach.out

rod_hotspot_foreach_512: hotspot_foreach.out
	./hotspot_foreach.out 512 2 2 temp_512	power_512 result_foreach.out
	openssl md5 result_foreach.out

rod_hotspot_foreach_1024: hotspot_foreach.out
	nvprof --unified-memory-profiling off --log-file foreach.profile ./hotspot_foreach.out 1024 2 2 temp_1024	power_1024 result_foreach.out
	openssl md5 result_foreach.out

rod_hotspot_host_64: hotspot_host.out
	./hotspot_host.out 64 2 2 temp_64	power_64 result_host.out
	openssl md5 result_host.out

rod_hotspot_host_512: hotspot_host.out
	./hotspot_host.out 512 2 2 temp_512	power_512 result_host.out
	openssl md5 result_host.out

rod_hotspot_host_1024: hotspot_host.out
	./hotspot_host.out 1024 2 2 temp_1024	power_1024 result_host.out
	openssl md5 result_host.out
