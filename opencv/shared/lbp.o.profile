==6384== NVPROF is profiling process 6384, command: ./lbp.o
==6384== Profiling application: ./lbp.o
==6384== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.15%  45.629us         1  45.629us  45.629us  45.629us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 26.04%  26.909us         6  4.4840us     640ns  21.342us  [CUDA memcpy HtoD]
 20.74%  21.438us         1  21.438us  21.438us  21.438us  [CUDA memcpy DtoH]
  6.90%  7.1360us         3  2.3780us  2.2400us  2.6240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.17%  2.2390us         1  2.2390us  2.2390us  2.2390us  [CUDA memcpy DtoD]

==6384== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.67%  431.54ms         8  53.943ms  4.5160us  428.75ms  cudaMalloc
  1.85%  8.2690ms         2  4.1345ms  1.4170ms  6.8520ms  cudaGetDeviceProperties
  0.72%  3.2300ms        90  35.888us     117ns  1.2635ms  cuDeviceGetAttribute
  0.32%  1.4192ms         1  1.4192ms  1.4192ms  1.4192ms  cudaMallocPitch
  0.20%  878.40us         3  292.80us  4.8380us  852.56us  cudaFree
  0.10%  457.16us         1  457.16us  457.16us  457.16us  cuDeviceTotalMem
  0.07%  301.85us         1  301.85us  301.85us  301.85us  cuDeviceGetName
  0.03%  138.81us         6  23.135us  3.6070us  93.682us  cudaMemcpy
  0.01%  66.801us         4  16.700us  6.3850us  27.993us  cudaLaunch
  0.01%  34.973us         1  34.973us  34.973us  34.973us  cudaMemcpy2D
  0.01%  23.117us        12  1.9260us  1.4020us  4.8320us  cudaFuncGetAttributes
  0.00%  17.458us         1  17.458us  17.458us  17.458us  cudaMemcpyAsync
  0.00%  8.2420us         1  8.2420us  8.2420us  8.2420us  cudaCreateTextureObject
  0.00%  5.0780us         9     564ns     212ns  2.2900us  cudaGetDevice
  0.00%  4.4690us         7     638ns     118ns  2.8370us  cudaSetupArgument
  0.00%  4.1220us         3  1.3740us     767ns  1.7380us  cudaEventCreateWithFlags
  0.00%  3.2970us        11     299ns     214ns     874ns  cudaDeviceGetAttribute
  0.00%  3.2850us         3  1.0950us     623ns  1.3380us  cudaEventRecord
  0.00%  3.2680us         3  1.0890us     519ns  1.5760us  cudaEventDestroy
  0.00%  3.2280us         4     807ns     202ns  1.5720us  cudaConfigureCall
  0.00%  2.0460us         2  1.0230us     508ns  1.5380us  cuDeviceGetCount
  0.00%     557ns         2     278ns     233ns     324ns  cuDeviceGet
  0.00%     205ns         1     205ns     205ns     205ns  cudaCreateChannelDesc
