namespace thrust
{
	void calculate_launch_parameters (int &NUM_THREADS,int &NUM_BLOCKS)
	{
		// At This Point Of Time This Is A Dummy Function.
		// It Just Sets Constant Values To The Parameters.

		NUM_THREADS = 1024;
		NUM_BLOCKS = 26;
	}

	void calculate_launch_parameters_transpose (int &NUM_THREADS,int &NUM_BLOCKS,int matrix_dimension)
	{
		NUM_THREADS = 1024;
		NUM_BLOCKS = matrix_dimension/NUM_THREADS;
	}

	__device__
	void calculate_tile_size (int &TILE_DIM)
	{
		TILE_DIM = 32;
	}
}
