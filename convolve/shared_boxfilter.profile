==4768== NVPROF is profiling process 4768, command: ./shared_boxfilter.o
==4768== Profiling application: ./shared_boxfilter.o
==4768== Profiling result:
==4768== Metric result:
Invocations                               Metric Name                        Metric Description         Min         Max         Avg
Device "GeForce GTX 1070 (0)"
    Kernel: void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
          3                      dram_read_throughput             Device Memory Read Throughput  0.00000B/s  444.76MB/s  250.82MB/s
          3                     dram_write_throughput            Device Memory Write Throughput  156.77MB/s  138.38GB/s  101.66GB/s
    Kernel: void thrust::conv_shared_Kernel<float>(float const *, thrust::constant_vector<thrust::conv_shared_Kernel<float>>, thrust::conv_shared_Kernel<float>*, int, int)
        100                      dram_read_throughput             Device Memory Read Throughput  26.828GB/s  42.652GB/s  32.899GB/s
        100                     dram_write_throughput            Device Memory Write Throughput  34.187GB/s  43.258GB/s  41.387GB/s
