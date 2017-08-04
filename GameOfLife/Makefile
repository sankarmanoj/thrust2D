SRCS = $(wildcard *.cu)
OBJS=$(SRCS:.cu=.o)
PROFILES=$(OBJS:.o=.profile)
all: $(OBJS)


%.o:%.cu
	$(CC) $(CFLAGS) $(OPENCVFLAGS) $< -o $@

%.o : %.cu
	nvcc -std=c++11 -g -G -I../include $< -o $@
clean:
	rm -f *.o
