==25489== NVPROF is profiling process 25489, command: ./affine.o
==25489== Profiling application: ./affine.o
==25489== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 65.04%  562.99us         1  562.99us  562.99us  562.99us  [CUDA memcpy DtoH]
 24.81%  214.75us        11  19.522us     576ns  207.89us  [CUDA memcpy HtoD]
  9.07%  78.500us         1  78.500us  78.500us  78.500us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
  1.08%  9.3530us         3  3.1170us  1.3780us  4.0360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25489== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.68%  690.95ms         7  98.707ms  8.4440us  689.03ms  cudaMalloc
  0.62%  4.4181ms         1  4.4181ms  4.4181ms  4.4181ms  cuDeviceTotalMem
  0.53%  3.7662ms        90  41.846us     132ns  2.0619ms  cuDeviceGetAttribute
  0.53%  3.7473ms         3  1.2491ms  56.854us  3.5221ms  cudaFree
  0.23%  1.6382ms         5  327.65us  25.232us  1.5094ms  cudaMemcpy
  0.19%  1.3332ms         1  1.3332ms  1.3332ms  1.3332ms  cudaGetDeviceProperties
  0.14%  1.0071ms         7  143.88us  3.4250us  980.09us  cudaMemcpyAsync
  0.03%  195.32us         4  48.828us  31.536us  61.600us  cudaLaunch
  0.01%  100.94us         1  100.94us  100.94us  100.94us  cudaDeviceSynchronize
  0.01%  59.242us         1  59.242us  59.242us  59.242us  cuDeviceGetName
  0.01%  47.192us        12  3.9320us  2.1220us  9.9450us  cudaFuncGetAttributes
  0.00%  12.901us         9  1.4330us     328ns  4.4800us  cudaGetDevice
  0.00%  11.237us         3  3.7450us  3.4260us  4.0100us  cudaEventCreateWithFlags
  0.00%  10.984us         3  3.6610us  3.1440us  4.4940us  cudaEventRecord
  0.00%  9.3760us         6  1.5620us     353ns  6.2020us  cudaSetupArgument
  0.00%  6.1680us        11     560ns     322ns  1.9190us  cudaDeviceGetAttribute
  0.00%  5.9920us         4  1.4980us  1.1600us  1.6820us  cudaConfigureCall
  0.00%  5.9860us         3  1.9950us  1.8090us  2.2210us  cudaEventDestroy
  0.00%  4.0480us         2  2.0240us  1.1500us  2.8980us  cuDeviceGetCount
  0.00%     823ns         2     411ns     379ns     444ns  cuDeviceGet
