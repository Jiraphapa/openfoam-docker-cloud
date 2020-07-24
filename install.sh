echo "*******************************************************"
echo "Installing Docker on your system:"
echo "*******************************************************"


curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

echo "*******************************************************"
echo "Pulling jiraphapa/openfoam-docker-cloud container image"
echo "*******************************************************"

docker pull jiraphapa/openfoam-docker-cloud

echo "*******************************************************"
echo "Creating and running OpenFOAM container"
echo "*******************************************************"

docker run --restart=always jiraphapa/openfoam-docker-cloud
