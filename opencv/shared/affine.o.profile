==5629== NVPROF is profiling process 5629, command: ./affine.o
==5629== Profiling application: ./affine.o
==5629== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.15%  240.93us        11  21.902us     576ns  234.34us  [CUDA memcpy HtoD]
 36.94%  192.83us         1  192.83us  192.83us  192.83us  [CUDA memcpy DtoH]
 14.93%  77.920us         1  77.920us  77.920us  77.920us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
  1.99%  10.368us         3  3.4560us  1.3760us  4.9280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5629== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.92%  778.42ms         7  111.20ms  18.801us  769.58ms  cudaMalloc
  1.40%  11.396ms         1  11.396ms  11.396ms  11.396ms  cuDeviceGetName
  1.28%  10.399ms         1  10.399ms  10.399ms  10.399ms  cudaGetDeviceProperties
  0.73%  5.9377ms         3  1.9792ms  85.573us  5.1602ms  cudaFree
  0.22%  1.7960ms         1  1.7960ms  1.7960ms  1.7960ms  cuDeviceTotalMem
  0.21%  1.7327ms        90  19.252us     132ns  938.05us  cuDeviceGetAttribute
  0.12%  945.31us         5  189.06us  36.851us  729.60us  cudaMemcpy
  0.04%  354.85us         7  50.692us  3.6630us  324.72us  cudaMemcpyAsync
  0.04%  304.65us         4  76.162us  62.158us  86.410us  cudaLaunch
  0.01%  68.121us         1  68.121us  68.121us  68.121us  cudaDeviceSynchronize
  0.01%  55.313us        12  4.6090us  1.4060us  15.536us  cudaFuncGetAttributes
  0.00%  23.951us         9  2.6610us     241ns  8.7960us  cudaGetDevice
  0.00%  14.876us         3  4.9580us  4.6190us  5.1410us  cudaEventCreateWithFlags
  0.00%  12.385us         6  2.0640us     237ns  7.2870us  cudaSetupArgument
  0.00%  12.313us         3  4.1040us  2.9820us  5.1030us  cudaEventRecord
  0.00%  9.2640us         4  2.3160us  1.3080us  3.1690us  cudaConfigureCall
  0.00%  7.8800us        11     716ns     260ns  3.0680us  cudaDeviceGetAttribute
  0.00%  6.4580us         3  2.1520us  1.6270us  2.5820us  cudaEventDestroy
  0.00%  5.5840us         2  2.7920us  1.1160us  4.4680us  cuDeviceGetCount
  0.00%     859ns         2     429ns     303ns     556ns  cuDeviceGet
