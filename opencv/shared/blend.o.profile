==11502== NVPROF is profiling process 11502, command: ./blend.o 1631
==11502== Profiling application: ./blend.o 1631
==11502== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.88%  90.464us         8  11.308us     704ns  45.184us  [CUDA memcpy HtoD]
 28.18%  54.368us         1  54.368us  54.368us  54.368us  void thrust::binary_transform_kernel<unsigned char, blendFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, blendFunctor)
 20.33%  39.232us         1  39.232us  39.232us  39.232us  [CUDA memcpy DtoH]
  4.61%  8.8960us         3  2.9650us  2.2400us  4.4160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==11502== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.24%  162.91ms         9  18.101ms  3.4470us  162.54ms  cudaMalloc
  0.24%  387.64us         2  193.82us  186.81us  200.82us  cudaGetDeviceProperties
  0.13%  215.60us        90  2.3950us      96ns  84.318us  cuDeviceGetAttribute
  0.13%  208.61us         7  29.800us  2.8410us  176.38us  cudaMemcpy
  0.10%  162.31us         1  162.31us  162.31us  162.31us  cuDeviceTotalMem
  0.08%  132.56us         3  44.187us  5.1580us  99.881us  cudaFree
  0.03%  44.412us         2  22.206us  21.310us  23.102us  cudaMemcpyAsync
  0.02%  37.197us         4  9.2990us  5.9000us  14.223us  cudaLaunch
  0.01%  19.990us         1  19.990us  19.990us  19.990us  cuDeviceGetName
  0.01%  19.053us        12  1.5870us  1.3330us  3.3900us  cudaFuncGetAttributes
  0.00%  3.5850us         9     398ns     198ns  1.3710us  cudaGetDevice
  0.00%  3.2690us         3  1.0890us     714ns  1.6120us  cudaEventCreateWithFlags
  0.00%  3.2400us        11     294ns     201ns     784ns  cudaDeviceGetAttribute
  0.00%  2.8840us         3     961ns     592ns  1.5210us  cudaEventRecord
  0.00%  2.3690us         3     789ns     588ns  1.0580us  cudaEventDestroy
  0.00%  1.6920us         4     423ns     224ns     942ns  cudaConfigureCall
  0.00%  1.5900us         8     198ns     107ns     475ns  cudaSetupArgument
  0.00%  1.1400us         2     570ns     166ns     974ns  cuDeviceGetCount
  0.00%     289ns         2     144ns     107ns     182ns  cuDeviceGet
