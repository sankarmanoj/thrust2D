==6723== NVPROF is profiling process 6723, command: ./affine.o
==6723== Profiling application: ./affine.o
==6723== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.06%  92.191us        11  8.3810us     576ns  80.703us  [CUDA memcpy HtoD]
 31.33%  82.399us         1  82.399us  82.399us  82.399us  [CUDA memcpy DtoH]
 29.70%  78.111us         1  78.111us  78.111us  78.111us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
  3.91%  10.272us         3  3.4240us  1.4720us  4.9280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6723== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.66%  904.12ms         7  129.16ms  6.5490us  889.42ms  cudaMalloc
  2.31%  22.086ms        90  245.40us     103ns  9.8533ms  cuDeviceGetAttribute
  2.20%  21.012ms         1  21.012ms  21.012ms  21.012ms  cudaGetDeviceProperties
  0.46%  4.4027ms         3  1.4676ms  25.876us  3.2916ms  cudaFree
  0.13%  1.2890ms         1  1.2890ms  1.2890ms  1.2890ms  cuDeviceTotalMem
  0.07%  652.65us         1  652.65us  652.65us  652.65us  cuDeviceGetName
  0.06%  581.32us         7  83.045us  1.9250us  459.22us  cudaMemcpyAsync
  0.06%  536.81us         1  536.81us  536.81us  536.81us  cudaDeviceSynchronize
  0.03%  269.73us         5  53.946us  7.3410us  203.40us  cudaMemcpy
  0.01%  99.210us         4  24.802us  20.219us  31.121us  cudaLaunch
  0.00%  26.456us        12  2.2040us  1.4500us  5.2530us  cudaFuncGetAttributes
  0.00%  6.1120us         9     679ns     212ns  1.8970us  cudaGetDevice
  0.00%  5.5340us         6     922ns     124ns  3.6750us  cudaSetupArgument
  0.00%  5.4110us         3  1.8030us  1.6090us  2.0100us  cudaEventCreateWithFlags
  0.00%  3.9430us         3  1.3140us  1.1600us  1.4450us  cudaEventDestroy
  0.00%  3.8400us         3  1.2800us  1.1880us  1.3500us  cudaEventRecord
  0.00%  3.6430us        11     331ns     229ns     888ns  cudaDeviceGetAttribute
  0.00%  3.1700us         4     792ns     587ns  1.0020us  cudaConfigureCall
  0.00%  1.7370us         2     868ns     293ns  1.4440us  cuDeviceGetCount
  0.00%     534ns         2     267ns     151ns     383ns  cuDeviceGet
