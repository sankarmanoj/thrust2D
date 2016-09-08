# C compiler
CC = nvcc
CC_FLAGS = -g -G -lineinfo   -D_FORCE_INLINES -I../../../include -D__STDC_CONSTANT_MACROS 		-lavdevice                        \
														                -lavformat                        \
														                -lavfilter                        \
														                -lavcodec                         \
														                -lswresample                      \
														                -lswscale                         \
														                -lavutil

run : heartwall.out
	./heartwall.out ../test.avi 104
# link objects(binaries) together
heartwall.out: main.o ./AVI/avilib.o ./AVI/avimod.o
	$(CC) $(CC_FLAGS) main.o ./AVI/avilib.o ./AVI/avimod.o -o heartwall.out


# compile main function file into object (binary)
main.o: main.cu kernel.cu define.c
	$(CC) $(CC_FLAGS)  main.cu -I./AVI -c -O3

./AVI/avilib.o ./AVI/avimod.o:
	cd AVI; make;

# delete all object files
clean:
	rm -f *.o AVI/*.o heartwall *.linkinfo
