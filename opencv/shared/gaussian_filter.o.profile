==13901== NVPROF is profiling process 13901, command: ./gaussian_filter.o
==13901== Profiling application: ./gaussian_filter.o
==13901== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.45%  675.59us        19  35.557us     320ns  664.68us  [CUDA memcpy DtoH]
 22.36%  267.61us         1  267.61us  267.61us  267.61us  void thrust::transform_texture_kernel<float, convolutionFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 19.13%  228.89us        25  9.1550us     544ns  197.62us  [CUDA memcpy HtoD]
  0.93%  11.167us         1  11.167us  11.167us  11.167us  [CUDA memcpy DtoD]
  0.84%  10.047us         3  3.3490us  1.5670us  4.6400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.29%  3.4880us         1  3.4880us  3.4880us  3.4880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==13901== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.33%  746.24ms        10  74.624ms  9.8700us  741.86ms  cudaMalloc
  0.54%  4.0940ms         1  4.0940ms  4.0940ms  4.0940ms  cudaGetDeviceProperties
  0.32%  2.4236ms         7  346.23us  20.771us  2.1183ms  cudaMemcpy
  0.26%  2.0109ms        37  54.349us  4.1960us  515.42us  cudaMemcpyAsync
  0.19%  1.4085ms         4  352.12us  22.461us  1.1458ms  cudaFree
  0.13%  980.35us         1  980.35us  980.35us  980.35us  cudaMallocPitch
  0.06%  475.03us         4  118.76us  1.6540us  460.92us  cudaEventCreateWithFlags
  0.05%  386.70us         5  77.339us  40.570us  184.07us  cudaLaunch
  0.04%  285.91us        91  3.1410us     128ns  101.04us  cuDeviceGetAttribute
  0.03%  244.14us         1  244.14us  244.14us  244.14us  cuDeviceTotalMem
  0.01%  92.436us        16  5.7770us  2.2440us  30.488us  cudaFuncGetAttributes
  0.01%  88.177us         1  88.177us  88.177us  88.177us  cuDeviceGetName
  0.01%  44.160us         1  44.160us  44.160us  44.160us  cudaMemcpy2D
  0.00%  29.024us         8  3.6280us     227ns  25.436us  cudaSetupArgument
  0.00%  28.369us        12  2.3640us     384ns  13.447us  cudaGetDevice
  0.00%  24.343us         1  24.343us  24.343us  24.343us  cudaCreateTextureObject
  0.00%  18.430us         4  4.6070us  1.6110us  8.8520us  cudaEventRecord
  0.00%  15.765us        11  1.4330us     290ns  6.8450us  cudaDeviceGetAttribute
  0.00%  12.989us         4  3.2470us  1.8520us  6.5530us  cudaEventDestroy
  0.00%  11.654us         5  2.3300us  1.0810us  6.8220us  cudaConfigureCall
  0.00%  11.513us         3  3.8370us     813ns  7.5720us  cuDeviceGetCount
  0.00%  5.5040us         3  1.8340us     671ns  3.3010us  cuDeviceGet
  0.00%     309ns         1     309ns     309ns     309ns  cudaCreateChannelDesc
