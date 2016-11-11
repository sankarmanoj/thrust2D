/**
 * Copyright 1993-2015 NVIDIA Corporation.  All rights reserved.
 *
 * Please refer to the NVIDIA end user license agreement (EULA) associated
 * with this source code for terms and conditions that govern your use of
 * this software. Any use, reproduction, disclosure, or distribution of
 * this software and related documentation outside the terms of the EULA
 * is strictly prohibited.
 *
 */


#ifndef _BICUBICTEXTURE_CU_
#define _BICUBICTEXTURE_CU_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <helper_math.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
// includes, cuda
#include <helper_cuda.h>

typedef unsigned int uint;
typedef unsigned char uchar;

#include "bicubicTexture_kernel.cuh"

cudaArray *d_imageArray = 0;

extern "C"
void initTexture(int imageWidth, int imageHeight, uchar *h_data)
{
    // allocate array and copy image data
    cudaChannelFormatDesc channelDesc = cudaCreateChannelDesc(8, 0, 0, 0, cudaChannelFormatKindUnsigned);
    checkCudaErrors(cudaMallocArray(&d_imageArray, &channelDesc, imageWidth, imageHeight));
    uint size = imageWidth * imageHeight * sizeof(uchar);
    checkCudaErrors(cudaMemcpyToArray(d_imageArray, 0, 0, h_data, size, cudaMemcpyHostToDevice));
    free(h_data);

    // set texture parameters
    tex.addressMode[0] = cudaAddressModeClamp;
    tex.addressMode[1] = cudaAddressModeClamp;
    tex.filterMode = cudaFilterModeLinear;
    tex.normalized = false;    // access with integer texture coordinates

    getLastCudaError("initTexture");

    // Bind the array to the texture
    checkCudaErrors(cudaBindTextureToArray(tex, d_imageArray));

    // bind same array to 2nd texture reference with point sampling
    tex2.addressMode[0] = cudaAddressModeClamp;
    tex2.addressMode[1] = cudaAddressModeClamp;
    tex2.filterMode = cudaFilterModePoint;
    tex2.normalized = false;    // access with integer texture coordinates

    checkCudaErrors(cudaBindTextureToArray(tex2, d_imageArray));
}

extern "C"
void freeTexture()
{
    checkCudaErrors(cudaFreeArray(d_imageArray));
}


// render image using CUDA
extern "C"
void render(int width, int height, float tx, float ty, float scale, float cx, float cy,
            dim3 blockSize, dim3 gridSize, int filter_mode, uchar4 *output,thrust::block_2d<uchar4> &block_d_output)
{
    // call CUDA kernel, writing results to PBO memory
    thrust::window_vector<uchar4> render_window_vector(&block_d_output,1,1,1,1);
    switch (filter_mode)
    {
        case MODE_NEAREST:
            tex.filterMode = cudaFilterModePoint;
            thrust::for_each(render_window_vector.begin(),render_window_vector.end(),d_render_functor(tx,ty,scale,cx,cy));
            d_render<<<gridSize, blockSize>>>(output, width, height, tx, ty, scale, cx, cy);
            break;

        case MODE_BILINEAR:
            tex.filterMode = cudaFilterModeLinear;
            thrust::for_each(render_window_vector.begin(),render_window_vector.end(),d_render_functor(tx,ty,scale,cx,cy));
            d_render<<<gridSize, blockSize>>>(output, width, height, tx, ty, scale, cx, cy);
            break;

        case MODE_BICUBIC:
            tex.filterMode = cudaFilterModePoint;
            thrust::for_each(render_window_vector.begin(),render_window_vector.end(),d_renderBicubic_functor(tx,ty,scale,cx,cy));
            // thrust::for_each(thrust::cuda::shared,render_window_vector.begin(),render_window_vector.end(),d_renderBicubic_functor(tx,ty,scale,cx,cy));
            d_renderBicubic<<<gridSize, blockSize>>>(output, width, height, tx, ty, scale, cx, cy);
            break;

        case MODE_FAST_BICUBIC:
            tex.filterMode = cudaFilterModeLinear;
            thrust::for_each(render_window_vector.begin(),render_window_vector.end(),d_renderFastBicubic_functor(tx,ty,scale,cx,cy));
            d_renderFastBicubic<<<gridSize, blockSize>>>(output, width, height, tx, ty, scale, cx, cy);
            break;

        case MODE_CATROM:
            tex.filterMode = cudaFilterModePoint;
            thrust::for_each(render_window_vector.begin(),render_window_vector.end(),d_renderCatrom_functor(tx,ty,scale,cx,cy));
            d_renderCatRom<<<gridSize, blockSize>>>(output, width, height, tx, ty, scale, cx, cy);
            break;
    }

    getLastCudaError("kernel failed");
}

#endif
