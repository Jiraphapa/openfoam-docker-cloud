# Use a Docker base Image Ubuntu 18.04 (bionic)
FROM ubuntu:bionic

# Update and install dependencies
RUN apt-get update \
	&& apt-get install -y \
		ssh \
		sudo \
		wget \
		software-properties-common 

# Create a container user - foam
RUN useradd --user-group --create-home --shell /bin/bash foam ;\
	echo "foam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install OpenFOAM7 
# Add the user to container - foam 
RUN sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -" ;\
	add-apt-repository http://dl.openfoam.org/ubuntu ;\
	apt-get update ;\
	apt-get install -y  openfoam7 ;\
	echo "source /opt/openfoam6/etc/bashrc" >> ~foam/.bashrc 

# Set the default user to foam
USER foam
