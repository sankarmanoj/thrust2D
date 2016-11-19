==16712== NVPROF is profiling process 16712, command: ./affine.o
==16712== Profiling application: ./affine.o
==16712== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.52%  372.61us         1  372.61us  372.61us  372.61us  [CUDA memcpy DtoH]
 42.42%  332.65us        11  30.240us     512ns  326.15us  [CUDA memcpy HtoD]
  8.94%  70.075us         1  70.075us  70.075us  70.075us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
  1.13%  8.8320us         3  2.9440us  1.2160us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16712== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.73%  887.82ms         7  126.83ms  9.2420us  879.17ms  cudaMalloc
  1.60%  14.798ms        91  162.61us     135ns  6.7253ms  cuDeviceGetAttribute
  1.54%  14.304ms         1  14.304ms  14.304ms  14.304ms  cudaGetDeviceProperties
  0.57%  5.3151ms         3  1.7717ms  66.768us  4.5643ms  cudaFree
  0.15%  1.4098ms         5  281.97us  25.783us  1.2494ms  cudaMemcpy
  0.14%  1.2693ms         7  181.33us  2.8690us  1.2414ms  cudaMemcpyAsync
  0.12%  1.1465ms         1  1.1465ms  1.1465ms  1.1465ms  cuDeviceTotalMem
  0.07%  608.08us         4  152.02us  62.431us  381.71us  cudaLaunch
  0.05%  505.28us         1  505.28us  505.28us  505.28us  cuDeviceGetName
  0.01%  61.451us        12  5.1200us  2.0460us  18.701us  cudaFuncGetAttributes
  0.01%  60.182us         1  60.182us  60.182us  60.182us  cudaDeviceSynchronize
  0.00%  20.757us         9  2.3060us     358ns  10.502us  cudaGetDevice
  0.00%  17.740us         3  5.9130us  3.1680us  9.8180us  cudaEventCreateWithFlags
  0.00%  17.650us         3  5.8830us  3.0370us  10.485us  cudaEventRecord
  0.00%  12.803us         6  2.1330us     115ns  9.7000us  cudaSetupArgument
  0.00%  11.495us         4  2.8730us  2.1680us  3.6540us  cudaConfigureCall
  0.00%  11.080us        11  1.0070us     266ns  5.9620us  cudaDeviceGetAttribute
  0.00%  8.9120us         3  2.9700us  2.0700us  4.1900us  cudaEventDestroy
  0.00%  5.9150us         3  1.9710us     234ns  4.8070us  cuDeviceGetCount
  0.00%  2.5640us         3     854ns     217ns  1.1930us  cuDeviceGet
