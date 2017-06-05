#include "srad.h"
#include <stdio.h>

class compressFunctor
{
public:
	__device__ void operator() (float &x)
	{
		float y  = 255*log(x);
		x=y;
	}
};
class extractFunctor
{
public:
	__device__ void operator() (float &x)
	{
		x = exp((float)x/255);
	}
};

class square
{

public:
	__host__ __device__ float operator() (float &lhs)
	{
		return lhs*lhs;
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
	__device__ float operator() (thrust::window_2d<float> &w, thrust::window_2d<float> &v)
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
		// printf("%f\n",qsqr);
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
		return 0.0f;
	}
};
class printFunctor
{
public:
	__device__ void operator() (float &x) const
	{
		printf(" %f \n",x);
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

	__device__ float operator() (thrust::window_2d<float> &c, thrust::window_2d<float> &w)
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
		w[ty][tx] = (float) w[ty][tx] + 0.25 * lambda * d_D;
		return 0.0f;
	}
};
