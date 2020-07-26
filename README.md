# openfoam-docker-gcp
 
Running a containerized OpenFOAM in Google Cloud Platform environment (GCP). 

## Getting Started

These instructions will take you through the creation of GCP VM instance, creating and running a Docker image and running the post-installation script to test the containerized OpenFOAM installation.

### Creating a GCP VM instance

1. In the Google Cloud Console, go to the **VM instances** page.
2. Select your project and click **Continue**.
3. Click **Create instance**.
4. Specify a **Name** and **Region** for your instance.
5. In the **Boot disk** section, click **Change** to configure your boot disk, change the **size (GB)** to **20** (or 10 if you are building only 1 container image)
6. Select a tick box **Deploy a container image to this VM instance**.
7. In the **Container image** text box, put the url `docker.io/jiraphapa/openfoam-docker-cloud:latest`
8. Click the **Create** button to create and start the instance.

This will create a VM instance with the Container-Optimized OS and pre-installed Docker runtime. You can access the command-line interface of an instance via ssh to the VM's External IP address or from the GCP console.



## Creating and running a Docker image 
You may create and run Docker image built from a Dockerfile or by pulling image from the Docker hub repository.
### Creating and running image built from a Dockerfile
Using the installation script, it will automatically build, create and run the OpenFOAM container from Dockerfile

1. Clone the repo and navigate into the directory
```sh
$ git clone https://github.com/Jiraphapa/openfoam-docker-gcp.git
$ cd openfoam-docker-gcp/
```
2. Run the installation script to build, create and run the OpenFOAM container with a bash shell
```sh
$ chmod +x install.sh
$ sh install.sh
```
4. Run the post-compilation script to test the container
```sh
$ ./post-compilation.sh
```
### Creating and running image built from the Docker hub repository
If you are using GCP and have chosen **Deploy a container image to this VM instance** during the setup, it will automatically pull an image from the Docker hub repository from the specified url. 

You can also manually pull the image from the repository
```sh
$ docker pull jiraphapa/openfoam-docker-cloud
```
then create and run the post-compilation script to test the container (clone the Github repo first)
```sh
$ docker run -it --rm jiraphapa/openfoam-docker-cloud
$ ./post-compilation.sh
```

the option `-it` in `docker run` connects the container to terminal and `--rm` removes container automatically after it exits

## Acknowledgments

Google Cloud Platform - Compute Engine How-to guides (`https://cloud.google.com/compute/docs/how-to`)
