==13673== NVPROF is profiling process 13673, command: ./sobel_filter.o
==13673== Profiling application: ./sobel_filter.o
==13673== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.48%  89.985us         5  17.997us     544ns  81.761us  [CUDA memcpy HtoD]
 28.28%  53.600us         2  26.800us  26.368us  27.232us  [CUDA memcpy DtoH]
 11.50%  21.793us         2  10.896us  10.849us  10.944us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
  9.91%  18.784us         2  9.3920us  9.3440us  9.4400us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  2.82%  5.3440us         4  1.3360us  1.1200us  1.6960us  [CUDA memcpy DtoD]

==13673== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.91%  38.9768s         5  7.79535s  3.3570us  38.9759s  cudaMallocPitch
  0.04%  17.098ms        90  189.98us     129ns  11.295ms  cuDeviceGetAttribute
  0.02%  9.6206ms         5  1.9241ms  5.7050us  4.9899ms  cudaMalloc
  0.01%  3.4238ms         1  3.4238ms  3.4238ms  3.4238ms  cudaGetDeviceProperties
  0.01%  3.0743ms         1  3.0743ms  3.0743ms  3.0743ms  cuDeviceTotalMem
  0.00%  1.4296ms         9  158.84us  3.5940us  566.28us  cudaFree
  0.00%  1.3507ms         1  1.3507ms  1.3507ms  1.3507ms  cuDeviceGetName
  0.00%  569.15us         7  81.307us  6.8310us  203.73us  cudaMemcpy2D
  0.00%  211.56us         4  52.890us  39.204us  71.764us  cudaDeviceSynchronize
  0.00%  70.861us         4  17.715us  7.7050us  32.422us  cudaMemcpyToSymbol
  0.00%  43.704us         4  10.926us  5.5400us  18.029us  cudaLaunch
  0.00%  4.2410us         2  2.1200us  2.0240us  2.2170us  cuDeviceGetCount
  0.00%  3.3730us         5     674ns     248ns  1.3280us  cudaGetDevice
  0.00%  2.2470us        16     140ns     109ns     278ns  cudaSetupArgument
  0.00%  1.5490us         4     387ns     210ns     710ns  cudaConfigureCall
  0.00%     876ns         4     219ns     190ns     263ns  cudaGetLastError
  0.00%     840ns         2     420ns     397ns     443ns  cuDeviceGet
  0.00%     471ns         4     117ns      90ns     179ns  cudaGetDeviceCount
