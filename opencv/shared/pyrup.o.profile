==9470== NVPROF is profiling process 9470, command: ./pyrup.o
==9470== Profiling application: ./pyrup.o
==9470== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.97%  712.42us        19  37.495us     320ns  697.70us  [CUDA memcpy DtoH]
 27.64%  322.94us         1  322.94us  322.94us  322.94us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
  8.92%  104.19us        24  4.3410us     544ns  80.768us  [CUDA memcpy HtoD]
  2.17%  25.312us         3  8.4370us  1.5680us  19.424us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.31%  3.6160us         1  3.6160us  3.6160us  3.6160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9470== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.53%  1.25438s         9  139.38ms  6.1600us  1.24984s  cudaMalloc
  0.77%  9.8943ms         1  9.8943ms  9.8943ms  9.8943ms  cudaGetDeviceProperties
  0.76%  9.7746ms        90  108.61us     123ns  6.4945ms  cuDeviceGetAttribute
  0.48%  6.2062ms         4  1.5516ms  10.921us  5.3829ms  cudaFree
  0.21%  2.6529ms         6  442.15us  5.7120us  2.5433ms  cudaMemcpy
  0.10%  1.3070ms         1  1.3070ms  1.3070ms  1.3070ms  cuDeviceTotalMem
  0.07%  853.00us        37  23.054us  3.5080us  210.52us  cudaMemcpyAsync
  0.06%  827.49us         1  827.49us  827.49us  827.49us  cuDeviceGetName
  0.01%  119.36us         5  23.871us  9.8540us  32.893us  cudaLaunch
  0.00%  44.452us        16  2.7780us  1.4160us  6.3560us  cudaFuncGetAttributes
  0.00%  11.158us        12     929ns     222ns  2.6950us  cudaGetDevice
  0.00%  7.8130us         7  1.1160us     192ns  5.8710us  cudaSetupArgument
  0.00%  7.6040us         4  1.9010us     871ns  2.5370us  cudaEventCreateWithFlags
  0.00%  5.7460us         4  1.4360us     822ns  1.8180us  cudaEventRecord
  0.00%  5.3820us        11     489ns     377ns  1.1900us  cudaDeviceGetAttribute
  0.00%  5.2630us         4  1.3150us     578ns  1.5910us  cudaEventDestroy
  0.00%  4.1730us         5     834ns     354ns  1.2290us  cudaConfigureCall
  0.00%  4.1560us         2  2.0780us     282ns  3.8740us  cuDeviceGetCount
  0.00%  1.0040us         2     502ns     292ns     712ns  cuDeviceGet
