==17436== NVPROF is profiling process 17436, command: ./dilate.o 1631
==17436== Profiling application: ./dilate.o 1631
==17436== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.24%  940.22us         1  940.22us  940.22us  940.22us  [CUDA memcpy DtoH]
 22.26%  433.92us         1  433.92us  433.92us  433.92us  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
 20.77%  404.90us         6  67.482us     704ns  400.74us  [CUDA memcpy HtoD]
  8.73%  170.14us         3  56.714us  51.584us  60.800us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==17436== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.04%  157.67ms         8  19.709ms  4.0070us  156.71ms  cudaMalloc
  1.04%  1.6735ms         6  278.92us  3.0840us  1.5407ms  cudaMemcpy
  0.24%  383.57us         2  191.79us  186.60us  196.97us  cudaGetDeviceProperties
  0.19%  303.88us         3  101.29us  71.856us  157.01us  cudaFree
  0.18%  288.50us         1  288.50us  288.50us  288.50us  cudaMemcpyAsync
  0.15%  240.66us        90  2.6740us      95ns  108.84us  cuDeviceGetAttribute
  0.10%  159.74us         1  159.74us  159.74us  159.74us  cuDeviceTotalMem
  0.03%  43.931us         4  10.982us  9.3230us  13.585us  cudaLaunch
  0.01%  19.842us        12  1.6530us  1.3330us  3.3530us  cudaFuncGetAttributes
  0.01%  19.523us         1  19.523us  19.523us  19.523us  cuDeviceGetName
  0.00%  4.2130us         9     468ns     199ns  1.4000us  cudaGetDevice
  0.00%  3.6130us         3  1.2040us  1.0030us  1.5530us  cudaEventCreateWithFlags
  0.00%  3.5060us        11     318ns     201ns     810ns  cudaDeviceGetAttribute
  0.00%  3.1290us         3  1.0430us     824ns  1.4680us  cudaEventRecord
  0.00%  2.4250us         3     808ns     668ns  1.0450us  cudaEventDestroy
  0.00%  2.0530us         4     513ns     307ns  1.0110us  cudaConfigureCall
  0.00%  1.5510us         7     221ns     111ns     517ns  cudaSetupArgument
  0.00%  1.0750us         2     537ns     139ns     936ns  cuDeviceGetCount
  0.00%     400ns         2     200ns     120ns     280ns  cuDeviceGet
