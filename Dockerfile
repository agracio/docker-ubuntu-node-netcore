FROM ubuntu:latest

# update apt-get
RUN apt-get update -y && apt-get -y upgrade

# install curl
RUN apt-get install curl -y

# install sudo
RUN apt-get install sudo -y
