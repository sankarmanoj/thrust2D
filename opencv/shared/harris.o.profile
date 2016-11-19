==3772== NVPROF is profiling process 3772, command: ./harris.o
==3772== Profiling application: ./harris.o
==3772== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.12%  109.45us        24  4.5600us  1.1840us  81.539us  [CUDA memcpy HtoD]
 31.50%  98.179us        19  5.1670us     320ns  82.819us  [CUDA memcpy DtoH]
 26.47%  82.499us         1  82.499us  82.499us  82.499us  void thrust::transform_texture_kernel<float, HarrisIntensityFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HarrisIntensityFunctor)
  3.66%  11.392us         3  3.7970us  1.4720us  5.7280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.25%  10.144us         1  10.144us  10.144us  10.144us  [CUDA memcpy DtoD]

==3772== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 87.97%  762.10ms         8  95.262ms  5.2550us  761.32ms  cudaMalloc
  5.03%  43.603ms         3  14.534ms  22.669us  35.747ms  cudaFree
  3.30%  28.594ms         2  14.297ms  272.30us  28.322ms  cudaGetDeviceProperties
  3.12%  26.991ms        90  299.90us     184ns  11.219ms  cuDeviceGetAttribute
  0.22%  1.9204ms         1  1.9204ms  1.9204ms  1.9204ms  cuDeviceTotalMem
  0.17%  1.4600ms         1  1.4600ms  1.4600ms  1.4600ms  cuDeviceGetName
  0.07%  575.34us        37  15.549us  2.0430us  123.56us  cudaMemcpyAsync
  0.06%  476.54us         6  79.424us  4.9060us  292.37us  cudaMemcpy
  0.05%  460.14us         1  460.14us  460.14us  460.14us  cudaMallocPitch
  0.01%  60.995us         4  15.248us  9.5600us  26.897us  cudaLaunch
  0.00%  20.928us        12  1.7440us  1.4200us  3.5060us  cudaFuncGetAttributes
  0.00%  20.805us         1  20.805us  20.805us  20.805us  cudaMemcpy2D
  0.00%  8.6540us         1  8.6540us  8.6540us  8.6540us  cudaCreateTextureObject
  0.00%  4.7420us         9     526ns     219ns  1.6480us  cudaGetDevice
  0.00%  3.4410us         3  1.1470us     880ns  1.5600us  cudaEventCreateWithFlags
  0.00%  3.2130us         3  1.0710us     896ns  1.2640us  cudaEventRecord
  0.00%  3.0900us        11     280ns     203ns     863ns  cudaDeviceGetAttribute
  0.00%  2.5580us         3     852ns     703ns  1.0230us  cudaEventDestroy
  0.00%  2.5520us         4     638ns     402ns     973ns  cudaConfigureCall
  0.00%  2.0850us         2  1.0420us     254ns  1.8310us  cuDeviceGetCount
  0.00%  1.6540us         7     236ns     119ns     447ns  cudaSetupArgument
  0.00%     554ns         2     277ns     200ns     354ns  cuDeviceGet
  0.00%     229ns         1     229ns     229ns     229ns  cudaCreateChannelDesc
