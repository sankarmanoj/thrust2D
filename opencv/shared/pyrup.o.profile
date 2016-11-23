==12467== NVPROF is profiling process 12467, command: ./pyrup.o
==12467== Profiling application: ./pyrup.o
==12467== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 76.68%  32.426ms         1  32.426ms  32.426ms  32.426ms  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 14.61%  6.1765ms         3  2.0588ms  228.89us  3.3191ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.98%  2.1068ms         1  2.1068ms  2.1068ms  2.1068ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.32%  1.4029ms        19  73.839us     288ns  1.3923ms  [CUDA memcpy DtoH]
  0.41%  173.91us        24  7.2460us     672ns  157.95us  [CUDA memcpy HtoD]

==12467== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.85%  3.97411s         9  441.57ms  5.6130us  3.97329s  cudaMalloc
  0.85%  34.172ms         6  5.6954ms  5.4620us  34.130ms  cudaMemcpy
  0.21%  8.4730ms         4  2.1182ms  320.35us  3.3234ms  cudaDeviceSynchronize
  0.04%  1.5222ms        91  16.727us     146ns  728.17us  cuDeviceGetAttribute
  0.02%  721.44us         5  144.29us  9.4370us  657.83us  cudaLaunch
  0.01%  396.84us         2  198.42us  188.90us  207.94us  cudaGetDeviceProperties
  0.01%  333.33us        36  9.2590us  1.8620us  147.38us  cudaMemcpyAsync
  0.00%  184.33us         1  184.33us  184.33us  184.33us  cuDeviceTotalMem
  0.00%  149.60us         4  37.399us  5.8780us  102.38us  cudaFree
  0.00%  74.177us         1  74.177us  74.177us  74.177us  cudaMemcpy2D
  0.00%  28.415us        16  1.7750us  1.3490us  3.9820us  cudaFuncGetAttributes
  0.00%  27.637us         1  27.637us  27.637us  27.637us  cuDeviceGetName
  0.00%  11.891us         1  11.891us  11.891us  11.891us  cudaCreateTextureObject
  0.00%  6.3800us         4  1.5950us  1.0870us  1.9890us  cudaEventCreateWithFlags
  0.00%  6.2300us         1  6.2300us  6.2300us  6.2300us  cudaMallocPitch
  0.00%  5.9520us        12     496ns     196ns  1.5610us  cudaGetDevice
  0.00%  4.8470us         4  1.2110us     815ns  1.6200us  cudaEventRecord
  0.00%  3.5150us        11     319ns     200ns     790ns  cudaDeviceGetAttribute
  0.00%  3.4320us         4     858ns     713ns  1.0630us  cudaEventDestroy
  0.00%  2.6650us         3     888ns     233ns  2.1940us  cuDeviceGetCount
  0.00%  2.5250us         5     505ns     253ns     853ns  cudaConfigureCall
  0.00%  1.8550us         7     265ns     110ns     522ns  cudaSetupArgument
  0.00%  1.3380us         3     446ns     220ns     619ns  cuDeviceGet
  0.00%     134ns         1     134ns     134ns     134ns  cudaCreateChannelDesc
