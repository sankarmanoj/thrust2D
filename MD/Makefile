NVCC			:= nvcc
# use the --device-emulation flag for emulating GPU on the CPU

CC	:= gcc -W -Wall -Wimplicit -Wswitch -Wformat -Wchar-subscripts -Wparentheses -Wmultichar -Wtrigraphs -Wpointer-arith -Wcast-align -Wreturn-type -Wno-unused-function  -fno-strict-aliasing
LINK	:= g++ -fPIC -W -Wall -Wimplicit -Wswitch -Wformat -Wchar-subscripts -Wparentheses -Wmultichar -Wtrigraphs -Wpointer-arith -Wcast-align -Wreturn-type -Wno-unused-function  -fno-strict-aliasing

NVCCFLAGS	:= -arch sm_60
INCLUDES	:= -I.  -I../include
LIBS		:=  -lcudart -lm

MAIN	:= Perfsig thrust_Perfsig

all	: $(MAIN)

Perfsig: main.o MD_kernel_Perfsig.o
	$(LINK) -o Perfsig main.o MD_kernel_Perfsig.o $(LIBS)

thrust_Perfsig : main.o MD_thrust_Perfsig.o
		$(LINK) -o thrust_Perfsig main.o MD_thrust_Perfsig.o $(LIBS)

MD_kernel_Perfsig.o: MD_kernel_Perfsig.cu
	$(NVCC) $(NVCCFLAGS) $(INCLUDES) -o MD_kernel_Perfsig.o -c MD_kernel_Perfsig.cu

MD_thrust_Perfsig.o: MD_kernel_Perfsig.cu
	$(NVCC) $(NVCCFLAGS) $(INCLUDES) -o MD_thrust_Perfsig.o -c MD_thrust_Perfsig.cu

main.o: main.cpp
	$(CC) $(INCLUDES) -o main.o -c main.cpp
clean:
	rm -f *~ *.o *_o $(MAIN)
