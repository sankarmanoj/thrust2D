==10395== NVPROF is profiling process 10395, command: ./sblend.o
==10395== Some kernel(s) will be replayed on device 0 in order to collect all events/metrics.
==10395== Profiling application: ./sblend.o
==10395== Profiling result:
==10395== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, blendFunctor>(long, unsigned char, thrust::device_ptr<unsigned char>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, float)
         10                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
         10                            gld_efficiency             Global Memory Load Efficiency     100.00%     100.00%     100.00%
         10                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
         10                         shared_efficiency                  Shared Memory Efficiency      50.00%      50.00%      50.00%
         10                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          1                         branch_efficiency                         Branch Efficiency     100.00%     100.00%     100.00%
          1                            gld_efficiency             Global Memory Load Efficiency       0.00%       0.00%       0.00%
          1                            gst_efficiency            Global Memory Store Efficiency     100.00%     100.00%     100.00%
          1                         shared_efficiency                  Shared Memory Efficiency       3.12%       3.12%       3.12%
          1                        shared_utilization                 Shared Memory Utilization     Low (1)     Low (1)     Low (1)