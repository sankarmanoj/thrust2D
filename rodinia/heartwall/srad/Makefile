IDIR =-I../../../include
CC=nvcc
CFLAGS=$(IDIR) -lavformat -lavcodec -lavutil -lavfilter

srad: srad.cu ffmpeg.c
	#display image.pgm &
	$(CC) $(CFLAGS) $< -o srad.out
	./srad.out 20 0.5 5 ../../../../data/leukocyte/testfile.avi ../../../../data/leukocyte/test_out.avi
	# $(display) image_out.pgm &
