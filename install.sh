#!/bin/bash

echo "*******************************************************"
echo "Building openfoam-docker-cloud container image"
echo "*******************************************************"

docker image build -t openfoam-docker-cloud:v0.1 .

echo "*******************************************************"
echo "Below are available docker images on your system"
echo "*******************************************************"

docker images

echo "*******************************************************"
echo "Below are the running containers on your system"
echo "*******************************************************"

docker ps

echo "*******************************************************"
echo "Creating and running the OpenFOAM container: enter ./post-compilation.sh to run the post-compilation script"
echo "*******************************************************"

docker run -it --rm openfoam-docker-cloud:v0.1
