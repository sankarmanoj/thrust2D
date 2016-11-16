==12802== NVPROF is profiling process 12802, command: ./dilate.o
==12802== Profiling application: ./dilate.o
==12802== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.07%  86.718us         6  14.453us     640ns  81.342us  [CUDA memcpy HtoD]
 38.15%  82.557us         1  82.557us  82.557us  82.557us  [CUDA memcpy DtoH]
 15.79%  34.175us         1  34.175us  34.175us  34.175us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  4.35%  9.4080us         2  4.7040us  4.4480us  4.9600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.64%  3.5520us         1  3.5520us  3.5520us  3.5520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12802== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.38%  637.11ms         8  79.639ms  5.2830us  635.27ms  cudaMalloc
  0.71%  4.6118ms         1  4.6118ms  4.6118ms  4.6118ms  cudaGetDeviceProperties
  0.70%  4.5576ms         3  1.5192ms  23.252us  2.4336ms  cudaFree
  0.06%  411.03us        90  4.5670us     121ns  155.85us  cuDeviceGetAttribute
  0.05%  338.57us         6  56.428us  9.3740us  225.23us  cudaMemcpy
  0.03%  209.47us         1  209.47us  209.47us  209.47us  cuDeviceTotalMem
  0.02%  136.35us         1  136.35us  136.35us  136.35us  cudaMemcpyAsync
  0.01%  87.220us         4  21.805us  19.560us  23.390us  cudaLaunch
  0.01%  56.187us         1  56.187us  56.187us  56.187us  cuDeviceGetName
  0.01%  34.752us        12  2.8960us  1.9430us  5.2470us  cudaFuncGetAttributes
  0.00%  6.5820us         9     731ns     294ns  1.8170us  cudaGetDevice
  0.00%  6.3760us         7     910ns     116ns  4.8110us  cudaSetupArgument
  0.00%  5.6590us        11     514ns     368ns  1.4130us  cudaDeviceGetAttribute
  0.00%  5.5240us         3  1.8410us  1.7210us  2.0770us  cudaEventCreateWithFlags
  0.00%  4.3760us         3  1.4580us  1.2110us  1.9360us  cudaEventRecord
  0.00%  3.9170us         2  1.9580us     400ns  3.5170us  cuDeviceGetCount
  0.00%  3.5810us         3  1.1930us  1.0570us  1.4420us  cudaEventDestroy
  0.00%  3.1730us         4     793ns     476ns  1.1220us  cudaConfigureCall
  0.00%     844ns         2     422ns     181ns     663ns  cuDeviceGet
