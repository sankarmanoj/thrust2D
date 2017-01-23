==7940== NVPROF is profiling process 7940, command: ./lbp.o
==7940== Profiling application: ./lbp.o
==7940== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.58%  61.248us         1  61.248us  61.248us  61.248us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 24.10%  27.552us         5  5.5100us     832ns  22.944us  [CUDA memcpy HtoD]
 22.31%  25.503us         1  25.503us  25.503us  25.503us  [CUDA memcpy DtoH]

==7940== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.35%  417.14ms         4  104.29ms  5.4030us  417.12ms  cudaMallocPitch
  0.38%  1.5823ms         4  395.57us  5.8450us  1.5605ms  cudaMalloc
  0.11%  460.51us         2  230.25us  147.34us  313.17us  cudaMemcpy2D
  0.07%  307.60us        90  3.4170us     148ns  114.61us  cuDeviceGetAttribute
  0.05%  194.12us         1  194.12us  194.12us  194.12us  cuDeviceTotalMem
  0.01%  54.915us         4  13.728us  6.2770us  33.643us  cudaMemcpy
  0.01%  40.323us         1  40.323us  40.323us  40.323us  cudaLaunch
  0.01%  31.482us         1  31.482us  31.482us  31.482us  cuDeviceGetName
  0.00%  13.444us         4  3.3610us  1.9910us  6.8080us  cudaFuncGetAttributes
  0.00%  6.1260us        11     556ns     276ns  1.8750us  cudaDeviceGetAttribute
  0.00%  5.9300us         1  5.9300us  5.9300us  5.9300us  cudaSetupArgument
  0.00%  4.8280us         3  1.6090us     320ns  4.0280us  cudaGetDevice
  0.00%  4.3820us         1  4.3820us  4.3820us  4.3820us  cudaEventCreateWithFlags
  0.00%  3.4350us         1  3.4350us  3.4350us  3.4350us  cudaEventRecord
  0.00%  2.5300us         1  2.5300us  2.5300us  2.5300us  cudaConfigureCall
  0.00%  2.5040us         1  2.5040us  2.5040us  2.5040us  cudaEventDestroy
  0.00%  2.3610us         2  1.1800us     287ns  2.0740us  cuDeviceGetCount
  0.00%     921ns         1     921ns     921ns     921ns  cudaGetLastError
  0.00%     437ns         2     218ns     182ns     255ns  cuDeviceGet
