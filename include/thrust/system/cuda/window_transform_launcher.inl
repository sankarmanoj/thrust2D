#pragma once
#include <thrust/system/cuda/window_2d.h>

launcher_config generate_launcher_config(Iterator begin,Iterator end)
{
    typedef typename Iterator::base_value_type T;
    long total_operations = end - begin;    //Operations is the length of the vector
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);

    launcher_config mConfiguration;
    mConfiguration.total_operations = total_operations;

    //Compare Stride With Window Size
    bool x_overlap = (begin.stride_x<begin.window_dim_x);
    bool y_overlap = (begin.stride_y<begin.window_dim_y);

    int size_of_row_in_shared;

    //Compute X Size
    if(x_overlap)
      size_of_row_in_shared = begin.block_dim_x;
    else
      size_of_row_in_shared = begin.windows_along_x*begin.window_dim_x;

    //Compute Rows that can fit in Shared Memory
    int rows_per_block_by_memory = properties.sharedMemPerBlock/size_of_row_in_shared;

    //Multi Window Rows Per Block
    if(rows_per_block_by_memory>=begin.block_dim_y)
    {
      if(begin.block_dim_y == rows_per_block_by_memory)
      {
        mConfiguration.rows_per_block_by_windows =1;
      }
      else if(y_overlap)
      {
        mConfiguration.rows_per_block_by_windows = ((rows_per_block_by_memory-begin.window_dim_y)/begin.stride_y);
        mConfiguration.shared_block_dim_y = rows_per_block_by_memory;
      }
      else
      {
        mConfiguration.rows_per_block_by_windows =rows_per_block_by_memory / begin.window_dim_y;
        mConfiguration.shared_block_dim_y = mConfiguration.rows_per_block_by_windows*begin.window_dim_y;
      }
      mConfiguration.operations_per_block = mConfiguration.rows_per_block_by_windows * begin.windows_along_x;
      mConfiguration.shared_block_dim_x = size_of_row_in_shared;

    }
    //Multi Blocks Per Window Row
    else
    {
      mConfiguration.rows_per_block_by_windows = 0;
      mConfiguration.blocks_per_row = ceil((float)size_single_win_row/properties.sharedMemPerBlock));
      mConfiguration.operations_per_block = ceil(((float)begin.windows_along_x)/mConfiguration.blocks_per_row);
      mConfiguration.shared_block_dim_x = ceil(((float)operations_per_block)/size_of_row_in_shared);
      mConfiguration.shared_block_dim_y = begin.window_dim_y;
    }

    mConfiguration.operations_per_thread = ceil((float)mConfiguration.operations_per_block/properties.maxThreadsPerBlock);


}
