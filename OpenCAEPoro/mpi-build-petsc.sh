#!/bin/bash


# source /es01/paratera/parasoft/module.sh  
# source /es01/paratera/parasoft/oneAPI/2022.1/setvars.sh
# module load cmake/3.17.1 gcc/7.3.0-para 

export CC=mpiicc
export CXX=mpiicpc

# users specific directory paths
export PARMETIS_DIR=/es01/paratera/sce0588/zl/ASC/parmetis-4.0.3
export PARMETIS_BUILD_DIR=/es01/paratera/sce0588/zl/ASC/parmetis-4.0.3/build/Linux-x86_64
export METIS_DIR=/es01/paratera/sce0588/zl/ASC/parmetis-4.0.3/metis
export METIS_BUILD_DIR=/es01/paratera/sce0588/zl/ASC/parmetis-4.0.3/build/Linux-x86_64
export PETSC_DIR=/es01/paratera/sce0588/zl/ASC/petsc-3.19.3
export PETSC_ARCH=petsc_install
export PETSCSOLVER_DIR=/es01/paratera/sce0588/zl/ASC/petsc_solver


export CPATH=/es01/paratera/sce0588/zl/ASC/petsc-3.19.3/include/:$CPATH
export CPATH=/es01/paratera/sce0588/zl/ASC/petsc-3.19.3/petsc_install/include/:/es01/paratera/sce0588/zl/ASC/parmetis-4.0.3/metis/include:/es01/paratera/sce0588/zl/ASC/parmetis-4.0.3/include:$CPATH
export CPATH=/es01/paratera/sce0588/zl/ASC/lapack-3.11/CBLAS/include/:$CPATH



# install
rm -fr build; mkdir build; cd build;

echo "cmake -DUSE_PETSCSOLVER=ON -DUSE_PARMETIS=ON -DUSE_METIS=ON -DCMAKE_VERBOSE_MAKEFILE=OFF -DCMAKE_BUILD_TYPE=Release .."
cmake -DUSE_PETSCSOLVER=ON -DUSE_PARMETIS=ON -DUSE_METIS=ON -DCMAKE_VERBOSE_MAKEFILE=OFF -DCMAKE_BUILD_TYPE=Release ..

echo "make -j 32"
make -j 32

echo "make install"
make install
