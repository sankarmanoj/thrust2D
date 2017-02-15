__constant__ float c_weights[2048];
struct floatD
{
  int N;
  float *data;
  __host__ __device__  float& operator[] (long index) const
  {
    return data[index*N];
  }
};
class dotProductFunctor
{
public:
  int D;
  dotProductFunctor(int D)
  {
    this->D = D;
  }
  __device__ float operator() (floatD &vector)
  {
    float temp = 0;
    for(int i = 0; i<D;i++)
    {
      temp+=vector[i]*c_weights[i];
    }
    return temp;
  }
};
class dotProductFunctorNC
{
public:
  int D;
  float * weights;
  dotProductFunctorNC(int D,float * weights)
  {
    this->D = D;
    this->weights = weights;
  }
  __device__ float operator() (floatD &vector)
  {
    float temp = 0;
    for(int i = 0; i<D;i++)
    {
      temp+=vector[i]*weights[i];
    }
    return temp;
  }
};
class squareOp
{
public:
  __host__ __device__ float operator() (float index) const
  {
    return index*index;
  }
};
