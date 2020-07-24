# Use a Docker base Image Ubuntu 18.04 (bionic)
FROM ubuntu:bionic

# Update and install dependencies
RUN apt-get update \
	&& apt-get install -y \
		ssh \
		sudo \
		wget \
		software-properties-common 

# Install OpenFOAM7 
RUN sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -" ;\
	add-apt-repository http://dl.openfoam.org/ubuntu ;\
	apt-get update ;\
	apt-get install -y  openfoam7 ;\
	echo "source /opt/openfoam7/etc/bashrc" >> ~/.bashrc 
	
COPY post-compilation.sh .
RUN sudo chmod +x post-compilation.sh
CMD ["openfoam_run.sh"]
