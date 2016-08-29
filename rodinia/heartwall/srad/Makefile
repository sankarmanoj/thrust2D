IDIR =-I../../../include
CC=nvcc
CFLAGS=$(IDIR) -D__STDC_CONSTANT_MACROS 		-lavdevice                        \
														                -lavformat                        \
														                -lavfilter                        \
														                -lavcodec                         \
														                -lswresample                      \
														                -lswscale                         \
														                -lavutil

run:srad.out
	./srad.out 1.7 0.5 10 1 test2.avi test_out.avi
srad.out: srad.cu ffmpeg.c srad_kernel.cu
	#display image.pgm &
	$(CC) $(CFLAGS) $< -o srad.out

	# $(display) image_out.pgm &
clean:
	rm srad.out test_out.avi
