CC=nvcc
CFLAGS= -std=c++11 -ccbin=g++-5 -Xcompiler -fopenmp
OPENCVFLAGS=$(shell pkg-config --libs --static opencv)
SRCS = $(wildcard *.cpp)
OBJS=$(SRCS:.cpp=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)
%.o:%.cpp
	$(CC) $(CFLAGS) $(OPENCVFLAGS) $< -o $@
%.profile:%.o
		/usr/bin/time -v --output=$@.total_time ./$< 512
.PHONY: profile-all
profile-all: $(PROFILES)
clean:
		rm -f  *.o
		rm -f *.profile*
		rm -f *.time
