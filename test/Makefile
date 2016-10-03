IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR)
OPENCVALLFLAGS=-lopencv_calib3d  -lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_ts -lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_videoio -lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_videoio -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_videoio -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_video -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_video -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_video -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_videostab -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_videostab -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_videostab -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_cudabgsegm -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres
OPENCVFLAGS=-lopencv_core -lopencv_imgcodecs -lopencv_highgui
EXECUTABLES = block_2d.out block_iterator.out sub_block.out window_2d.out
HOST=$(shell hostname)
debug:window_for_each.cu
	$(CC)  -g -G -O0 -lineinfo -o window_for_each.out window_for_each.cu $(CFLAGS)
run:window_for_each.out
ifeq ("$(HOST)", "kosambi.local")
	ssh n13 "cd project/thrust2D/test && ./window_for_each.out"
else
	./window_for_each.out
endif

image:image.cu
	$(CC) $(CFLAGS) $(OPENCVFLAGS) image.cu -o image.out

test_%: %.out
	./$<
clean:
	rm *.out
