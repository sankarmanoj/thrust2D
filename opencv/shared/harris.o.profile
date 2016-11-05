==6827== NVPROF is profiling process 6827, command: ./harris.o
==6827== Profiling application: ./harris.o
==6827== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.39%  307.63us         1  307.63us  307.63us  307.63us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, HarrisIntensityFunctor)
 21.71%  116.40us        24  4.8490us     576ns  89.138us  [CUDA memcpy HtoD]
 19.04%  102.06us        19  5.3710us     320ns  87.922us  [CUDA memcpy DtoH]
  1.86%  9.9500us         3  3.3160us  1.0880us  4.6070us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6827== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.61%  683.26ms         8  85.408ms  6.5970us  682.69ms  cudaMalloc
  1.93%  13.658ms         1  13.658ms  13.658ms  13.658ms  cudaGetDeviceProperties
  0.87%  6.1676ms        90  68.528us     129ns  5.6606ms  cuDeviceGetAttribute
  0.30%  2.1028ms         3  700.92us  15.419us  2.0400ms  cudaFree
  0.10%  699.99us         6  116.66us  5.2490us  637.64us  cudaMemcpy
  0.09%  662.15us        37  17.895us  3.2520us  344.50us  cudaMemcpyAsync
  0.03%  240.33us         1  240.33us  240.33us  240.33us  cuDeviceTotalMem
  0.03%  211.96us         1  211.96us  211.96us  211.96us  cuDeviceGetName
  0.02%  156.00us         4  39.000us  17.823us  57.246us  cudaLaunch
  0.01%  37.638us        12  3.1360us  1.9610us  7.2240us  cudaFuncGetAttributes
  0.00%  8.4650us         7  1.2090us     155ns  6.3880us  cudaSetupArgument
  0.00%  7.9520us         9     883ns     280ns  3.0290us  cudaGetDevice
  0.00%  7.2210us         3  2.4070us  1.6380us  3.1360us  cudaEventCreateWithFlags
  0.00%  6.6540us         4  1.6630us     750ns  2.4050us  cudaConfigureCall
  0.00%  5.9650us         3  1.9880us  1.3420us  2.3530us  cudaEventRecord
  0.00%  4.4340us        11     403ns     241ns  1.2240us  cudaDeviceGetAttribute
  0.00%  4.3990us         3  1.4660us  1.2300us  1.6700us  cudaEventDestroy
  0.00%  3.8920us         2  1.9460us  1.4160us  2.4760us  cuDeviceGetCount
  0.00%     803ns         2     401ns     329ns     474ns  cuDeviceGet
  0.00%     625ns         1     625ns     625ns     625ns  cudaGetLastError
