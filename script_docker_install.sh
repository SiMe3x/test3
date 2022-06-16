#!/bin/bash

#Check if you make sudo
if [ $USER != "root" ]
then
echo "you need make \"sudo $0\" "
exit $?
fi

#Uninstall old versions
#Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:

apt-get remove docker docker-engine docker.io containerd runc

#Install using the repository

apt-get update

#Set up the repository

apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Add Dockers official GPG key:

mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Use the following command to set up the repository:

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

#Install Docker Engine

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#Verify that Docker Engine is installed correctly by running the hello-world image.

docker run hello-world


echo "The End"
