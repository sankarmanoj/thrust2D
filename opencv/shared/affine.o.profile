==3660== NVPROF is profiling process 3660, command: ./affine.o
==3660== Profiling application: ./affine.o
==3660== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.48%  94.931us        11  8.6300us  1.1840us  82.801us  [CUDA memcpy HtoD]
 30.84%  82.512us         1  82.512us  82.512us  82.512us  [CUDA memcpy DtoH]
 29.36%  78.543us         1  78.543us  78.543us  78.543us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
  4.32%  11.555us         3  3.8510us  1.4720us  5.6980us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3660== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.88%  1.23726s         7  176.75ms  6.1690us  1.22033s  cudaMalloc
  1.36%  17.359ms         2  8.6793ms  473.85us  16.885ms  cudaGetDeviceProperties
  1.01%  12.918ms        90  143.53us     123ns  7.9366ms  cuDeviceGetAttribute
  0.66%  8.4586ms         3  2.8195ms  47.573us  6.1201ms  cudaFree
  0.03%  334.21us         1  334.21us  334.21us  334.21us  cuDeviceTotalMem
  0.02%  262.60us         5  52.519us  14.286us  191.85us  cudaMemcpy
  0.01%  130.52us         1  130.52us  130.52us  130.52us  cuDeviceGetName
  0.01%  106.28us         4  26.571us  22.530us  31.224us  cudaLaunch
  0.01%  103.05us         7  14.722us  2.0520us  85.100us  cudaMemcpyAsync
  0.01%  97.810us         1  97.810us  97.810us  97.810us  cudaDeviceSynchronize
  0.00%  25.564us        12  2.1300us  1.4020us  4.3750us  cudaFuncGetAttributes
  0.00%  6.9170us         9     768ns     221ns  2.1470us  cudaGetDevice
  0.00%  5.2510us         3  1.7500us  1.6270us  1.8530us  cudaEventCreateWithFlags
  0.00%  4.7850us         2  2.3920us     764ns  4.0210us  cuDeviceGetCount
  0.00%  4.0790us         3  1.3590us  1.2120us  1.4590us  cudaEventDestroy
  0.00%  3.9980us         4     999ns     928ns  1.1200us  cudaConfigureCall
  0.00%  3.8130us         3  1.2710us  1.2510us  1.2820us  cudaEventRecord
  0.00%  3.2320us        11     293ns     210ns     882ns  cudaDeviceGetAttribute
  0.00%  2.0840us         6     347ns     120ns     558ns  cudaSetupArgument
  0.00%     913ns         2     456ns     298ns     615ns  cuDeviceGet
