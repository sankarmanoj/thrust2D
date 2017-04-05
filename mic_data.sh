#!/bin/bash
for i in {0..300..100}
  do 
    ./omp_particle_filter.o -x 128 -y 128 -z 1000 -np $i >> native_pf.log 
  done
