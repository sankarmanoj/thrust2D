# #makefile

all: thrust cuda test

cuda: ex_particle_CUDA_float_seq.cu
	/usr/local/cuda/bin/nvcc -I /home/rohith/include -g -lm -O3 -use_fast_math -arch sm_35 ex_particle_CUDA_float_seq.cu -o particlefilter_float

thrust: thrust_particle_filter.cu
#	/usr/local/cuda/bin/nvcc -I /home/rohith/include -std=c++11 -g -lm -O3 -use_fast_math -arch sm_35 thrust_particle_filter.cu -o thrust_particle_filter

	/usr/local/cuda/bin/nvcc -I /home/rohith/include -g -lm -O3 -std=c++11 -use_fast_math -arch sm_35 thrust_particle_filter.cu -o thrust_particle_filter

test: test.cu
	/usr/local/cuda/bin/nvcc -I /home/rohith/include -g -lm -O3 -use_fast_math -arch sm_35 test.cu -o test

clean:
	rm particlefilter_float thrust_particle_filter
