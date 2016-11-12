IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR) -ccbin=g++-5 -std=c++11 -Wno-deprecated-gpu-targets -D_MWAITXINTRIN_H_INCLUDED
DFLAGS =-DDEBUG -g -G -lineinfo
OPENCVALLFLAGS=-lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_ts -lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_videoio -lopencv_cudafeatures2d -lopencv_cudaoptflow -lopencv_flann -lopencv_objdetect -lopencv_videoio -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_videoio -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_video -lopencv_cudafilters -lopencv_cudastereo -lopencv_highgui -lopencv_photo -lopencv_video -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_video -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_videostab -lopencv_cudaimgproc -lopencv_cudawarping -lopencv_imgcodecs -lopencv_shape -lopencv_videostab -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_videostab -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_cudabgsegm -lopencv_cudalegacy -lopencv_cudev -lopencv_imgproc -lopencv_stitching -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres -lopencv_cudaobjdetect -lopencv_features2d -lopencv_ml -lopencv_superres
OPENCVFLAGS=$(shell pkg-config --libs --static opencv) -lcudart
SRCS = $(wildcard *.cu)

OBJS=$(SRCS:.cu=.o)
all: $(OBJS)

%.o:%.cu
	$(CC) $(CFLAGS) $(DFLAGS) -O0 $(OPENCVFLAGS) $< -o $@
	nvprof --unified-memory-profiling off --log-file $@.profile ./$@
clean:
	rm *.o
	
