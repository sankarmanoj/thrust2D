/*
 * Copyright 1993-2015 NVIDIA Corporation.  All rights reserved.
 *
 * Please refer to the NVIDIA end user license agreement (EULA) associated
 * with this source code for terms and conditions that govern your use of
 * this software. Any use, reproduction, disclosure, or distribution of
 * this software and related documentation outside the terms of the EULA
 * is strictly prohibited.
 *
 */

/*
* This sample implements a separable convolution filter
* of a 2D image with an arbitrary kernel.
*/

// CUDA runtime
#include <cuda_runtime.h>
#include <thrust/block_2d.h>
#include <thrust/window_transform.h>
// Utilities and system includes
#include <helper_functions.h>
#include <helper_cuda.h>

#include "convolutionSeparable_common.h"
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
////////////////////////////////////////////////////////////////////////////////
// Reference CPU convolution
////////////////////////////////////////////////////////////////////////////////
extern "C" void convolutionRowCPU(
    float *h_Result,
    float *h_Data,
    float *h_Kernel,
    int imageW,
    int imageH,
    int kernelR
);

extern "C" void convolutionColumnCPU(
    float *h_Result,
    float *h_Data,
    float *h_Kernel,
    int imageW,
    int imageH,
    int kernelR
);




////////////////////////////////////////////////////////////////////////////////
// Main program
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv)
{
    // start logs
    printf("[%s] - Starting...\n", argv[0]);

    float
    *h_Kernel,
    *h_Input,
    *h_Buffer,
    *h_OutputCPU,
    *h_OutputGPU;


    const int imageW = 3072;
    const int imageH = 3072;
    const int iterations = 16;

    StopWatchInterface *hTimer = NULL;

    //Use command-line specified CUDA device, otherwise use device with highest Gflops/s
    findCudaDevice(argc, (const char **)argv);

    sdkCreateTimer(&hTimer);

    printf("Image Width x Height = %i x %i\n\n", imageW, imageH);
    printf("Allocating and initializing host arrays...\n");
    h_Kernel    = (float *)malloc(KERNEL_LENGTH * sizeof(float));
    h_Input     = (float *)malloc(imageW * imageH * sizeof(float));
    h_Buffer    = (float *)malloc(imageW * imageH * sizeof(float));
    h_OutputCPU = (float *)malloc(imageW * imageH * sizeof(float));
    h_OutputGPU = (float *)malloc(imageW * imageH * sizeof(float));
    srand(200);

    for (unsigned int i = 0; i < KERNEL_LENGTH; i++)
    {
        h_Kernel[i] = (float)(rand() % 16);
    }

    for (unsigned i = 0; i < imageW * imageH; i++)
    {
        h_Input[i] = (float)(rand() % 16);
    }

    printf("Allocating and initializing CUDA arrays...\n");
    thrust::block_2d<float> input_block (imageW,imageH);
    thrust::block_2d<float> output_block (imageW,imageH);

    input_block.upload(h_Input);

    printf("Running GPU convolution (%u identical iterations)...\n\n", iterations);

    for (int i = -1; i < iterations; i++)
    {
        //i == -1 -- warmup iteration
        if (i == 0)
        {
            checkCudaErrors(cudaDeviceSynchronize());
            sdkResetTimer(&hTimer);
            sdkStartTimer(&hTimer);
        }

        thrust::convolve(thrust::cuda::shared,&input_block,h_Kernel,KERNEL_LENGTH,&output_block);
    }

    checkCudaErrors(cudaDeviceSynchronize());
    sdkStopTimer(&hTimer);
    double gpuTime = 0.001 * sdkGetTimerValue(&hTimer) / (double)iterations;
    printf("convolutionSeparable, Throughput = %.4f MPixels/sec, Time = %.5f s, Size = %u Pixels, NumDevsUsed = %i, Workgroup = %u\n",
           (1.0e-6 * (double)(imageW * imageH)/ gpuTime), gpuTime, (imageW * imageH), 1, 0);

    printf("\nReading back GPU results...\n\n");
    output_block.download(&h_OutputGPU);

    printf("Checking the results...\n");
    printf(" ...running convolutionRowCPU()\n");
    convolutionRowCPU(
        h_Buffer,
        h_Input,
        h_Kernel,
        imageW,
        imageH,
        KERNEL_RADIUS
    );

    printf(" ...running convolutionColumnCPU()\n");
    convolutionColumnCPU(
        h_OutputCPU,
        h_Buffer,
        h_Kernel,
        imageW,
        imageH,
        KERNEL_RADIUS
    );

    printf(" ...comparing the results`\n");
    double sum = 0, delta = 0;

    for (unsigned i = 0; i < imageW * imageH; i++)
    {
        delta += (h_OutputGPU[i] - h_OutputCPU[i]) * (h_OutputGPU[i] - h_OutputCPU[i]);
        sum   += h_OutputCPU[i] * h_OutputCPU[i];
    }

    double L2norm = sqrt(delta / sum);
    printf(" ...Relative L2 norm: %E\n\n", L2norm);
    printf("Shutting down...\n");



    free(h_OutputGPU);
    free(h_OutputCPU);
    free(h_Buffer);
    free(h_Input);
    free(h_Kernel);

    sdkDeleteTimer(&hTimer);

    if (L2norm > 1e-6)
    {
        printf("Test failed!\n");
        exit(EXIT_FAILURE);
    }

    printf("Test passed\n");
    exit(EXIT_SUCCESS);
}
