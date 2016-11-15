==7119== NVPROF is profiling process 7119, command: ./blend.o
==7119== Profiling application: ./blend.o
==7119== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.46%  582.34us         1  582.34us  582.34us  582.34us  [CUDA memcpy DtoH]
 41.95%  549.47us         8  68.684us     544ns  278.72us  [CUDA memcpy HtoD]
 12.62%  165.31us         1  165.31us  165.31us  165.31us  void thrust::transform_kernel<float, blendFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, int, int, int, int, int, blendFunctor)
  0.97%  12.672us         3  4.2240us  3.4880us  5.0240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7119== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.15%  865.62ms         9  96.180ms  9.0830us  858.49ms  cudaMalloc
  0.86%  7.6769ms         3  2.5590ms  37.219us  7.3868ms  cudaFree
  0.81%  7.1945ms        90  79.938us     140ns  5.8775ms  cuDeviceGetAttribute
  0.42%  3.7654ms         1  3.7654ms  3.7654ms  3.7654ms  cuDeviceTotalMem
  0.21%  1.8907ms         7  270.10us  8.3300us  1.5520ms  cudaMemcpy
  0.20%  1.7796ms         2  889.82us  712.06us  1.0676ms  cudaMemcpyAsync
  0.18%  1.5648ms         1  1.5648ms  1.5648ms  1.5648ms  cudaGetDeviceProperties
  0.11%  962.01us         1  962.01us  962.01us  962.01us  cuDeviceGetName
  0.05%  402.15us         4  100.54us  73.973us  119.87us  cudaLaunch
  0.01%  62.681us        12  5.2230us  2.0280us  19.728us  cudaFuncGetAttributes
  0.00%  25.477us        12  2.1230us     132ns  19.168us  cudaSetupArgument
  0.00%  23.154us         9  2.5720us     284ns  11.306us  cudaGetDevice
  0.00%  18.532us         3  6.1770us  4.2770us  8.4170us  cudaEventCreateWithFlags
  0.00%  16.523us         3  5.5070us  4.1750us  6.4610us  cudaEventRecord
  0.00%  14.647us         4  3.6610us  2.2930us  5.0830us  cudaConfigureCall
  0.00%  9.6690us         3  3.2230us  2.4690us  4.3630us  cudaEventDestroy
  0.00%  9.5730us        11     870ns     263ns  4.6280us  cudaDeviceGetAttribute
  0.00%  5.1210us         2  2.5600us  1.0190us  4.1020us  cuDeviceGetCount
  0.00%  1.2040us         1  1.2040us  1.2040us  1.2040us  cudaGetLastError
  0.00%     767ns         2     383ns     323ns     444ns  cuDeviceGet
