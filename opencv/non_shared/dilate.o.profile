==3385== NVPROF is profiling process 3385, command: ./dilate.o
==3385== Profiling application: ./dilate.o
==3385== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.68%  308.70us         1  308.70us  308.70us  308.70us  [CUDA memcpy DtoH]
 29.32%  193.88us         5  38.776us     992ns  189.53us  [CUDA memcpy HtoD]
 16.39%  108.35us         1  108.35us  108.35us  108.35us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.81%  45.038us         3  15.012us  13.925us  16.645us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.80%  5.2820us         1  5.2820us  5.2820us  5.2820us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3385== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.10%  315.61ms         8  39.451ms  20.941us  311.96ms  cudaMalloc
  3.09%  10.154ms         4  2.5386ms  510.72us  4.4998ms  cudaFree
  0.34%  1.1029ms         5  220.58us  21.962us  903.92us  cudaMemcpy
  0.14%  473.11us         1  473.11us  473.11us  473.11us  cudaMemcpyAsync
  0.11%  368.67us         5  73.734us  27.096us  124.33us  cudaLaunch
  0.08%  257.37us        90  2.8590us     160ns  99.473us  cuDeviceGetAttribute
  0.05%  175.97us         1  175.97us  175.97us  175.97us  cuDeviceTotalMem
  0.03%  107.73us        20  5.3860us  2.6420us  16.286us  cudaFuncGetAttributes
  0.01%  42.243us         1  42.243us  42.243us  42.243us  cuDeviceGetName
  0.01%  26.362us        15  1.7570us     339ns  8.4340us  cudaGetDevice
  0.01%  24.112us         5  4.8220us  2.4270us  7.7230us  cudaEventCreateWithFlags
  0.01%  16.883us         5  3.3760us  1.3910us  6.3230us  cudaEventRecord
  0.00%  15.502us         5  3.1000us     396ns  11.047us  cudaSetupArgument
  0.00%  11.836us         5  2.3670us  1.3740us  3.6690us  cudaEventDestroy
  0.00%  11.220us         5  2.2440us  1.0370us  3.8880us  cudaConfigureCall
  0.00%  10.690us        11     971ns     305ns  3.9100us  cudaDeviceGetAttribute
  0.00%  5.8610us         2  2.9300us  2.1800us  3.6810us  cuDeviceGetCount
  0.00%     992ns         2     496ns     375ns     617ns  cuDeviceGet
