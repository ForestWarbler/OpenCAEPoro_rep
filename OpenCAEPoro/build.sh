#!/bin/bash

# export_env
export CC=mpiicc
export CXX=mpiicpc
DEROOT="$OPENCAE_PROJECT_ROOT/depend-install"

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