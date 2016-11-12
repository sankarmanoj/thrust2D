==29146== NVPROF is profiling process 29146, command: ./affine.o
==29146== Profiling application: ./affine.o
==29146== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.63%  125.63us         1  125.63us  125.63us  125.63us  [CUDA memcpy DtoH]
 32.38%  105.28us         1  105.28us  105.28us  105.28us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, AffineTransformFunctor)
 25.94%  84.353us        11  7.6680us     576ns  72.865us  [CUDA memcpy HtoD]
  3.05%  9.9200us         3  3.3060us  1.2160us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29146== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.66%  536.54ms         7  76.648ms  7.3030us  534.91ms  cudaMalloc
  1.50%  8.2425ms         1  8.2425ms  8.2425ms  8.2425ms  cudaGetDeviceProperties
  0.43%  2.3649ms         3  788.31us  9.2470us  2.3204ms  cudaFree
  0.12%  673.62us         7  96.232us  2.7490us  654.34us  cudaMemcpyAsync
  0.09%  511.67us         5  102.33us  10.163us  418.58us  cudaMemcpy
  0.07%  395.87us        90  4.3980us     113ns  159.48us  cuDeviceGetAttribute
  0.04%  229.15us         1  229.15us  229.15us  229.15us  cuDeviceTotalMem
  0.02%  129.37us         4  32.341us  28.039us  41.252us  cudaLaunch
  0.02%  110.14us         1  110.14us  110.14us  110.14us  cudaDeviceSynchronize
  0.02%  90.302us         1  90.302us  90.302us  90.302us  cuDeviceGetName
  0.01%  35.576us        12  2.9640us  1.8640us  6.1770us  cudaFuncGetAttributes
  0.00%  8.8950us         6  1.4820us     223ns  7.0150us  cudaSetupArgument
  0.00%  7.8220us         9     869ns     300ns  2.9050us  cudaGetDevice
  0.00%  6.5300us         3  2.1760us  1.9030us  2.3140us  cudaEventCreateWithFlags
  0.00%  5.3200us         3  1.7730us  1.5870us  1.9980us  cudaEventRecord
  0.00%  4.9110us         2  2.4550us  1.7290us  3.1820us  cuDeviceGetCount
  0.00%  4.3580us         3  1.4520us  1.1640us  1.8850us  cudaEventDestroy
  0.00%  4.3320us        11     393ns     228ns  1.3850us  cudaDeviceGetAttribute
  0.00%  4.1540us         4  1.0380us     912ns  1.3350us  cudaConfigureCall
  0.00%     838ns         2     419ns     346ns     492ns  cuDeviceGet
  0.00%     623ns         1     623ns     623ns     623ns  cudaGetLastError
