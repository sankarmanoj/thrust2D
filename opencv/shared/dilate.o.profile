==9702== NVPROF is profiling process 9702, command: ./dilate.o 1631
==9702== Profiling application: ./dilate.o 1631
==9702== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.71%  1.3451ms         1  1.3451ms  1.3451ms  1.3451ms  [CUDA memcpy DtoH]
 33.27%  979.07us         6  163.18us     704ns  974.91us  [CUDA memcpy HtoD]
 14.66%  431.52us         1  431.52us  431.52us  431.52us  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  6.36%  187.17us         3  62.389us  58.720us  64.896us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9702== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.93%  520.54ms         8  65.067ms  24.055us  518.09ms  cudaMalloc
  0.84%  4.4818ms         6  746.97us  16.547us  2.3040ms  cudaMemcpy
  0.72%  3.8175ms         3  1.2725ms  81.626us  3.5712ms  cudaFree
  0.25%  1.3373ms         1  1.3373ms  1.3373ms  1.3373ms  cudaMemcpyAsync
  0.10%  543.05us         2  271.52us  219.08us  323.97us  cudaGetDeviceProperties
  0.05%  258.99us        90  2.8770us     133ns  98.776us  cuDeviceGetAttribute
  0.05%  257.44us         4  64.359us  47.558us  74.039us  cudaLaunch
  0.03%  158.93us         1  158.93us  158.93us  158.93us  cuDeviceTotalMem
  0.01%  52.976us        12  4.4140us  2.4460us  9.8870us  cudaFuncGetAttributes
  0.01%  30.101us         1  30.101us  30.101us  30.101us  cuDeviceGetName
  0.00%  13.953us         9  1.5500us     421ns  3.8670us  cudaGetDevice
  0.00%  11.295us         3  3.7650us  3.3370us  4.2830us  cudaEventCreateWithFlags
  0.00%  9.3180us         4  2.3290us  1.5940us  3.3200us  cudaConfigureCall
  0.00%  8.4170us         3  2.8050us  2.5070us  3.3110us  cudaEventRecord
  0.00%  6.9320us        11     630ns     349ns  1.8560us  cudaDeviceGetAttribute
  0.00%  6.0040us         3  2.0010us  1.8760us  2.1350us  cudaEventDestroy
  0.00%  4.5140us         7     644ns     176ns  1.1590us  cudaSetupArgument
  0.00%  2.6360us         2  1.3180us     579ns  2.0570us  cuDeviceGetCount
  0.00%     501ns         2     250ns     155ns     346ns  cuDeviceGet
