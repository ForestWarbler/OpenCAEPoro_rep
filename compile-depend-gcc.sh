#!/bin/bash

#Flags
export CC=mpicc
export CXX=mpicxx
export FC=mpifort
export CFLAGS="-O3 -xHost"
export CMAKE_C_FLAGS="-O3"
export FFLAGS="-O3"
export cc=mpicc
export cxx=mpicxx

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
make blaslib -j
make cblaslib -j
make lapacklib -j
make lapackelib -j

#parmetis
cd $DEROOT/parmetis-4.0.3
make config prefix=$DEROOT/parmetis-4.0.3/parmetis-install
make -j
make install

#hypre
cd $DEROOT/hypre-2.28.0/src
make clean
./configure --prefix=$DEROOT/hypre-2.28.0/install --with-MPI --enable-shared
make -j 64
make install

#petsc-3.19.3
#source /data/software/install/oneapi/setvars.sh
cd $DEROOT/petsc-3.19.3
#mkdir $DEROOT/petsc
#PETROOT="$DEROOT/petsc"
export PETSC_DIR=$DEROOT/petsc-3.19.3
export PETSC_ARCH=petsc_install
export COPTFLAGS="-O3 -xHost"
export CXXOPTFLAGS="-O3 -xHost"

./configure CC=mpicc CXX=mpicxx FC=mpifort --with-fortran-bindings=0 --with-hypre-dir=$DEROOT/hypre-2.28.0/install --with-debugging=0 CFLAGS=$CFLAGS
make PETSC_DIR=$DEROOT/petsc-3.19.3 PETSC_ARCH=petsc_install all -j
make all check MPIEXEC="srun --partition=mars"

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

