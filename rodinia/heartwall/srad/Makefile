IDIR =-I../../../include
CC=nvcc
CFLAGS=  -D__STDC_CONSTANT_MACROS $(IDIR)  -lavdevice                        \
                -lavformat                        \
                -lavfilter                        \
                -lavcodec                         \
                -lswresample                      \
                -lswscale                         \
                -lavutil

srad: srad.cu ffmpeg.c
	#display image.pgm &
	$(CC) $(CFLAGS) $< -o srad.out
	./srad.out 20 0.5 5 ../../../../data/leukocyte/testfile.avi ../../../../data/leukocyte/test_out.avi
	# $(display) image_out.pgm &
