==11102== NVPROF is profiling process 11102, command: ./shared_boxfilter.o
==11102== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==11102== Profiling application: ./shared_boxfilter.o
==11102== Profiling result:
==11102== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::conv_shared_Kernel<float>(float const *, float const , thrust::conv_shared_Kernel<float>*, int, int)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency      49.86%      49.86%      49.86%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency      99.82%      99.82%      99.82%
          1                        shared_utilization                 Shared Memory Utilization     Low (2)     Low (2)     Low (2)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          3                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          3                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          3                            gst_efficiency            Global Memory Store Efficiency      70.83%     100.00%      90.28%
          3                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          3                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
