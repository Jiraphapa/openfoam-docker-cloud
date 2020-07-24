#!/bin/bash

echo "*******************************************************"
echo "Installing Docker on your system:"
echo "*******************************************************"

sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl enable docker
docker --version

sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

echo "*******************************************************"
echo "Pulling jiraphapa/openfoam-docker-cloud container image"
echo "*******************************************************"

docker pull jiraphapa/openfoam-docker-cloud

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

docker run -it --rm jiraphapa/openfoam-docker-cloud
