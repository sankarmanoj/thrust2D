IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR)

%.out: %.cu
	clear
	clear
	$(CC)  -o $@ $< $(CFLAGS)

rod_hotspot_64: hotspot.out
	./hotspot.out 64 2 2 temp_64	power_64 result.out
	openssl md5 result.out

rod_hotspot_512: hotspot.out
	./hotspot.out 512 2 2 temp_512	power_512 result.out
	openssl md5 result.out

rod_hotspot_1024: hotspot.out
	./hotspot.out 1024 2 2 temp_1024	power_1024 result.out
	openssl md5 result.out

rod_hotspot_cuda_64: hotspot_cuda.out
	./hotspot_cuda.out 64 2 2 temp_64	power_64 result_cuda.out
	openssl md5 result.out

rod_hotspot_cuda_512: hotspot_cuda.out
	./hotspot_cuda.out 512 2 2 temp_512	power_512 result_cuda.out
	openssl md5 result.out

rod_hotspot_cuda_1024: hotspot_cuda.out
	./hotspot_cuda.out 1024 2 2 temp_1024	power_1024 result_cuda.out
	openssl md5 result.out
