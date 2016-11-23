==12342== NVPROF is profiling process 12342, command: ./lbp.o
==12342== Profiling application: ./lbp.o
==12342== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.01%  6.1680ms         1  6.1680ms  6.1680ms  6.1680ms  void thrust::transform_texture_kernel<float, lbpFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 34.95%  4.5861ms         2  2.2931ms  2.0328ms  2.5533ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 15.41%  2.0224ms         1  2.0224ms  2.0224ms  2.0224ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.26%  165.12us         6  27.519us     704ns  160.99us  [CUDA memcpy HtoD]
  1.20%  157.76us         1  157.76us  157.76us  157.76us  [CUDA memcpy DtoH]
  0.16%  21.504us         1  21.504us  21.504us  21.504us  [CUDA memcpy DtoD]

==12342== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.12%  3.23661s         8  404.58ms  13.110us  3.23534s  cudaMalloc
  1.39%  45.767ms         3  15.256ms  33.768us  45.384ms  cudaFree
  0.21%  6.8012ms         6  1.1335ms  9.1770us  6.5888ms  cudaMemcpy
  0.20%  6.6382ms         3  2.2127ms  2.0274ms  2.5718ms  cudaDeviceSynchronize
  0.02%  781.65us         4  195.41us  21.845us  692.00us  cudaLaunch
  0.02%  613.73us         1  613.73us  613.73us  613.73us  cudaMallocPitch
  0.02%  500.35us         2  250.18us  202.84us  297.51us  cudaGetDeviceProperties
  0.01%  253.70us         1  253.70us  253.70us  253.70us  cudaMemcpyAsync
  0.01%  253.60us        91  2.7860us     135ns  95.389us  cuDeviceGetAttribute
  0.00%  161.43us         1  161.43us  161.43us  161.43us  cuDeviceTotalMem
  0.00%  47.220us         1  47.220us  47.220us  47.220us  cuDeviceGetName
  0.00%  43.623us        12  3.6350us  2.5740us  7.7130us  cudaFuncGetAttributes
  0.00%  41.212us         1  41.212us  41.212us  41.212us  cudaMemcpy2D
  0.00%  18.050us         3  6.0160us  3.9600us  9.3880us  cudaEventCreateWithFlags
  0.00%  13.599us         1  13.599us  13.599us  13.599us  cudaCreateTextureObject
  0.00%  10.061us         3  3.3530us  2.7610us  4.3620us  cudaEventRecord
  0.00%  8.4430us         9     938ns     376ns  2.2360us  cudaGetDevice
  0.00%  6.4530us        11     586ns     368ns  1.7360us  cudaDeviceGetAttribute
  0.00%  6.3230us         3  2.1070us  1.8530us  2.3620us  cudaEventDestroy
  0.00%  5.2270us         4  1.3060us     937ns  1.5590us  cudaConfigureCall
  0.00%  4.4850us         3  1.4950us     197ns  3.3970us  cuDeviceGetCount
  0.00%  3.1370us         7     448ns     189ns     725ns  cudaSetupArgument
  0.00%  1.7640us         3     588ns     394ns     843ns  cuDeviceGet
  0.00%     231ns         1     231ns     231ns     231ns  cudaCreateChannelDesc
