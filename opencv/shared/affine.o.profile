==12256== NVPROF is profiling process 12256, command: ./affine.o
==12256== Profiling application: ./affine.o
==12256== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 82.69%  23.685ms         1  23.685ms  23.685ms  23.685ms  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
 16.19%  4.6375ms         3  1.5458ms  265.79us  2.3189ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.57%  164.41us        11  14.946us     704ns  156.67us  [CUDA memcpy HtoD]
  0.55%  157.82us         1  157.82us  157.82us  157.82us  [CUDA memcpy DtoH]

==12256== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.34%  4.78614s         7  683.73ms  11.000us  4.78501s  cudaMalloc
  0.60%  28.698ms         4  7.1745ms  382.56us  23.772ms  cudaDeviceSynchronize
  0.02%  903.48us         4  225.87us  17.221us  830.83us  cudaLaunch
  0.01%  658.09us         5  131.62us  7.8570us  601.25us  cudaMemcpy
  0.01%  436.92us         2  218.46us  193.03us  243.89us  cudaGetDeviceProperties
  0.01%  255.59us         3  85.197us  32.325us  143.06us  cudaFree
  0.01%  248.98us        91  2.7350us     128ns  94.555us  cuDeviceGetAttribute
  0.00%  180.20us         1  180.20us  180.20us  180.20us  cuDeviceTotalMem
  0.00%  164.14us         7  23.449us  3.2730us  140.30us  cudaMemcpyAsync
  0.00%  44.330us        12  3.6940us  2.8330us  6.6650us  cudaFuncGetAttributes
  0.00%  40.007us         1  40.007us  40.007us  40.007us  cuDeviceGetName
  0.00%  9.7060us         3  3.2350us  2.6700us  3.9330us  cudaEventCreateWithFlags
  0.00%  9.4720us         9  1.0520us     432ns  2.2800us  cudaGetDevice
  0.00%  6.5140us         3  2.1710us  1.6320us  2.8750us  cudaEventRecord
  0.00%  5.9630us        11     542ns     370ns  1.2680us  cudaDeviceGetAttribute
  0.00%  5.6560us         3  1.8850us     252ns  4.4970us  cuDeviceGetCount
  0.00%  4.6720us         3  1.5570us  1.4430us  1.6210us  cudaEventDestroy
  0.00%  3.9410us         4     985ns     537ns  1.5150us  cudaConfigureCall
  0.00%  2.8150us         6     469ns     223ns     733ns  cudaSetupArgument
  0.00%  1.6230us         3     541ns     297ns     800ns  cuDeviceGet
