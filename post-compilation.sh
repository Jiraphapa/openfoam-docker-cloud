#!/bin/bash

mkdir -p $FOAM_RUN
cd $FOAM_RUN
cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily ./
cd pitzDaily
blockMesh
simpleFoam
