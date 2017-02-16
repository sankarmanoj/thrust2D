==3092== NVPROF is profiling process 3092, command: ./shared-descent.o 100 0.5
==3092== Profiling application: ./shared-descent.o 100 0.5
==3092== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 79.94%  154.21ms    100000  1.5420us  1.4720us  3.2960us  void thrust::binary_reduce_kernel<float, thrust::multiplies<float>, unsigned int=32>(float*, float, float, unsigned int, float)
 17.31%  33.398ms    100000     333ns     320ns  1.4400us  [CUDA memcpy DtoH]
  2.60%  5.0245ms       100  50.244us  48.865us  81.313us  void thrust::unary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, dotProductFunctor>(long, floatD, thrust::device_ptr<floatD>, thrust::detail::normal_iterator<thrust::device_ptr<floatD>>)
  0.08%  149.12us       104  1.4330us     896ns  31.745us  [CUDA memcpy HtoD]
  0.06%  113.25us       100  1.1320us  1.0880us  1.5040us  void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::minus<float>>(long, float, thrust::device_ptr<float>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>)
  0.00%  2.4000us         2  1.2000us     992ns  1.4080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3092== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 89.78%  26.2145s    100200  261.62us  138.81us  3.2646ms  cudaGetDeviceProperties
  4.91%  1.43382s    100000  14.338us  9.7040us  14.776ms  cudaMemcpy
  2.12%  620.45ms    100202  6.1910us  4.6790us  265.03us  cudaLaunch
  1.73%  506.06ms    100006  5.0600us  3.5900us  121.88ms  cudaMalloc
  1.15%  336.56ms    100006  3.3650us  3.1470us  120.93us  cudaFree
  0.22%  64.880ms    500902     129ns     106ns  235.77us  cudaSetupArgument
  0.07%  19.936ms    100202     198ns     134ns  234.67us  cudaConfigureCall
  0.00%  489.09us       100  4.8900us  4.0540us  16.670us  cudaMemcpyToSymbol
  0.00%  441.65us        90  4.9070us     258ns  170.51us  cuDeviceGetAttribute
  0.00%  440.42us         1  440.42us  440.42us  440.42us  cuDeviceTotalMem
  0.00%  420.36us       208  2.0200us  1.4060us  3.2300us  cudaFuncGetAttributes
  0.00%  184.08us       811     226ns     196ns     950ns  cudaDeviceGetAttribute
  0.00%  120.91us       200     604ns     434ns  1.2540us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  80.289us       206     389ns     209ns     914ns  cudaGetDevice
  0.00%  61.908us         4  15.477us  2.8520us  47.046us  cudaMemcpyAsync
  0.00%  40.377us         1  40.377us  40.377us  40.377us  cuDeviceGetName
  0.00%  2.6360us         2  1.3180us     387ns  2.2490us  cuDeviceGetCount
  0.00%  1.9510us         2     975ns     669ns  1.2820us  cudaEventCreateWithFlags
  0.00%  1.7230us         2     861ns     568ns  1.1550us  cudaEventRecord
  0.00%  1.2500us         2     625ns     442ns     808ns  cudaEventDestroy
  0.00%     676ns         2     338ns     258ns     418ns  cuDeviceGet
