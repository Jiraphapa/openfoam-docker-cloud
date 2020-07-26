# openfoam-docker-cloud
 
Running a containerized OpenFOAM in Google Cloud Platform (GCP) and AWS EC2 environment. 

## Getting Started

These instructions will take you through the creation of VM instance, creating and running a Docker image and running the post-installation script to test the containerized OpenFOAM installation.

### Creating a GCP VM instance

1. In the Google Cloud Console, go to the **VM instances** page.
2. Select your project and click **Continue**.
3. Click **Create instance**.
4. Specify a **Name** and **Region** for your instance.
5. In the **Boot disk** section, click **Change** to configure your boot disk, change the **Operating System** to **Container Optimized OS** (and **Size (GB)** to **20** if you are building more than 1 container image) then click **Select**
6. (Optional) Select a tick box **Deploy a container image to this VM instance**.
7. (Optional) In the **Container image** text box, put the url `docker.io/jiraphapa/openfoam-docker-cloud:latest`
8. Click the **Create** button to create and start the instance.

This will create a VM instance with the Container-Optimized OS, pre-installed Docker runtime and packages. You can access the command-line interface of an instance via ssh to the VM's External IP address or from the GCP console ([How to connect to your instances?](https://cloud.google.com/compute/docs/instances/connecting-to-instance#console))

![GCP GIF](https://raw.githubusercontent.com/Jiraphapa/my-gif-repo/master/gcp.gif)

### Creating a AWS EC2 instance (free-tier)

1. In the Amazon EC2 console, select **Launch a virtual machine** with EC2.
2. In Step 1: Choose an Amazon Machine Image (AMI), find an **Amazon Linux AMI** (with AWS command line tools) at the top of the list and choose Select.
3. (Optional) Configure Step 2 through Step 5.
3. (Optional) In Step 6: Configure Security Group, in the **Source** section select **My IP**.
4. Click **Review and Launch**.
5. Click **Launch**.
6. Create or choose an existing **key pair** for SSH connection.
7. Click **Launch Instances**.

This will create an AWS EC2 VM instance. You can access the command-line interface of an instance via ssh to the VM's External IP address using the private key/key pair file (see [How to connect to your Linux instance using SSH?](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html?icmpid=docs_ec2_console))

![AWS GIF](https://<span></span>raw.githubusercontent.com/Jiraphapa/my-gif-repo/master/aws.gif)

### Installing Docker (and Git) on AWS EC2 instance 

1. Download and run the AWS setup script 
```sh
$ wget https://raw.githubusercontent.com/Jiraphapa/openfoam-docker-cloud/master/aws-setup-amazon-linux.sh
$ chmod +x aws-setup-amazon-linux.sh
$ sh aws-setup-amazon-linux.sh
```
2. Log out and log back in again to pick up the new docker group permissions. You can accomplish this by closing your current SSH terminal window and reconnecting to your instance in a new one. Your new SSH session will have the appropriate docker group permissions (so that you can execute Docker commands without using `sudo`). 

## Creating and running a Docker image 
You may create and run Docker image built from a Dockerfile or by pulling image from the Docker hub repository.
### Creating and running image built from a Dockerfile
Using the installation script, it will automatically build, create and run the OpenFOAM container from Dockerfile

1. Clone the repo and navigate into the directory
```sh
$ git clone https://github.com/Jiraphapa/openfoam-docker-cloud.git
$ cd openfoam-docker-cloud/
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
### Creating and running image from the Docker hub repository
If you are using GCP and have chosen **Deploy a container image to this VM instance** during the setup, it will automatically pull an image from the Docker hub repository from the specified url. 

You can manually pull the image from the repository
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
* [Google Cloud Platform - Compute Engine How-to guides](https://cloud.google.com/compute/docs/how-to)
* [Amazon Elastic Container Service - Developer Guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide)
