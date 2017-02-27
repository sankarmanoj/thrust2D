==6496== NVPROF is profiling process 6496, command: ./shared-descent.o 100 0.01
==6496== Profiling application: ./shared-descent.o 100 0.01
==6496== Warning: Found 410379 invalid records in the result.
==6496== Warning: This can happen if device ran out of memory or if a device kernel was stopped due to an assertion.
==6496== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 85.37%  2.67933s   1000000  2.6790us  2.2400us  8.1280us  void thrust::binary_reduce_kernel<float, thrust::multiplies<float>, unsigned int=256>(float*, float, float, unsigned int, float)
  8.51%  267.15ms       100  2.6715ms  2.5346ms  4.3585ms  void thrust::unary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<floatD>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, dotProductFunctor>(long, floatD, thrust::device_ptr<floatD>, thrust::detail::normal_iterator<thrust::device_ptr<floatD>>)
  5.78%  181.48ms    589762     307ns     256ns  15.712us  [CUDA memcpy DtoH]
  0.25%  7.9725ms        62  128.59us  1.3760us  7.7220ms  [CUDA memcpy HtoD]
  0.04%  1.2449ms       100  12.449us  11.488us  13.536us  _ZN6thrust6system4cuda6detail5bulk_6detail15launch_by_valueILj128ENS4_9cuda_taskINS3_14parallel_groupINS3_16concurrent_groupINS3_5agentILm7EEELm128EEELm0EEENS4_7closureINS2_13reduce_detail17reduce_partitionsENS_5tupleINS4_6cursorILj1EEENS_18transform_iteratorI8squareOpNS_6detail15normal_iteratorINS_10device_ptrIfEEEEiNS_11use_defaultEEENS2_21aligned_decompositionIlEENSM_INS_7pointerIiNS_4cuda13shared_policyESQ_SQ_EEEEiNS_4plusIfEENS_9null_typeES11_S11_S11_EEEEEEEEvT0_
  0.03%  1.0919ms       100  10.919us  10.496us  11.840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=128, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=7>, unsigned long=128>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::reduce_detail::reduce_partitions, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::pointer<int, thrust::cuda::shared_policy, thrust::use_default, thrust::use_default>>, thrust::detail::normal_iterator<thrust::pointer<int, thrust::cuda::shared_policy, thrust::use_default, thrust::use_default>>, thrust::detail::normal_iterator<thrust::pointer<int, thrust::cuda::shared_policy, thrust::use_default, thrust::use_default>>, thrust::plus<float>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=7)
  0.01%  344.03us       100  3.4400us  3.2320us  3.7760us  void thrust::binary_transform_kernel<thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::minus<float>>(long, float, thrust::device_ptr<float>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>)
  0.00%  3.7120us         2  1.8560us  1.0240us  2.6880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6496== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 68.12%  11.5257s   1000000  11.525us  8.0580us  17.443ms  cudaMemcpy
 24.34%  4.11862s   1000402  4.1160us  3.4910us  5.0672ms  cudaLaunch
  3.88%  655.83ms   5001102     131ns     100ns  10.057ms  cudaSetupArgument
  1.55%  262.20ms       100  2.6220ms  12.864us  4.3340ms  cudaEventSynchronize
  1.19%  201.23ms   1000402     201ns     136ns  345.73us  cudaConfigureCall
  0.81%  136.91ms       106  1.2916ms  4.8610us  133.90ms  cudaMalloc
  0.08%  13.348ms       103  129.59us  8.4910us  7.8100ms  cudaMemcpyAsync
  0.01%  1.2772ms       608  2.1000us  1.3360us  11.980us  cudaFuncGetAttributes
  0.01%  1.1425ms       105  10.881us  3.6940us  114.46us  cudaFree
  0.01%  913.63us       100  9.1360us  7.5130us  20.940us  cudaMemcpyToSymbol
  0.00%  693.31us       202  3.4320us     366ns  58.976us  cudaEventDestroy
  0.00%  498.18us         3  166.06us  160.90us  173.84us  cudaGetDeviceProperties
  0.00%  308.89us       706     437ns     201ns  2.2610us  cudaGetDevice
  0.00%  282.65us       811     348ns     197ns  1.1720us  cudaDeviceGetAttribute
  0.00%  270.54us       202  1.3390us     557ns  4.9150us  cudaEventCreateWithFlags
  0.00%  268.60us        91  2.9510us      98ns  118.59us  cuDeviceGetAttribute
  0.00%  218.10us       202  1.0790us     515ns  2.2530us  cudaEventRecord
  0.00%  167.88us         1  167.88us  167.88us  167.88us  cuDeviceTotalMem
  0.00%  157.30us       200     786ns     468ns  1.6600us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  33.084us       100     330ns     244ns     637ns  cudaGetSymbolAddress
  0.00%  25.764us         1  25.764us  25.764us  25.764us  cuDeviceGetName
  0.00%  1.8690us         3     623ns     108ns  1.1290us  cuDeviceGetCount
  0.00%     756ns         3     252ns     185ns     372ns  cuDeviceGet
