==10607== NVPROF is profiling process 10607, command: ./gaussian_filter.o
==10607== Profiling application: ./gaussian_filter.o
==10607== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.44%  217.83us         1  217.83us  217.83us  217.83us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 26.26%  123.17us        24  5.1320us  1.1200us  95.458us  [CUDA memcpy HtoD]
 22.42%  105.19us        19  5.5360us     320ns  90.018us  [CUDA memcpy DtoH]
  2.86%  13.408us         4  3.3520us  1.6640us  4.8960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.19%  5.5680us         1  5.5680us  5.5680us  5.5680us  [CUDA memcpy DtoD]
  0.84%  3.9360us         1  3.9360us  3.9360us  3.9360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10607== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.27%  406.40ms        10  40.640ms  9.9290us  398.88ms  cudaMalloc
  1.00%  4.1293ms         4  1.0323ms  26.502us  2.1383ms  cudaFree
  0.15%  637.56us        90  7.0830us     122ns  253.00us  cuDeviceGetAttribute
  0.14%  589.24us        37  15.925us  2.9660us  259.79us  cudaMemcpyAsync
  0.14%  576.80us         7  82.400us  8.9380us  336.79us  cudaMemcpy
  0.08%  346.63us         1  346.63us  346.63us  346.63us  cudaGetDeviceProperties
  0.05%  224.57us         1  224.57us  224.57us  224.57us  cudaDeviceSynchronize
  0.05%  224.35us         6  37.392us  12.313us  72.321us  cudaLaunch
  0.05%  221.13us         1  221.13us  221.13us  221.13us  cuDeviceTotalMem
  0.02%  73.457us        21  3.4970us  1.9340us  9.3670us  cudaFuncGetAttributes
  0.01%  39.505us         1  39.505us  39.505us  39.505us  cuDeviceGetName
  0.00%  18.906us        16  1.1810us     309ns  4.7840us  cudaGetDevice
  0.00%  16.728us         5  3.3450us  1.1740us  6.4160us  cudaEventCreateWithFlags
  0.00%  14.211us        10  1.4210us     140ns  10.638us  cudaSetupArgument
  0.00%  10.065us         5  2.0130us  1.0720us  2.7560us  cudaEventRecord
  0.00%  7.7990us        15     519ns     266ns  2.2610us  cudaDeviceGetAttribute
  0.00%  7.5700us         5  1.5140us     991ns  2.0420us  cudaEventDestroy
  0.00%  6.8440us         6  1.1400us     594ns  1.9370us  cudaConfigureCall
  0.00%  1.8150us         2     907ns     384ns  1.4310us  cuDeviceGetCount
  0.00%  1.6510us         1  1.6510us  1.6510us  1.6510us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     802ns         1     802ns     802ns     802ns  cudaGetLastError
  0.00%     513ns         2     256ns     215ns     298ns  cuDeviceGet
