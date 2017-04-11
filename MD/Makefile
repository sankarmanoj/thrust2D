NVCC			:= nvcc
# use the --device-emulation flag for emulating GPU on the CPU
CC	:= gcc -W -Wall -Wimplicit -Wswitch -Wformat -Wchar-subscripts -Wparentheses -Wmultichar -Wtrigraphs -Wpointer-arith -Wcast-align -Wreturn-type -Wno-unused-function  -fno-strict-aliasing
LINK	:= g++ -fPIC -W -Wall -Wimplicit -Wswitch -Wformat -Wchar-subscripts -Wparentheses -Wmultichar -Wtrigraphs -Wpointer-arith -Wcast-align -Wreturn-type -Wno-unused-function  -fno-strict-aliasing
NVCCFLAGS	:= -arch sm_60
INCLUDES	:= -I.  -I../include
LIBS		:=  -lcudart -lm
MAIN	:= perfsig.out thrust_perfsig.out shared_perfsig.out
all	: $(MAIN)
perfsig.out: main.o MD_kernel_perfsig.o
	$(LINK) -o perfsig.out main.o MD_kernel_perfsig.o $(LIBS)
thrust_perfsig.out: main.o MD_thrust_perfsig.o
		$(LINK) -o thrust_perfsig.out main.o MD_thrust_perfsig.o $(LIBS)
shared_perfsig.out: main.o MD_shared_perfsig.o
		$(LINK) -o shared_perfsig.out main.o MD_shared_perfsig.o $(LIBS)
MD_kernel_perfsig.o: MD_kernel_perfsig.cu
	$(NVCC) $(NVCCFLAGS) $(INCLUDES) -o MD_kernel_perfsig.o -c MD_kernel_perfsig.cu
MD_thrust_perfsig.o: MD_thrust_perfsig.cu
	$(NVCC) $(NVCCFLAGS) $(INCLUDES) -o MD_thrust_perfsig.o -c MD_thrust_perfsig.cu
MD_shared_perfsig.o: MD_shared_perfsig.cu
	$(NVCC) $(NVCCFLAGS) $(INCLUDES) -o MD_shared_perfsig.o -c MD_shared_perfsig.cu
main.o: main.cpp
	$(CC) $(INCLUDES) -o main.o -c main.cpp
clean:
	rm -f *~ *.o *_o $(MAIN)
