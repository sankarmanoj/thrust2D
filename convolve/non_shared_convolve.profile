==4787== NVPROF is profiling process 4787, command: ./non_shared_convolve.o
==4787== Profiling application: ./non_shared_convolve.o
==4787== Profiling result:
==4787== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::conv_Kernel<float>(float const *, float const , thrust::conv_Kernel<float>*, int, int)
        100                      dram_read_throughput             Device Memory Read Throughput  20.145GB/s  21.942GB/s  20.932GB/s
        100                     dram_write_throughput            Device Memory Write Throughput  25.263GB/s  27.210GB/s  25.966GB/s
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          3                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  314.98MB/s  189.78MB/s
          3                     dram_write_throughput            Device Memory Write Throughput  104.51MB/s  140.03GB/s  101.95GB/s
