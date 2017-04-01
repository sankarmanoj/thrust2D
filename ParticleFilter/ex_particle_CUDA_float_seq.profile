==3831== NVPROF is profiling process 3831, command: ./ex_particle_CUDA_float_seq.o -x 128 -y 128 -z 1000 -np 100
==3831== Profiling application: ./ex_particle_CUDA_float_seq.o -x 128 -y 128 -z 1000 -np 100
==3831== Profiling result:
==3831== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: sum_kernel(double*, int)
        999                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  1.9749GB/s  704.77MB/s
        999                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  0.00000B/s  0.00000B/s
    Kernel: likelihood_kernel(double*, double*, double*, double*, double*, int*, int*, double*, unsigned char*, double*, double*, int, int, int, int, int, int, int*, double*)
        999                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  625.11MB/s  496.86MB/s
        999                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  988.69KB/s  0.00000B/s
    Kernel: normalize_weights_kernel(double*, int, double*, double*, double*, int*)
        999                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  2.0826GB/s  514.98MB/s
        999                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  0.00000B/s  0.00000B/s
    Kernel: find_index_kernel(double*, double*, double*, double*, double*, double*, double*, int)
        999                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  2.1625GB/s  525.47MB/s
        999                     dram_write_throughput            Device Memory Write Throughput  0.00000B/s  5.5285MB/s  0.00000B/s
