==18197== NVPROF is profiling process 18197, command: ./test.o -x 128 -y 128 -z 1000 -np 100
==18197== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==18197== Profiling application: ./test.o -x 128 -y 128 -z 1000 -np 100
==18197== Profiling result:
==18197== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: sum_kernel(double*, int)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      25.00%      25.00%      25.00%
        999                            gst_efficiency            Global Memory Store Efficiency      25.00%      25.00%      25.00%
        999                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
        999                        shared_utilization                 Shared Memory Utilization    Idle (0)    Idle (0)    Idle (0)
    Kernel: likelihood_kernel(double*, double*, double*, double*, double*, int*, int*, double*, unsigned char*, double*, double*, int, int, int, int, int, int, int*, double*)
        999                         branch_efficiency                         Branch Efficiency      92.35%     100.00%      99.38%
        999                            gld_efficiency             Global Memory Load Efficiency      26.82%      40.21%      39.01%
        999                            gst_efficiency            Global Memory Store Efficiency      14.96%      14.96%      14.96%
        999                         shared_efficiency                  Shared Memory Efficiency      85.43%      85.43%      85.43%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<int>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<int>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          1                            gst_efficiency            Global Memory Store Efficiency      99.94%      99.94%      99.94%
          1                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: normalize_weights_kernel(double*, int, double*, double*, double*, int*)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      29.43%      29.43%      29.43%
        999                            gst_efficiency            Global Memory Store Efficiency      20.48%      20.48%      20.48%
        999                         shared_efficiency                  Shared Memory Efficiency     105.21%     105.21%     105.21%
        999                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<double>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<double>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          7                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          7                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          7                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          7                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          7                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: find_index_kernel(double*, double*, double*, double*, double*, double*, double*, int)
        999                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
        999                            gld_efficiency             Global Memory Load Efficiency      29.33%      75.68%      39.78%
        999                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
        999                         shared_efficiency                  Shared Memory Efficiency       0.00%       0.00%       0.00%
        999                        shared_utilization                 Shared Memory Utilization    Idle (0)    Idle (0)    Idle (0)
