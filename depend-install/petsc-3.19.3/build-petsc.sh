#!/bin/bash


source /es01/paratera/parasoft/module.sh  
source /es01/paratera/parasoft/oneAPI/2022.1/setvars.sh
module load cmake/3.17.1 gcc/7.3.0-para 



export PETSC_DIR=/es01/paratera/sce0588/zl/ASC/petsc-3.19.3
export PETSC_ARCH=petsc_install

./configure CC=mpiicc CXX=mpiicpc \
    --with-fortran-bindings=0 \
	--with-hypre-dir=/es01/paratera/sce0588/zl/ASC/hypre-2.28.0/install \
    --with-debugging=0 \
    COPTFLAGS="-O3" \
    CXXOPTFLAGS="-O3" \


make -j 20 PETSC_DIR=/es01/paratera/sce0588/zl/ASC/petsc-3.19.3 PETSC_ARCH=petsc_install all
make all check    
