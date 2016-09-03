# C compiler
CC = nvcc
CC_FLAGS = -I../../../include/meschach_lib -I../../../include -D_FORCE_INLINES


# 'make dbg=1' enables NVCC debugging
ifeq ($(dbg),1)
	CC_FLAGS += -g -O0
else
	CC_FLAGS += -O3
endif

# 'make emu=1' compiles the CUDA kernels for emulation
ifeq ($(emu),1)
	CC_FLAGS += -deviceemu
endif


leukocyte:
	$(CC) $(CC_FLAGS) meschach.a avilib.c detect_main.c find_ellipse_kernel.cu find_ellipse.c misc_math.c track_ellipse_kernel.cu track_ellipse.c -o leukocyte.out
	./leukocyte.out ../../../../data/leukocyte/testfile.avi 100
