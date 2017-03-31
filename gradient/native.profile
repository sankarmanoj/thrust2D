==5152== NVPROF is profiling process 5152, command: ./native.o 1 0.01
==5152== Profiling application: ./native.o 1 0.01
==5152== Profiling result:
==5152== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: update_weights(float*, float*, float)
          1                      dram_read_throughput             Device Memory Read Throughput  865.08MB/s  865.08MB/s  864.98MB/s
          1                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  0.00000B/s  0.00000B/s
    Kernel: getdotError(int, int, float*, float*, float*)
          1                      dram_read_throughput             Device Memory Read Throughput  153.59MB/s  153.59MB/s  153.54MB/s
          1                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  0.00000B/s  0.00000B/s
    Kernel: void better_reduce_kernel<unsigned int=256>(float*, float*, float*, unsigned int, unsigned int)
        100                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  1.5910GB/s  634.19MB/s
        100                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  0.00000B/s  0.00000B/s
