#!/bin/bash

#Flags
export CC=mpiicc
export CXX=mpiicpc
export FC=mpiifort
export CFLAGS="-O3 -xHost -fp-model precise -qopenmp -diag-disable=10441"
export CMAKE_C_FLAGS="-O3 -xHost -fp-model precise"
export FFLAGS="-O3 -fp-model precise -recursive -assume protect_parens -xHost -qopenmp"
export cc=mpiicc
export cxx=mpiicpc

#Directory
# OPENCAE_PROJECT_ROOT="/data/u23336338/homework/lab_1_1/opencaeporo_2"

rm -r $OPENCAE_PROJECT_ROOT/depend-install
mkdir $OPENCAE_PROJECT_ROOT/depend-install
DEROOT="$OPENCAE_PROJECT_ROOT/depend-install"
cp -r $OPENCAE_PROJECT_ROOT/lapack-3.11 $DEROOT
cp -r $OPENCAE_PROJECT_ROOT/parmetis-4.0.3 $DEROOT
cp -r $OPENCAE_PROJECT_ROOT/hypre-2.28.0 $DEROOT
cp -r $OPENCAE_PROJECT_ROOT/petsc-3.19.3 $DEROOT

#Compiling
#lapack
cd $DEROOT/lapack-3.11
make blaslib -j 64
make cblaslib -j 64
make lapacklib -j 64
make lapackelib -j 64

#parmetis
cd $DEROOT/parmetis-4.0.3
make config cc=mpiicc prefix=$DEROOT/parmetis-4.0.3/parmetis-install
make -j 64
make install

#hypre
cd $DEROOT/hypre-2.28.0/src
make clean
./configure --prefix=$DEROOT/hypre-2.28.0/install --with-MPI --enable-shared
make -j 64
make install

#petsc-3.19.3
source /data/software/install/oneapi/setvars.sh
cd $DEROOT/petsc-3.19.3
#mkdir $DEROOT/petsc
#PETROOT="$DEROOT/petsc"
export PETSC_DIR=$DEROOT/petsc-3.19.3
export PETSC_ARCH=petsc_install
export COPTFLAGS="-O3 -xHost -fp-model precise -qopenmp -diag-disable=10441"
export CXXOPTFLAGS="-O3 -fp-model precise -recursive -assume protect_parens -xHost -qopenmp"

./configure CC=mpiicc CXX=mpiicpc FC=mpiifort --with-fortran-bindings=0 --with-hypre-dir=$DEROOT/hypre-2.28.0/install --with-debugging=0 CFLAGS=$CFLAGS
make PETSC_DIR=$DEROOT/petsc-3.19.3 PETSC_ARCH=petsc_install all -j
make all check

cd $OPENCAE_PROJECT_ROOT

#petsc_solver
#export CC=mpiicc
#export CXX=mpiicpc
#export CPATH=$OPENCAE_PROJECT_ROOT/lapack-3.11/CBLAS/include:$OPENCAE_PROJECT_ROOT/lapack-3.11/LAPACKE/include:$LAPROOT:$CPATH
#export LD_LIBRARY_PATH=$OPENCAE_PROJECT_ROOT/lapack-3.11:$LD_LIBRARY_PATH
#mkdir $DEROOT/petsc_solver
#cd $OPENCAE_PROJECT_ROOT/petsc_solver
#rm -rf build
#mkdir build
#cd build
#cmake ..
#make 
#mv libpetsc_solver.a $DEROOT/petsc_solver/

