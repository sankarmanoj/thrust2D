IDIR =../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++ -std=c++11
DFLAGS =-DDEBUG -g -G -lineinfo
OPENCVALLFLAGS=-lopencv_cudafeatures2d -lopencv_cudaoptflow  -lcublas -lopencv_flann -lopencv_objdetect -lopencv_ts -lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_videoio -lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_videoio -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_videoio -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_video -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_video -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_video -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_videostab -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_videostab -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_videostab -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_cudabgsegm -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres
OPENCVFLAGS=$(shell pkg-config --libs --static opencv) -lcudart
EXECUTABLES = block_2d.out block_iterator.out sub_block.out window_2d.out
HOST=$(shell hostname)
debug:window_for_each.cu
	$(CC)  $(DFLAGS) -O0 -o window_for_each.out window_for_each.cu $(CFLAGS)
run:window_for_each.out
ifeq ("$(HOST)", "kosambi.local")
	ssh n13 "cd project/thrust2D/test && ./window_for_each.out"
else
	./window_for_each.out
endif

OBJS=$(SRCS:.cu=.o)
all: $(OBJS)

image:image.cu
	$(CC) $(CFLAGS) $(DFLAGS) $(OPENCVFLAGS) image.cu -o image.out
aimage:image_affine.cu
	$(CC) $(CFLAGS) $(DFLAGS) $(OPENCVFLAGS) $< -o aimage.out

%.o:%.cu
	$(CC) $(CFLAGS)   $(OPENCVFLAGS) $< -o $@

test_%: %.o
	./$<
clean:
	rm *.out
