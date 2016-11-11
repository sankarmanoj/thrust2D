==6834== NVPROF is profiling process 6834, command: ./sift.o
==6834== Profiling application: ./sift.o
==6834== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.82%  307.42ms         1  307.42ms  307.42ms  307.42ms  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, siftTransformFunctor)
  1.00%  3.1534ms         4  788.34us  168.23us  1.4886ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.76%  2.4036ms         3  801.20us  173.54us  1.4807ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.39%  1.2152ms        11  110.47us     544ns  937.63us  [CUDA memcpy HtoD]
  0.03%  88.082us         1  88.082us  88.082us  88.082us  [CUDA memcpy DtoH]

==6834== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 92.12%  3.69730s        16  231.08ms  4.1920us  3.69669s  cudaMalloc
  7.80%  313.00ms         8  39.125ms  170.92us  307.43ms  cudaDeviceSynchronize
  0.03%  1.3098ms         3  436.60us     309ns  1.1986ms  cudaMemcpyAsync
  0.01%  585.67us         8  73.208us  7.2870us  272.73us  cudaLaunch
  0.01%  519.19us        10  51.919us  3.3010us  394.29us  cudaMemcpy
  0.01%  329.53us         7  47.075us  6.3020us  119.31us  cudaFree
  0.01%  215.52us        90  2.3940us      98ns  84.448us  cuDeviceGetAttribute
  0.00%  146.92us         1  146.92us  146.92us  146.92us  cuDeviceTotalMem
  0.00%  143.08us         1  143.08us  143.08us  143.08us  cudaGetDeviceProperties
  0.00%  44.171us        28  1.5770us  1.3250us  3.6160us  cudaFuncGetAttributes
  0.00%  19.918us         1  19.918us  19.918us  19.918us  cuDeviceGetName
  0.00%  8.0350us        21     382ns     200ns  1.4190us  cudaGetDevice
  0.00%  7.1230us         7  1.0170us     729ns  1.5890us  cudaEventCreateWithFlags
  0.00%  5.9790us         7     854ns     599ns  1.4940us  cudaEventRecord
  0.00%  4.8210us         7     688ns     577ns  1.0180us  cudaEventDestroy
  0.00%  4.4290us        11     402ns     121ns  2.5220us  cudaSetupArgument
  0.00%  3.2070us        11     291ns     199ns     942ns  cudaDeviceGetAttribute
  0.00%  3.0750us         8     384ns     211ns     799ns  cudaConfigureCall
  0.00%  1.3040us         2     652ns     222ns  1.0820us  cuDeviceGetCount
  0.00%     554ns         1     554ns     554ns     554ns  cudaGetLastError
  0.00%     271ns         2     135ns     104ns     167ns  cuDeviceGet
