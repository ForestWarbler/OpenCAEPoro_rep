#!/bin/bash

# source /es01/paratera/parasoft/module.sh  
# source /es01/paratera/parasoft/oneAPI/2022.1/setvars.sh
# module load cmake/3.17.1 gcc/7.3.0-para 

export CC=mpiicc
export CXX=mpiicpc

export CPATH=/es01/paratera/sce0588/zl/ASC/lapack-3.11/CBLAS/include:/es01/paratera/sce0588/zl/ASC/lapack-3.11/LAPACKE/include:$CPATH
export LD_LIBRARY_PATH=/es01/paratera/sce0588/zl/ASC/lapack-3.11:$LD_LIBRARY_PATH

rm -rf build 
mkdir build
cd build
cmake ..
make
mv libpetsc_solver.a ../lib/


