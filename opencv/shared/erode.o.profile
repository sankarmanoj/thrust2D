==10700== NVPROF is profiling process 10700, command: ./erode.o
==10700== Profiling application: ./erode.o
==10700== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.01%  149.76us         1  149.76us  149.76us  149.76us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, erodeFunctor)
 25.72%  81.922us         6  13.653us     576ns  76.898us  [CUDA memcpy HtoD]
 24.23%  77.186us         1  77.186us  77.186us  77.186us  [CUDA memcpy DtoH]
  2.25%  7.1680us         2  3.5840us  3.0080us  4.1600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.79%  2.5280us         1  2.5280us  2.5280us  2.5280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10700== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.03%  559.98ms         8  69.997ms  5.8580us  555.66ms  cudaMalloc
  1.73%  10.110ms        90  112.34us     115ns  8.4885ms  cuDeviceGetAttribute
  0.96%  5.5719ms         1  5.5719ms  5.5719ms  5.5719ms  cudaGetDeviceProperties
  0.57%  3.2951ms         1  3.2951ms  3.2951ms  3.2951ms  cuDeviceGetName
  0.38%  2.2050ms         3  734.98us  30.021us  1.6611ms  cudaFree
  0.21%  1.2139ms         1  1.2139ms  1.2139ms  1.2139ms  cuDeviceTotalMem
  0.09%  528.73us         6  88.120us  5.3190us  377.43us  cudaMemcpy
  0.02%  109.18us         4  27.296us  7.5700us  53.252us  cudaLaunch
  0.01%  78.535us         1  78.535us  78.535us  78.535us  cudaMemcpyAsync
  0.00%  26.366us        12  2.1970us  1.4050us  7.5570us  cudaFuncGetAttributes
  0.00%  6.0720us         7     867ns     154ns  4.1870us  cudaSetupArgument
  0.00%  4.6920us         9     521ns     221ns  1.3920us  cudaGetDevice
  0.00%  3.9590us         3  1.3190us     819ns  1.7700us  cudaEventCreateWithFlags
  0.00%  3.7010us         4     925ns     328ns  1.8960us  cudaConfigureCall
  0.00%  3.2770us        11     297ns     212ns     848ns  cudaDeviceGetAttribute
  0.00%  3.1370us         3  1.0450us     660ns  1.3820us  cudaEventRecord
  0.00%  2.7840us         3     928ns     648ns  1.1030us  cudaEventDestroy
  0.00%  2.3340us         2  1.1670us     654ns  1.6800us  cuDeviceGetCount
  0.00%     844ns         1     844ns     844ns     844ns  cudaGetLastError
  0.00%     513ns         2     256ns     176ns     337ns  cuDeviceGet
