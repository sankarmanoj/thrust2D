IDIR =../../include
CC=nvcc
CFLAGS=-I$(IDIR)   -std=c++11 -Xcompiler -fopenmp 
DFLAGS =-DDEBUG -g -G -lineinfo
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
	rm *.o
