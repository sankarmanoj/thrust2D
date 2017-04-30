IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -std=c++11 -ccbin=g++-5 -arch=sm_60
OS := $(shell uname)
ifeq ($(OS),Darwin)
	display=open -a ToyViewer
else
	display=display
endif
all: srad.out srad_non_shared.out
	#display image.pgm &
	nvprof --unified-memory-profiling off --log-file srad_shared.profile.time ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
	nvprof --unified-memory-profiling off --log-file srad_non_shared.profile.time ./srad_non_shared.out 502 458 0.5 100 image.pgm image_out.pgm
	nvprof --unified-memory-profiling  off -m dram_read_throughput -m achieved_occupancy -m shared_efficiency -m gld_efficiency -m gst_efficiency -m shared_load_transactions_per_request -m branch_efficiency --log-file srad_shared.profile ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
	nvprof --unified-memory-profiling  off -m dram_read_throughput -m achieved_occupancy -m shared_efficiency -m gld_efficiency -m gst_efficiency -m shared_load_transactions_per_request -m branch_efficiency --log-file srad_non_shared.profile ./srad_non_shared.out 502 458 0.5 100 image.pgm image_out.pgm
	/usr/bin/time -v --output=srad_shared.profile.total_time ./srad.out 502 458 0.5 100 image.pgm image_out.pgm
	/usr/bin/time -v --output=srad_non_shared.profile.total_time ./srad_non_shared.out 502 458 0.5 100 image.pgm image_out.pgm
	# $(display) image_out.pgm &
%.out: %.cu
	$(CC) -o $@ $< $(CFLAGS)

srad.cu : srad_kernel.cu
srad_non_shared.cu : srad_kernel.cu
clean :
	rm *.out

rod_srad_cuda:
	cd cuda; make srad
