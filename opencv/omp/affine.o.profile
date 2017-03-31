==10161== NVPROF is profiling process 10161, command: ./affine.o
==10161== Profiling application: ./affine.o
==10161== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.85%  200.65us         1  200.65us  200.65us  200.65us  [CUDA memcpy DtoH]
 30.22%  112.58us         5  22.516us  2.3040us  84.643us  [CUDA memcpy HtoD]
 10.90%  40.610us         1  40.610us  40.610us  40.610us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.03%  18.753us         2  9.3760us  6.8800us  11.873us  [CUDA memset]

==10161== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.70%  309.82ms         3  103.27ms  11.516us  309.77ms  cudaMallocPitch
  1.26%  4.0045ms        90  44.494us     158ns  3.5674ms  cuDeviceGetAttribute
  0.39%  1.2326ms         1  1.2326ms  1.2326ms  1.2326ms  cuDeviceGetName
  0.21%  651.57us         3  217.19us  48.748us  436.49us  cudaMemcpy2D
  0.17%  553.64us         3  184.55us  7.1270us  534.61us  cudaMalloc
  0.15%  483.77us         1  483.77us  483.77us  483.77us  cuDeviceTotalMem
  0.03%  108.67us         3  36.222us  24.581us  55.928us  cudaMemcpy
  0.03%  105.43us         2  52.715us  29.504us  75.926us  cudaMemset2D
  0.02%  78.346us         1  78.346us  78.346us  78.346us  cudaLaunch
  0.01%  18.002us         4  4.5000us  2.4820us  9.8870us  cudaFuncGetAttributes
  0.01%  16.168us         1  16.168us  16.168us  16.168us  cudaDeviceSynchronize
  0.00%  7.1370us        11     648ns     268ns  2.3890us  cudaDeviceGetAttribute
  0.00%  6.9940us         1  6.9940us  6.9940us  6.9940us  cudaEventRecord
  0.00%  6.7120us         1  6.7120us  6.7120us  6.7120us  cudaEventCreateWithFlags
  0.00%  5.3330us         2  2.6660us  1.9750us  3.3580us  cuDeviceGetCount
  0.00%  5.1890us         1  5.1890us  5.1890us  5.1890us  cudaSetupArgument
  0.00%  4.6450us         3  1.5480us     561ns  3.2960us  cudaGetDevice
  0.00%  3.9130us         1  3.9130us  3.9130us  3.9130us  cudaConfigureCall
  0.00%  3.1640us         1  3.1640us  3.1640us  3.1640us  cudaEventDestroy
  0.00%  1.3700us         2     685ns     669ns     701ns  cuDeviceGet
