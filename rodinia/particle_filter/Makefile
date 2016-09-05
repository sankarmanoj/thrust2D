particle_filter: thrust_particle_filter.cu
	nvcc -g -G -lineinfo -DTHRUST_DEBUG thrust_particle_filter.cu -I../../include
	./a.out -x 128 -y 128 -z 1000 -np 10000
