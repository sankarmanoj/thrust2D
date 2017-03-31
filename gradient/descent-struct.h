struct floatD
{
  int N;
  float *data;
  __host__ __device__  float& operator[] (long index) const
  {
    return data[index*N];
  }
};

template<class W>
class dotProductFunctor
{
public:
  int D;
  W weights;
  dotProductFunctor(int D,W weights)
  {
    this->D = D;
    this->weights = weights;
  }
  __host__ __device__ float operator() (floatD &vector,float y)
  {
    float temp = 0;
    for(int i = 0; i<D;i++)
    {
      temp+=vector[i]*weights[i];
    }
    return temp - y;
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

class update_weights
{
  float learn;
public:
  update_weights(float learn)
  {
    this->learn=learn;
  }
  __host__ __device__ float operator() (float &w, float &g)
  {
    return w - learn*g;
  }
};
