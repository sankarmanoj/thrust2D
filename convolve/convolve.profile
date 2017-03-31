==4807== NVPROF is profiling process 4807, command: ./convolve.o
==4807== Profiling application: ./convolve.o
==4807== Profiling result:
==4807== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: conv_shared_Kernel(float const *, float const *, float*, int, int)
        100                      dram_read_throughput             Device Memory Read Throughput  21.911GB/s  42.895GB/s  23.209GB/s
        100                     dram_write_throughput            Device Memory Write Throughput  35.165GB/s  39.688GB/s  36.554GB/s
