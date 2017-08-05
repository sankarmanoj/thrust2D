all: fft.o nmm.o tmm.o

fft.o: fft.cu
	nvcc -I../include -lcufft fft.cu -o fft.o

nmm.o: nmm.cu
	nvcc -I../include -lcufft -lcublas -lcurand nmm.cu -o nmm.o

tmm.o: tmm.cu
	nvcc -I../include -lcufft -lcublas tmm.cu -o tmm.o
