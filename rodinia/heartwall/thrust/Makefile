# C compiler
CC = nvcc
CC_FLAGS = -lineinfo   -D_FORCE_INLINES -I../../../include

# link objects(binaries) together
heartwall: main.o ./AVI/avilib.o ./AVI/avimod.o
	$(CC) $(CC_FLAGS) main.o ./AVI/avilib.o ./AVI/avimod.o -o heartwall.out
	./heartwall.out ../test.avi 20

# compile main function file into object (binary)
main.o: main.cu kernel.cu define.c
	$(CC) $(CC_FLAGS)  main.cu -I./AVI -c -O3

./AVI/avilib.o ./AVI/avimod.o:
	cd AVI; make;

# delete all object files
clean:
	rm -f *.o AVI/*.o heartwall *.linkinfo
