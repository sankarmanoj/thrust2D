CC := nvcc
CCFLAGS := -D_FORCE_INLINES -std=c++11 -ccbin=g++-5 -D_MWAITXINTRIN_H_INCLUDED
# Example
# target: dependencies
	# command 1
	# command 2
          # .
          # .
          # .
	# command n

# link objects(binaries) together
srad:		main.o
	$(CC) $(CCFLAGS)	main.o \
				-lm -lcuda -lcudart -o srad.out

# compile main function file into object (binary)
main.o: 	main.cu \
				define.c \
				graphics.c \
				extract_kernel.cu \
				prepare_kernel.cu \
				reduce_kernel.cu \
				srad_kernel.cu \
				srad2_kernel.cu \
				compress_kernel.cu
	nvcc $(CCFLAGS)	main.cu \
				-c

# delete all object files
clean:
	rm *.o srad
