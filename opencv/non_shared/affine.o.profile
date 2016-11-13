==7712== NVPROF is profiling process 7712, command: ./affine.o
==7712== Profiling application: ./affine.o
==7712== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 52.28%  366.57us         2  183.28us  96.874us  269.69us  [CUDA memset]
 47.19%  330.88us         1  330.88us  330.88us  330.88us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.54%  3.7760us         3  1.2580us  1.2160us  1.3440us  [CUDA memcpy HtoD]

==7712== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.82%  144.08ms         3  48.027ms  8.5740us  144.00ms  cudaMallocManaged
  0.30%  432.79us         2  216.39us  124.92us  307.87us  cudaMemset
  0.27%  388.90us         3  129.63us  4.7670us  378.51us  cudaMalloc
  0.25%  365.29us         7  52.183us  1.9870us  332.79us  cudaDeviceSynchronize
  0.17%  250.62us        90  2.7840us      99ns  92.982us  cuDeviceGetAttribute
  0.13%  195.33us         1  195.33us  195.33us  195.33us  cuDeviceTotalMem
  0.02%  23.039us         1  23.039us  23.039us  23.039us  cuDeviceGetName
  0.02%  22.498us         1  22.498us  22.498us  22.498us  cudaLaunch
  0.01%  19.777us         3  6.5920us  4.7300us  8.9820us  cudaMemcpy
  0.00%  6.7720us         4  1.6930us  1.4160us  2.4150us  cudaFuncGetAttributes
  0.00%  3.0140us        11     274ns     206ns     763ns  cudaDeviceGetAttribute
  0.00%  1.9350us         1  1.9350us  1.9350us  1.9350us  cudaSetupArgument
  0.00%  1.5260us         1  1.5260us  1.5260us  1.5260us  cudaEventRecord
  0.00%  1.5260us         3     508ns     221ns  1.0570us  cudaGetDevice
  0.00%  1.4810us         1  1.4810us  1.4810us  1.4810us  cudaEventCreateWithFlags
  0.00%  1.2820us         2     641ns     148ns  1.1340us  cuDeviceGetCount
  0.00%     954ns         1     954ns     954ns     954ns  cudaConfigureCall
  0.00%     867ns         1     867ns     867ns     867ns  cudaEventDestroy
  0.00%     328ns         2     164ns     120ns     208ns  cuDeviceGet
