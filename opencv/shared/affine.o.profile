==12669== NVPROF is profiling process 12669, command: ./affine.o
==12669== Profiling application: ./affine.o
==12669== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.78%  96.187us        11  8.7440us  1.1200us  84.221us  [CUDA memcpy HtoD]
 31.93%  85.853us         1  85.853us  85.853us  85.853us  [CUDA memcpy DtoH]
 28.56%  76.798us         1  76.798us  76.798us  76.798us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
  3.73%  10.016us         3  3.3380us  1.4080us  4.5440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12669== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.16%  264.28ms         7  37.754ms  12.632us  263.10ms  cudaMalloc
  0.17%  451.13us        90  5.0120us     136ns  177.85us  cuDeviceGetAttribute
  0.15%  392.37us         1  392.37us  392.37us  392.37us  cudaGetDeviceProperties
  0.14%  361.14us         5  72.228us  15.248us  285.46us  cudaMemcpy
  0.11%  281.33us         3  93.775us  33.948us  148.28us  cudaFree
  0.08%  225.34us         1  225.34us  225.34us  225.34us  cuDeviceTotalMem
  0.08%  205.73us         7  29.390us  3.3450us  181.61us  cudaMemcpyAsync
  0.04%  115.31us         4  28.828us  20.989us  32.838us  cudaLaunch
  0.03%  82.564us         1  82.564us  82.564us  82.564us  cudaDeviceSynchronize
  0.02%  44.567us         1  44.567us  44.567us  44.567us  cuDeviceGetName
  0.02%  41.767us        12  3.4800us  2.5120us  6.4430us  cudaFuncGetAttributes
  0.00%  9.0770us         9  1.0080us     380ns  2.4560us  cudaGetDevice
  0.00%  8.0070us         3  2.6690us  2.5290us  2.8930us  cudaEventCreateWithFlags
  0.00%  7.6210us         6  1.2700us     125ns  5.5340us  cudaSetupArgument
  0.00%  5.7900us         3  1.9300us  1.7900us  2.0590us  cudaEventRecord
  0.00%  4.6010us        11     418ns     267ns  1.1970us  cudaDeviceGetAttribute
  0.00%  4.2500us         3  1.4160us  1.3590us  1.4470us  cudaEventDestroy
  0.00%  3.9400us         4     985ns     841ns  1.3020us  cudaConfigureCall
  0.00%  2.3220us         2  1.1610us     941ns  1.3810us  cuDeviceGetCount
  0.00%     676ns         2     338ns     289ns     387ns  cuDeviceGet
