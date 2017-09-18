#!/bin/bash
arg=$1
dir=`pwd`
target=${dir##*/}

if [ "$arg" != "-f" ]; then
  source ../Scripts/set_mpidist.sh ib
  if [ $mpi_error -eq 1 ]; then
    exit
  fi
  if [ $setup_fortran -eq 1 ]; then
    source $IFORT_COMPILER/bin/compilervars.sh intel64
  fi
fi

echo Building $target with $MPIDIST
make -j4 MPIFORT="$MPIFORT" VPATH="../../Source" -f ../makefile $target
