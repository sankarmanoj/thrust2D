==10208== NVPROF is profiling process 10208, command: ./blend.o
==10208== Profiling application: ./blend.o
==10208== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.89%  75.747us         5  15.149us     544ns  40.194us  [CUDA memcpy HtoD]
 23.70%  32.706us         1  32.706us  32.706us  32.706us  [CUDA memcpy DtoH]
 20.27%  27.969us         1  27.969us  27.969us  27.969us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.14%  1.5680us         3     522ns     512ns     544ns  [CUDA memset]

==10208== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.12%  219.45ms         3  73.149ms  3.7380us  219.44ms  cudaMallocPitch
  0.44%  970.69us         3  323.56us  4.4920us  960.75us  cudaMalloc
  0.16%  344.17us        90  3.8240us     131ns  114.46us  cuDeviceGetAttribute
  0.13%  278.46us         3  92.819us  40.413us  191.35us  cudaMemcpy2D
  0.08%  174.59us         1  174.59us  174.59us  174.59us  cuDeviceTotalMem
  0.03%  65.551us         3  21.850us  7.9270us  43.195us  cudaMemset2D
  0.02%  35.217us         3  11.739us  4.5700us  22.856us  cudaMemcpy
  0.02%  33.286us         1  33.286us  33.286us  33.286us  cuDeviceGetName
  0.01%  19.343us         1  19.343us  19.343us  19.343us  cudaLaunch
  0.01%  14.448us         4  3.6120us  1.4520us  9.9330us  cudaFuncGetAttributes
  0.00%  6.7020us        11     609ns     214ns  3.0720us  cudaDeviceGetAttribute
  0.00%  4.7610us         3  1.5870us     219ns  4.2270us  cudaGetDevice
  0.00%  3.3750us         2  1.6870us     841ns  2.5340us  cuDeviceGetCount
  0.00%  2.3060us         1  2.3060us  2.3060us  2.3060us  cudaSetupArgument
  0.00%  1.8610us         1  1.8610us  1.8610us  1.8610us  cudaEventCreateWithFlags
  0.00%  1.7290us         1  1.7290us  1.7290us  1.7290us  cudaEventRecord
  0.00%  1.1150us         1  1.1150us  1.1150us  1.1150us  cudaEventDestroy
  0.00%  1.0370us         1  1.0370us  1.0370us  1.0370us  cudaConfigureCall
  0.00%     510ns         2     255ns     195ns     315ns  cuDeviceGet
