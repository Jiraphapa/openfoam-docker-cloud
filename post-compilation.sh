#!/bin/bash

mkdir -p $FOAM_RUN
run
cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily ./
cd pitzDaily
blockMesh
simpleFoam
