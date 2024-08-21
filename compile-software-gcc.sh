#!/bin/bash

# export_env
export CC=mpicc
export CXX=mpicxx
DEROOT="$OPENCAE_PROJECT_ROOT/depend-install"

#petsc_solver
export CPATH=$DEROOT/lapack-3.11/CBLAS/include:$DEROOT/lapack-3.11/LAPACKE/include:$CPATH
export LD_LIBRARY_PATH=$DEROOT/lapack-3.11:$LD_LIBRARY_PATH

rm -r $OPENCAE_PROJECT_ROOT/petsc_solver/build/ $OPENCAE_PROJECT_ROOT/petsc_solver/lib/libpetsc_solver.a
mkdir $OPENCAE_PROJECT_ROOT/petsc_solver/build/
cd $OPENCAE_PROJECT_ROOT/petsc_solver/build/
# cmake
cmake ..
make -j
cp libpetsc_solver.a ../lib/

#opencae
export PARMETIS_DIR=$DEROOT/parmetis-4.0.3
export PARMETIS_BUILD_DIR=$DEROOT/parmetis-4.0.3/build/Linux-x86_64
export METIS_DIR=$DEROOT/parmetis-4.0.3/metis
export METIS_BUILD_DIR=$DEROOT/parmetis-4.0.3/build/Linux-x86_64
export PETSC_DIR=$DEROOT/petsc-3.19.3
export PETSC_ARCH=petsc_install
export PETSCSOLVER_DIR=$OPENCAE_PROJECT_ROOT/petsc_solver
export CPATH=$DEROOT/petsc-3.19.3/include:$CPATH
export CPATH=$DEROOT/petsc-3.19.3/petsc_install/include:$DEROOT/parmetis-4.0.3/metis/include:$DEROOT/parmetis-4.0.3/include:$CPATH
rm -r $OPENCAE_PROJECT_ROOT/OpenCAEPoro/build/ $OPENCAE_PROJECT_ROOT/OpenCAEPoro/testOpenCAEPoro
mkdir $OPENCAE_PROJECT_ROOT/OpenCAEPoro/build/
cd $OPENCAE_PROJECT_ROOT/OpenCAEPoro/build/
# cmake
cmake -DUSE_PETSCSOLVER=ON -DUSE_PARMETIS=ON -DUSE_METIS=ON -DCMAKE_VERBOSE_MAKEFILE=OFF -DCMAKE_BUILD_TYPE=Release ..
make -j16
make install
cd $OPENCAE_PROJECT_ROOT
