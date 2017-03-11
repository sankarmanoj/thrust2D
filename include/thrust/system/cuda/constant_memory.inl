namespace thrust
{
  template<class T>
  int get_constant_memory_pointer(thrust::detail::normal_iterator<thrust::device_ptr<T>> begin, thrust::detail::normal_iterator<thrust::device_ptr<T>>end)
  {
    int size = end - begin;
    int mem_size = sizeof(T)*size;
    if(mem_size+c_position>CSIZE)
    {
      c_position = 0;
    }
    assert(mem_size+c_position<=CSIZE);
    int return_pointer=0;
    // printf("Size - %d MemSize = %d Starting Position = %d ",size,mem_size,c_position);
    cudaMemcpyToSymbol(c_memory, (&(begin[0])).get(),mem_size,c_position,cudaMemcpyDeviceToDevice);
    cudaError_t err = cudaGetSymbolAddress((void **)&return_pointer,c_memory);
    return_pointer+=c_position;
    if ( cudaSuccess != err )
    {
       fprintf( stderr, "cudaCheckError() failed at %s:%i : %s\n",
                __FILE__, __LINE__, cudaGetErrorString( err ) );
       exit( -1 );
     }
    c_position+=mem_size;
    return return_pointer;
  }


  template<class T>
  int get_constant_memory_pointer(const T* begin,const T* end,cudaMemoryType memType)
  {
    int size = end - begin;
    int mem_size = sizeof(T)*size;
    cudaError_t err;
    if(mem_size+c_position>CSIZE)
    {
      c_position = 0;
    }
    assert(mem_size+c_position<=CSIZE);
    int return_pointer=0;
    // printf("Size - %d MemSize = %d Starting Position = %d ",size,mem_size,c_position);
    if(memType==cudaMemoryTypeDevice)
    {
      err = cudaMemcpyToSymbol(c_memory,begin,mem_size,c_position,cudaMemcpyDeviceToDevice);
      if ( cudaSuccess != err )
      {
         fprintf( stderr, "cudaCheckError() failed at %s:%i : %s\n",
                  __FILE__, __LINE__, cudaGetErrorString( err ) );
         exit( -1 );
       }
    }
    else if(memType==cudaMemoryTypeHost)
    {
      err = cudaMemcpyToSymbol(c_memory, begin,mem_size,c_position,cudaMemcpyHostToDevice);
      if ( cudaSuccess != err )
      {
         fprintf( stderr, "cudaCheckError() failed at %s:%i : %s\n",
                  __FILE__, __LINE__, cudaGetErrorString( err ) );
         exit( -1 );
       }
    }
    return_pointer=c_position/sizeof(T);
    c_position+=mem_size;
    return return_pointer;
  }
};
