echo "*******************************************************"
echo "Installing Docker on your system:"
echo "*******************************************************"

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

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
echo "Creating the OpenFOAM container"
echo "*******************************************************"

docker run -it -d --name openfoam1 jiraphapa/openfoam-docker-cloud

echo "*******************************************************"
echo "Below are the running containers on your system"
echo "*******************************************************"

docker ps

echo "*******************************************************"
echo "Run the testopenfoam.sh script to test the container"
echo "*******************************************************"

