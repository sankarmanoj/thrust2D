==14372== NVPROF is profiling process 14372, command: ./ex_particle_CUDA_float_seq.o -x 128 -y 128 -z 1000 -np 100
==14372== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==14372== Profiling application: ./ex_particle_CUDA_float_seq.o -x 128 -y 128 -z 1000 -np 100
==14372== Profiling result:
==14372== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: sum_kernel(double*, int)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      25.00%      25.00%      25.00%
        999                            gst_efficiency            Global Memory Store Efficiency      25.00%      25.00%      25.00%
        999                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
        999                        shared_utilization                 Shared Memory Utilization    Idle (0)    Idle (0)    Idle (0)
    Kernel: likelihood_kernel(double*, double*, double*, double*, double*, int*, int*, double*, unsigned char*, double*, double*, int, int, int, int, int, int, int*, double*)
        999                         branch_efficiency                         Branch Efficiency      92.22%     100.00%      99.37%
        999                            gld_efficiency             Global Memory Load Efficiency      26.91%      40.21%      38.98%
        999                            gst_efficiency            Global Memory Store Efficiency      14.96%      14.96%      14.96%
        999                         shared_efficiency                  Shared Memory Efficiency      85.43%      85.43%      85.43%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: normalize_weights_kernel(double*, int, double*, double*, double*, int*)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      39.55%      39.55%      39.55%
        999                            gst_efficiency            Global Memory Store Efficiency      49.59%      49.59%      49.59%
        999                         shared_efficiency                  Shared Memory Efficiency     105.21%     105.21%     105.21%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: find_index_kernel(double*, double*, double*, double*, double*, double*, double*, int)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      29.33%      66.67%      39.83%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
        999                        shared_utilization                 Shared Memory Utilization    Idle (0)    Idle (0)    Idle (0)
