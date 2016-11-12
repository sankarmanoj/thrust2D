==30034== NVPROF is profiling process 30034, command: ./lbp.o
==30034== Profiling application: ./lbp.o
==30034== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.68%  111.94us         1  111.94us  111.94us  111.94us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 32.63%  102.37us         1  102.37us  102.37us  102.37us  [CUDA memcpy DtoH]
 26.29%  82.465us         5  16.493us     608ns  78.849us  [CUDA memcpy HtoD]
  3.78%  11.872us         3  3.9570us  3.6800us  4.2560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.61%  5.0560us         1  5.0560us  5.0560us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30034== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.92%  613.69ms         8  76.712ms  6.7670us  597.35ms  cudaMalloc
  2.74%  17.330ms         4  4.3325ms  25.505us  12.382ms  cudaFree
  0.16%  1.0303ms         5  206.07us  20.758us  507.92us  cudaMemcpy
  0.07%  453.56us        90  5.0390us     128ns  179.85us  cuDeviceGetAttribute
  0.04%  222.60us         1  222.60us  222.60us  222.60us  cuDeviceTotalMem
  0.03%  163.51us         5  32.701us  10.275us  58.844us  cudaLaunch
  0.02%  124.19us         1  124.19us  124.19us  124.19us  cudaMemcpyAsync
  0.01%  57.139us        20  2.8560us  1.8030us  7.7300us  cudaFuncGetAttributes
  0.01%  44.052us         1  44.052us  44.052us  44.052us  cuDeviceGetName
  0.00%  13.460us         5  2.6920us  1.4640us  4.4070us  cudaEventCreateWithFlags
  0.00%  13.022us        15     868ns     256ns  3.3780us  cudaGetDevice
  0.00%  10.585us         5  2.1170us  1.6840us  2.7690us  cudaEventRecord
  0.00%  9.0550us         5  1.8110us     341ns  6.0920us  cudaSetupArgument
  0.00%  7.2820us         5  1.4560us     799ns  1.9440us  cudaEventDestroy
  0.00%  5.5740us        11     506ns     290ns  1.6480us  cudaDeviceGetAttribute
  0.00%  5.0440us         5  1.0080us     395ns  1.3850us  cudaConfigureCall
  0.00%  2.6470us         2  1.3230us     528ns  2.1190us  cuDeviceGetCount
  0.00%  1.8240us         1  1.8240us  1.8240us  1.8240us  cudaGetLastError
  0.00%     675ns         2     337ns     250ns     425ns  cuDeviceGet
