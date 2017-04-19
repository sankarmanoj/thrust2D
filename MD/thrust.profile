==8483== NVPROF is profiling process 8483, command: ./thrust_perfsig.out 1000 10
==8483== Profiling application: ./thrust_perfsig.out 1000 10
==8483== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.68%  178.77ms     44000  4.0620us  3.6800us  12.384us  //Reduce 1 void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=128, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=7>, unsigned long=128>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::reduce_detail::reduce_partitions, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::system::cuda::detail::aligned_decomposition<long>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, float, thrust::plus<float>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=7)
 26.61%  126.23ms     44033  2.8660us  2.6240us  9.9520us  //Reduce 2 void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=128, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=7>, unsigned long=128>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::reduce_detail::reduce_partitions, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=1>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, thrust::detail::normal_iterator<thrust::pointer<float, thrust::system::cuda::detail::tag, thrust::use_default, thrust::use_default>>, thrust::plus<float>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=7)
 20.75%  98.425ms     11000  8.9470us  8.4800us  154.14us  compute_forceonparticle_functor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 10.94%  51.908ms     77033     673ns     480ns  7.7440us  [CUDA memcpy DtoH]
  3.95%  18.728ms     33012     567ns     543ns  7.6480us  [CUDA memcpy HtoD]
  0.04%  176.00us        33  5.3330us  4.4160us  6.4960us  //transform_reduce squareOpNS_6detail15normal_iteratorINS_10device_ptrIfEEEEfNS_11use_defaultEEENS2_21aligned_decompositionIlEENSM_INS_7pointerIfNS2_3tagESQ_SQ_EEEEfNS_4plusIfEENS_9null_typeES10_S10_S10_EEEEEEEEvT0_
  0.02%  77.598us        30  2.5860us  2.4320us  2.9120us  <updateOp>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.01%  65.054us        30  2.1680us  2.0160us  2.4640us  <updateVelOp>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.01%  39.712us        30  1.3230us  1.1840us  1.5680us  <updateAccOp>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8483== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.79%  12.6651s     44049  287.52us  3.7670us  124.58ms  cudaMalloc
 25.27%  5.26427s     44033  119.55us  113.21us  1.0443ms  cudaFree
  4.64%  966.98ms    110045  8.7870us  2.4690us  14.466ms  cudaMemcpyAsync
  4.55%  948.02ms     99172  9.5590us  5.5560us  850.78us  cudaLaunch
  1.71%  357.17ms    220556  1.6190us  1.3460us  222.96us  cudaFuncGetAttributes
  1.27%  265.58ms     44033  6.0310us  1.7840us  998.22us  cudaEventSynchronize
  0.48%  100.63ms    253483     396ns     198ns  253.66us  cudaGetDevice
  0.43%  89.191ms     99172     899ns     596ns  198.92us  cudaEventCreateWithFlags
  0.33%  68.964ms     99172     695ns     478ns  216.54us  cudaEventRecord
  0.28%  58.533ms     99172     590ns     401ns  62.908us  cudaEventDestroy
  0.13%  26.941ms     99172     271ns     143ns  73.015us  cudaConfigureCall
  0.10%  21.111ms     99172     212ns     133ns  216.59us  cudaSetupArgument
  0.00%  340.68us        91  3.7430us     100ns  134.85us  cuDeviceGetAttribute
  0.00%  193.09us         1  193.09us  193.09us  193.09us  cuDeviceTotalMem
  0.00%  32.097us         1  32.097us  32.097us  32.097us  cuDeviceGetName
  0.00%  3.2330us        11     293ns     204ns     770ns  cudaDeviceGetAttribute
  0.00%  1.3760us         3     458ns     100ns  1.0660us  cuDeviceGetCount
  0.00%     618ns         3     206ns     102ns     291ns  cuDeviceGet
