IDIR =-I../../../include
CC=nvcc
CFLAGS=$(IDIR) -D__STDC_CONSTANT_MACROS 		-lavdevice   -lavformat		 -lavfilter    -lavcodec   -lswresample   -lswscale														                -lavutil
run:srad.out
	./srad.out 0 0.5 0 0 test2.avi test_out.avi


srad.out:srad.cu ffmpeg.o primary.o  srad_kernel.cu
	nvcc  $(CFLAGS) ffmpeg.o primary.o srad.cu -o srad.out

primary.o:primary.cu primary.h
	$(CC)  -D__STDC_CONSTANT_MACROS $(IDIR) -c $< -o primary.o
ffmpeg.o:ffmpeg.c
	gcc  -c $(CFLAGS)  ffmpeg.c -o ffmpeg.o
clean:
	rm srad.out test_out.avi *.o
