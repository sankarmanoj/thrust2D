SRCS = $(wildcard *.cu)
OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)



%.o : %.cu
	nvcc -std=c++11 -I../include  -arch  sm_60 $< -o $@ 
clean:
	rm -f *.o
