class compressFunctor
{
public:
	__device__  void operator() (int &x) const
	{
		x =  x*255;
	}
};
class extractFunctor
{
public:
	__device__ float operator() (int &x) const
	{

		float y  = exp((float)x/255);
		return y;
	}
};

class binarizeFunctor
{
	float threshold;
	float maxValue = 3.0f;
	public:
	binarizeFunctor(float t)
	{
		this->threshold = t;
	}
	binarizeFunctor(float t, float max)
	{
			this->threshold = t;
			this->maxValue = max;
	}
	__device__ int operator() (float &x) const
	{
		if(x>threshold&&x<maxValue)
		{
			return 1;
		}
		else{
			return 0;
		}
	}
};
class erodeTransformFunctor
{
public:
	__device__ int operator() (const thrust::window_2D<int> &w,const thrust::window_2D<int> &v) const
	{
		int minvalue = 1;
		for(int i = 0; i<w.window_dim_x;i++)
		{
			for(int j = 0; j<w.window_dim_y;j++)
			{
				minvalue *=w[i][j];
			}
		}

		v[(v.window_dim_y-1)/2][(v.window_dim_x-1)/2]=minvalue;
		return 4;
	}
};
class erodeFunctor
{
public:
	__device__ void operator() (const thrust::window_2D<int> &w) const
	{
		int minvalue =w[0][1]*w[2][1]*w[1][0]*w[1][2]*w[1][1];
		w[(w.window_dim_y-1)/2][(w.window_dim_x-1)/2]=minvalue;
	}
};
class dilateFunctor
{
public:
	__device__ void operator() (const thrust::window_2D<int> &w) const
	{
		int maxvalue = w[0][1]+w[2][1]+w[1][0]+w[1][2]+w[1][1];
		if(maxvalue>1)
		maxvalue =1;
		w[(w.window_dim_y-1)/2][(w.window_dim_x-1)/2]=maxvalue;
	}
};
class square
{

public:
 __host__ __device__ void operator() (float &lhs) const
  {
		lhs = lhs*lhs;
	}
};
class SRADFunctor1
{
public:
	int cols;
	int rows;
	float q0sqr;

	SRADFunctor1 (int cols, int rows, float q0sqr)
	{
		this->cols = cols;
		this->rows = rows;
		this->q0sqr = q0sqr;
	}
	__device__ int operator() (const thrust::window_2D<float> &w,const thrust::window_2D<float> &v) const
	{
		int ty = w.window_dim_y/2;
		int tx = w.window_dim_x/2;
		int N = ty-1;
		int S = ty+1;
		int W = tx-1;
		int E = tx+1;

		float jc,n,s,we,e,g2,l,num,den,qsqr,c;
		jc = (float) w[ty][tx];
		n  = (float) w[N][tx] - jc;
    s  = (float) w[S][tx] - jc;
    we = (float) w[ty][W]  - jc;
    e  = (float) w[ty][E] - jc;


    g2 = ( n * n + s * s + we * we + e * e ) / (jc * jc);

    l = ( n + s + we + e ) / jc;

		num  = (0.5*g2) - ((1.0/16.0)*(l*l)) ;
		den  = 1 + (.25*l);
		qsqr = num/(den*den);
		// diffusion coefficent (equ 33)
		den = (qsqr-q0sqr) / (q0sqr * (1+q0sqr)) ;
		c = 1.0 / (1.0+den) ;


	  // saturate diffusion coefficent
		if(c<0)
		{
			c=0;
		}
		else if(c>1)
		{
			c=1;
		}
		v[ty][tx] = c;

		if(w.start_y == 0)
			w[N][tx] = w[ty][tx];
		if(w.start_y == rows - w.window_dim_y)
			w[S][tx] = w[ty][tx];
		if(w.start_x == 0)
			w[ty][W] = w[ty][tx];
		if(w.start_x == cols - w.window_dim_x)
			w[ty][E] = w[ty][tx];
		if(w.start_y == 0 && w.start_x == 0)
			w[N][W] = w[ty][tx];
		if(w.start_y == rows - w.window_dim_y && w.start_x == cols - w.window_dim_x)
			w[S][E] = w[ty][tx];
		if(w.start_x == 0 && w.start_y == rows - w.window_dim_y)
			w[S][W] = w[ty][tx];
		if(w.start_x == cols - w.window_dim_x && w.start_y == 0)
			w[N][E] = w[ty][tx];

		return 0.0;

	}

};
class printFunctor
{
public:
	__device__ void operator() (const int &x) const
	{
		printf(" %d \n",x);
	}
};

class SRADFunctor2
{
public:
	int cols;
	int rows;
	float lambda;
	float q0sqr;

	SRADFunctor2 (int cols,int rows,float lambda,float q0sqr)
	{
		this->cols = cols;
		this->rows = rows;
		this->lambda = lambda;
		this->q0sqr = q0sqr;
	}

	__device__ int operator() (const thrust::window_2D<float> &w, const thrust::window_2D<float> &c) const
	{
		int ty = w.window_dim_y/2;
		int tx = w.window_dim_x/2;
		int N = ty-1;
		int S = ty+1;
		int W = tx-1;
		int E = tx+1;

		float cc,cn,cs,cw,ce;

		cc = (float) c[ty][tx];

		cn  = cc;
    cs  = (float) c[S][tx];
    cw  = cc;
    ce  = (float) c[ty][E];

		float jc,n,s,we,e;
		jc = (float) w[ty][tx];
		n  = (float) w[N][tx] - jc;
		s  = (float) w[S][tx] - jc;
		we = (float) w[ty][W]  - jc;
		e  = (float) w[ty][E] - jc;

		// divergence (equ 58)
		float d_D = cn*n +cs*s + ce*e + cw*we;
		// image update (equ 61)
		// w[ty][tx];
		w[ty][tx] =  w[ty][tx] + 0.25 * lambda * d_D;

		if(w.start_y == 0)
			w[N][tx] = w[ty][tx];
		if(w.start_y == rows - w.window_dim_y)
			w[S][tx] = w[ty][tx];
		if(w.start_x == 0)
			w[ty][W] = w[ty][tx];
		if(w.start_x == cols - w.window_dim_x)
			w[ty][E] = w[ty][tx];
		if(w.start_y == 0 && w.start_x == 0)
			w[N][W] = w[ty][tx];
		if(w.start_y == rows - w.window_dim_y && w.start_x == cols - w.window_dim_x)
			w[S][E] = w[ty][tx];
		if(w.start_x == 0 && w.start_y == rows - w.window_dim_y)
			w[S][W] = w[ty][tx];
		if(w.start_x == cols - w.window_dim_x && w.start_y == 0)
			w[N][E] = w[ty][tx];

		// printf("%f\n", (int) w[ty][tx]);
		return 0.0f;
	}

};
