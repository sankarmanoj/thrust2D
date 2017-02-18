namespace thrust
{
  template<class T>
  T* get_constant_memory_pointer(thrust::detail::normal_iterator<thrust::device_ptr<T>> begin, thrust::detail::normal_iterator<thrust::device_ptr<T>>end)
  {
    int size = end - begin;
    int mem_size = sizeof(T)*size;
    if(mem_size+c_position>65536)
    {
      c_position = 0;
    }
    assert(mem_size+c_position<=65536);
    unsigned char * return_pointer;
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
    printf("%p-%p\n",return_pointer,&size);
    c_position+=mem_size;
    return (T*)return_pointer;


  }
};
