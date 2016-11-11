==5389== NVPROF is profiling process 5389, command: ./affine.o
==5389== Profiling application: ./affine.o
==5389== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.42%  580.86us         1  580.86us  580.86us  580.86us  [CUDA memcpy DtoH]
 21.43%  196.23us        11  17.839us     544ns  190.15us  [CUDA memcpy HtoD]
 14.05%  128.72us         1  128.72us  128.72us  128.72us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, AffineTransformFunctor)
  1.10%  10.047us         3  3.3490us  1.5040us  4.4160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5389== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.54%  865.82ms         7  123.69ms  17.562us  864.20ms  cudaMalloc
  1.51%  13.382ms         1  13.382ms  13.382ms  13.382ms  cudaGetDeviceProperties
  0.47%  4.1987ms         3  1.3996ms  16.853us  4.1442ms  cudaFree
  0.30%  2.6275ms         5  525.50us  24.358us  2.4576ms  cudaMemcpy
  0.05%  433.58us        90  4.8170us     140ns  166.57us  cuDeviceGetAttribute
  0.04%  330.20us         7  47.171us  2.2660us  305.85us  cudaMemcpyAsync
  0.02%  216.48us         1  216.48us  216.48us  216.48us  cuDeviceGetName
  0.02%  215.00us         1  215.00us  215.00us  215.00us  cuDeviceTotalMem
  0.02%  177.42us         4  44.355us  19.276us  64.476us  cudaLaunch
  0.02%  135.05us         1  135.05us  135.05us  135.05us  cudaDeviceSynchronize
  0.01%  46.169us        12  3.8470us  1.4280us  10.753us  cudaFuncGetAttributes
  0.00%  11.361us         3  3.7870us  2.1970us  6.7390us  cudaEventCreateWithFlags
  0.00%  10.710us         9  1.1900us     208ns  2.8490us  cudaGetDevice
  0.00%  6.1790us         3  2.0590us  1.5090us  2.8630us  cudaEventRecord
  0.00%  5.2800us         6     880ns     188ns  2.7360us  cudaSetupArgument
  0.00%  4.6740us         3  1.5580us  1.1940us  2.2690us  cudaEventDestroy
  0.00%  4.3840us         4  1.0960us     436ns  1.5420us  cudaConfigureCall
  0.00%  4.0830us         2  2.0410us     919ns  3.1640us  cuDeviceGetCount
  0.00%  3.9490us        11     359ns     203ns  1.3260us  cudaDeviceGetAttribute
  0.00%  1.0380us         2     519ns     169ns     869ns  cuDeviceGet
  0.00%     716ns         1     716ns     716ns     716ns  cudaGetLastError
