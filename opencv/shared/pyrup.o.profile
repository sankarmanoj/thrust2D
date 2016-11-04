==4929== NVPROF is profiling process 4929, command: ./pyrup.o
==4929== Profiling application: ./pyrup.o
==4929== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 72.84%  597.90us         1  597.90us  597.90us  597.90us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 16.94%  139.08us        56  2.4830us  1.0880us  72.485us  [CUDA memcpy HtoD]
  7.54%  61.891us        51  1.2130us     320ns  18.753us  [CUDA memcpy DtoH]
  1.17%  9.6010us         4  2.4000us  1.3760us  4.0960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.61%  4.9920us         1  4.9920us  4.9920us  4.9920us  [CUDA memcpy DtoD]
  0.59%  4.8640us         1  4.8640us  4.8640us  4.8640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.30%  2.4960us         1  2.4960us  2.4960us  2.4960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4929== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.09%  331.86ms        10  33.186ms  4.5020us  331.07ms  cudaMalloc
  0.24%  796.70us       101  7.8880us  2.0310us  72.198us  cudaMemcpyAsync
  0.20%  686.51us        90  7.6270us     120ns  290.50us  cuDeviceGetAttribute
  0.18%  611.08us         2  305.54us  6.9750us  604.10us  cudaDeviceSynchronize
  0.08%  279.14us         1  279.14us  279.14us  279.14us  cudaGetDeviceProperties
  0.06%  211.78us         1  211.78us  211.78us  211.78us  cuDeviceTotalMem
  0.04%  146.49us         7  20.926us  4.7450us  53.543us  cudaMemcpy
  0.04%  143.52us         4  35.880us  6.0300us  108.23us  cudaFree
  0.02%  68.913us         7  9.8440us  5.9860us  15.437us  cudaLaunch
  0.01%  42.754us        25  1.7100us  1.4200us  3.4910us  cudaFuncGetAttributes
  0.01%  37.583us         1  37.583us  37.583us  37.583us  cuDeviceGetName
  0.00%  7.1460us        19     376ns     205ns  1.2590us  cudaGetDevice
  0.00%  6.8530us         6  1.1420us     747ns  1.5650us  cudaEventCreateWithFlags
  0.00%  5.3210us         6     886ns     643ns  1.1820us  cudaEventRecord
  0.00%  4.7320us        11     430ns     116ns  2.7480us  cudaSetupArgument
  0.00%  4.3740us         6     729ns     546ns     910ns  cudaEventDestroy
  0.00%  3.8850us        15     259ns     209ns     682ns  cudaDeviceGetAttribute
  0.00%  2.1550us         2  1.0770us     361ns  1.7940us  cuDeviceGetCount
  0.00%  2.0850us         7     297ns     175ns     644ns  cudaConfigureCall
  0.00%     910ns         1     910ns     910ns     910ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     668ns         2     334ns     206ns     462ns  cuDeviceGet
  0.00%     304ns         1     304ns     304ns     304ns  cudaGetLastError
