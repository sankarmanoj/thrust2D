#!/bin/bash
for i in {0..300..100}
  do
    python genfiles1.py $i
    scp ./values.txt sankar@mic0:/home/sankar/	 
    ssh sankar@mic0 "export LD_LIBRARY_PATH=/home/sankar; export OMP_NUM_THREADS=60; /home/sankar/omp_descent_mic.o 10 0.01;" >> native_gr.log
    ssh sankar@mic0 "export LD_LIBRARY_PATH=/home/sankar; export OMP_NUM_THREADS=60; /home/sankar/omp_native_mic.o 10 0.01;" >> thrust_gr.log 
  done
