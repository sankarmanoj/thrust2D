==12830== NVPROF is profiling process 12830, command: ./srad.out 100 0.5 502 458
==12830== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==12830== Profiling application: ./srad.out 100 0.5 502 458
==12830== Profiling result:
==12830== Metric result:
Invocations                               Metric Name                            Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: compress(long, float*)
          1                      dram_read_throughput                 Device Memory Read Throughput  73.787GB/s  73.787GB/s  73.787GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.824841    0.824841    0.824841
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: reduce(long, int, int, float*, float*)
        200                      dram_read_throughput                 Device Memory Read Throughput  897.04MB/s  56.421GB/s  23.557GB/s
        200                        achieved_occupancy                            Achieved Occupancy    0.072722    0.921186    0.495659
        200                         shared_efficiency                      Shared Memory Efficiency      21.17%      24.07%      22.62%
        200                            gld_efficiency                 Global Memory Load Efficiency      12.50%      99.96%      56.23%
        200                            gst_efficiency                Global Memory Store Efficiency      12.50%      12.50%      12.50%
        200      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    1.000000    1.000000    1.000000
        200                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: srad2(float, int, int, long, int*, int*, int*, int*, float*, float*, float*, float*, float*, float*)
        100                      dram_read_throughput                 Device Memory Read Throughput  131.03GB/s  134.54GB/s  132.43GB/s
        100                        achieved_occupancy                            Achieved Occupancy    0.785811    0.825371    0.808691
        100                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
        100                            gld_efficiency                 Global Memory Load Efficiency      90.85%      90.85%      90.85%
        100                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
        100      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
        100                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: extract(long, float*)
          1                      dram_read_throughput                 Device Memory Read Throughput  75.104GB/s  75.104GB/s  75.104GB/s
          1                        achieved_occupancy                            Achieved Occupancy    0.817975    0.817975    0.817975
          1                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
          1                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
          1                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
          1                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: prepare(long, float*, float*, float*)
        100                      dram_read_throughput                 Device Memory Read Throughput  58.483GB/s  65.163GB/s  62.545GB/s
        100                        achieved_occupancy                            Achieved Occupancy    0.848050    0.903642    0.883816
        100                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
        100                            gld_efficiency                 Global Memory Load Efficiency     100.00%     100.00%     100.00%
        100                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
        100      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
        100                         branch_efficiency                             Branch Efficiency     100.00%     100.00%     100.00%
    Kernel: srad(float, int, int, long, int*, int*, int*, int*, float*, float*, float*, float*, float, float*, float*)
        100                      dram_read_throughput                 Device Memory Read Throughput  18.024GB/s  18.992GB/s  18.532GB/s
        100                        achieved_occupancy                            Achieved Occupancy    0.870723    0.888705    0.881333
        100                         shared_efficiency                      Shared Memory Efficiency       0.00%       0.00%       0.00%
        100                            gld_efficiency                 Global Memory Load Efficiency      79.52%      79.52%      79.52%
        100                            gst_efficiency                Global Memory Store Efficiency     100.00%     100.00%     100.00%
        100      shared_load_transactions_per_request   Shared Memory Load Transactions Per Request    0.000000    0.000000    0.000000
        100                         branch_efficiency                             Branch Efficiency      99.72%     100.00%      99.99%
